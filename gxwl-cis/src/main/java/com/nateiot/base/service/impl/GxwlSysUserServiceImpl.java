package com.nateiot.base.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.common.SessionUtil;
import com.nateiot.base.domain.GxwlSysUser;
import com.nateiot.base.domain.GxwlSysUserRole;
import com.nateiot.base.domain.RegisterRecord;
import com.nateiot.base.repository.GxwlSysUserDao;
import com.nateiot.base.repository.GxwlSysUserRoleDao;
import com.nateiot.base.service.GxwlSmsService;
import com.nateiot.base.service.GxwlSysUserService;
import com.nateiot.core.common.PropertiesUtil;
import com.nateiot.core.common.security.HashUtil;
import com.nateiot.core.service.impl.BaseServiceImpl;

/**
 * @author Will WM. Zhang
 * 
 */
@Service(value = "gxwlSysUserService")
@Transactional(readOnly = true)
public class GxwlSysUserServiceImpl extends
		BaseServiceImpl<GxwlSysUserDao, GxwlSysUser, Integer> implements
		GxwlSysUserService {

	@Autowired
	private GxwlSysUserDao gxwlSysUserDao;

	@Autowired
	private GxwlSysUserRoleDao gxwlSysUserRoleDao;
	
	@Autowired
	private GxwlSmsService smsService;

	@Autowired
	public GxwlSysUserServiceImpl(GxwlSysUserDao gxwlSysUserDao) {
		super(gxwlSysUserDao);
	}
	
//	@Override
//	public boolean checkGxwlSysUserEmpcode(String empcode) {
//		GxwlSysUser gxwlSysUser = gxwlSysUserDao.findByEmpcode(empcode);
//		return gxwlSysUser == null ? true : false;
//	}
//
	
	@Override
	public Map<String, Object> checkGxwlSysUserName(Integer userId, String userName) {
		resetResultMap();
		try {
			GxwlSysUser gxwlSysUser = gxwlSysUserDao.findByUserName(userName);
			if (gxwlSysUser == null) {
				setResultStatus(0, "输入的用户账号可用");
			}
			else {
				if (gxwlSysUser.getUserId().equals(userId)) {
					setResultStatus(0, "输入的用户账号可用");
				}
				else {
					setResultStatus(1, "输入的用户账号已经存在");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "检查用户账号时系统出错: " + e.getMessage());
		}
		return resultMap;
	}

	@Transactional
	@Override
	public Map<String, Object> modifyCurrentUserPassword(String oldPassword, String newPassword) {
		resetResultMap();
		try {
			GxwlSysUser user = gxwlSysUserDao.findOne(SessionUtil.getCurrentUser().getUserId());
			String salt = user.getUserName() + user.getSalt();
			String originalPassword = user.getPassword();
			String checkedPassword = HashUtil.sha256Hex(oldPassword, salt, DEFAULT_HASH_INTERATIONS);
			if (!checkedPassword.equals(originalPassword)) {
				setResultStatus(1, "输入的旧密码不正确");
				return resultMap;
			} else {
				newPassword = HashUtil.sha256Hex(newPassword, salt, DEFAULT_HASH_INTERATIONS);
				user.setPassword(newPassword);
				setResultStatus(0, "修改密码成功");
				return resultMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "修改密码时系统出错: " + e.getMessage());
			return resultMap;
		}
	}
	
	@Override
	public Map<String, Object> checkCurrentUserOldPassword(String oldPassword) {
		resetResultMap();
		try {
			GxwlSysUser user = gxwlSysUserDao.findOne(SessionUtil.getCurrentUser().getUserId());
			String salt = user.getUserName() + user.getSalt();
			String originalPassword = user.getPassword();
			String checkedPassword = HashUtil.sha256Hex(oldPassword, salt, DEFAULT_HASH_INTERATIONS);
			if (checkedPassword.equals(originalPassword)) {
				setResultStatus(0, "输入的旧密码正确");
			} else {
				setResultStatus(1, "输入的旧密码不正确");
			}
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "检查旧密码时系统出错: " + e.getMessage());
			return resultMap;
		}
	}

	@Override
	public GxwlSysUser findByUserName(String userName) {
		return gxwlSysUserDao.findByUserName(userName);
	}

	@Transactional
	@Override
	public Map<String, Object> doSave(GxwlSysUser gxwlSysUser) {
		resetResultMap();
		try {
			Integer userId = gxwlSysUser.getUserId();
			if (userId == null) {
				setDefaultPassword(gxwlSysUser);
				gxwlSysUserDao.save(gxwlSysUser);
				List<GxwlSysUserRole> userRoles = gxwlSysUser.getUserRoles();
				if (userRoles != null) {
					for (GxwlSysUserRole userRole : userRoles) {
						userRole.setUserId(gxwlSysUser.getUserId());
					}
				}
			} else {
				GxwlSysUser u = gxwlSysUserDao.findOne(userId);
				List<GxwlSysUserRole> olds = u.getUserRoles();
				List<GxwlSysUserRole> news = gxwlSysUser.getUserRoles();
				if (news == null) {
					gxwlSysUserRoleDao.deleteInBatch(olds);
				} else {
					for (GxwlSysUserRole userRole : olds) {
						if (!news.contains(userRole)) {
							gxwlSysUserRoleDao.delete(userRole);
						}
					}
				}
				gxwlSysUser.setPassword(u.getPassword());
				gxwlSysUser.setSalt(u.getSalt());
			}
			setResultStatus(0, "保存成功");
			resultMap.put(RESULT_ROW, gxwlSysUserDao.save(gxwlSysUser));
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "保存时系统出错: " + e.getMessage());
		}
		return resultMap;
	}

	@Override
	@Transactional
	public Map<String, Object> resetPassword(Integer userId) {
		resetResultMap();
		try {
			GxwlSysUser gxwlSysUser = gxwlSysUserDao.findOne(userId);
			setDefaultPassword(gxwlSysUser);
			setResultStatus(0, "重置密码成功");
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "重置密码时系统出错: " + e.getMessage());
			return resultMap;
		}
	}

	@Override
	public void setDefaultPassword(GxwlSysUser gxwlSysUser) {
		String salt1 = gxwlSysUser.getUserName();
		String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
		String salt = salt1 + salt2;
		String defaultPassword = HashUtil.sha256Hex(PropertiesUtil.getProperty("user.defaultPassword"));
		gxwlSysUser.setPassword(HashUtil.sha256Hex(defaultPassword, salt, DEFAULT_HASH_INTERATIONS));
		gxwlSysUser.setSalt(salt2);
	}

	@Override
	public List<String> getUserPermissionList(Integer userId) {
		List<String> result = new ArrayList<String>();
		List<Map<String, Object>> permissionList = gxwlSysUserDao.getUserPermissionList(userId);
		for (Map<String, Object> permission : permissionList) {
			result.add(permission.get("resourceCode").toString());
		}
		return result;
	}

	@Override
	protected Map<String, Object> doExcelImport(List<Map<String, Object>> result) {
		resetResultMap();
		try {
			for (Map<String, Object> m : result) {
				System.out.println("[UserId : " + m.get("UserId") + "] [UserName : "
						+ m.get("UserName") + "] [Age : " + m.get("Age")
						+ "] [Sex : " + m.get("Sex") + "]");
			}
			setResultStatus(0, "导入数据成功");
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "导入数据时系统出错: " + e.getMessage());
			return resultMap;
		}
	}

	@Override
	public void doExcelExport(List<GxwlSysUser> users, HSSFWorkbook workbook) {
		int i = 1;
		HSSFSheet sheet = workbook.getSheetAt(0);
		sheet.setDefaultColumnWidth(12);
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		HSSFDataFormat dataFormat = workbook.createDataFormat();
		for (GxwlSysUser user : users) {
			HSSFRow row = sheet.createRow(i++);
			row.createCell(0).setCellValue(user.getUserName());
			row.createCell(1).setCellValue(user.getRealname());
			row.createCell(2).setCellValue(user.getMobileno());
			row.createCell(3).setCellValue(user.getEmail());
			HSSFCell cell4 = row.createCell(4);
			cellStyle.setDataFormat(dataFormat.getFormat("yyyy-MM-dd"));
			cell4.setCellStyle(cellStyle);
			cell4.setCellValue(user.getValidDate());
		}
	}
	
	@Override
	public Map<String, Object> getGxwlSysUserRoleByUserId(Integer userId) {
		resetResultMap();
		try {
			setResultStatus(0, "获取数据成功");
			resultMap.put(RESULT_ROWS, gxwlSysUserDao.findOne(userId).getUserRoles());
		} catch (Exception e) {
			e.printStackTrace();
			setResultStatus(-1, "获取数据时系统出错: " + e.getMessage());
		}
		return resultMap;
	}

	
	
	//TODO 创建一个定时器  每隔30分钟删除一次ServletContext中的没用的record
	
	//TODO 完善注册成功
	@Override
	@Transactional
	public Map<String, Object> saveNewAccount(HttpServletRequest req, GxwlSysUser user) {
		Map<String, Object> map = new HashMap<String, Object>();
		RegisterRecord record = getRegisterRecord(req);
		
		//最后校验
		if(record.getImageVerifyResult() == 0){
			map.put("code", 0);
			map.put("name", "imageVerify");
			map.put("message", "请确保通过图形验证码。。");
			return map;
		}
		
		if(record.getPhoneVerifyResult() == 0){
			map.put("code", 0);
			map.put("name", "mobileno");
			map.put("message", "您的手机验证码还没验证通过哦。。");
			return map;
		}
		
		if(user.getUserName() == null){
			map.put("code", 0);
			map.put("name", "userName");
			map.put("message", "用户名还没有输入哦！");
			return map;
		}
		if(user.getUserName() != null && user.getUserName().trim().length() < 6){
			map.put("code", 0);
			map.put("name", "userName");
			map.put("message", "用户名不怎么规范呢！");
			return map;
		}
		
		if(user.getPassword() == null){
			map.put("code", 0);
			map.put("name", "password");
			map.put("message", "您的密码还没设置哟！");
			return map;
		}
		user.setStatus("enabled");
		user.setValidDate(new Date());
		setDefaultPassword(user);
		//保存
		gxwlSysUserDao.save(user);
		
		//删除ServletContext中的record
		getServletContext().removeAttribute(getKey(req));
		map.put("code", 1);
		map.put("message", "恭喜！注册成功咯 。。");
		return map;
	}
	
	
	@Override
	public boolean checkPhone(String phoneNumber){
		try {
			return gxwlSysUserDao.findOneByMobileno(phoneNumber) != null ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	

	private ServletContext getServletContext(){
		return ContextLoader.getCurrentWebApplicationContext().getServletContext();
	}
	
	private RegisterRecord getRegisterRecord(HttpServletRequest req){
        ServletContext servletContext = getServletContext(); 
        return (RegisterRecord) servletContext.getAttribute(getKey(req));
	}
	
	/**
	 * 返回申请用户的唯一标识
	 * @param req
	 * @return
	 */
	//TODO 得找到一种真的可以确定用户唯一的东西
	private String getKey(HttpServletRequest req){
		return NetworkUtil.getIpAddress(req);
	}
	
	/**
	 * @param req
	 * @param record
	 */
	private void resetRecord(HttpServletRequest req, RegisterRecord record){
		ServletContext context = getServletContext();
		context.setAttribute(getKey(req), record);
	}
}
