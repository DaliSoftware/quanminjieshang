package com.nateiot.base.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.nateiot.base.domain.GxwlSysUser;
import com.nateiot.base.repository.GxwlSysUserDao;
import com.nateiot.core.service.BaseService;

/**
 * @author Will WM. Zhang
 * 
 */
public interface GxwlSysUserService extends
		BaseService<GxwlSysUserDao, GxwlSysUser, Integer> {

	public static final int DEFAULT_HASH_INTERATIONS = 64;

//	public boolean checkGxwlSysUserEmpcode(String empcode);

	public Map<String, Object> checkGxwlSysUserName(Integer userId, String userName);

	/**
	 * 修改用户密码
	 * 
	 * @param oldPassword
	 * @param newPassword
	 * @return
	 */
	public Map<String, Object> modifyCurrentUserPassword(String oldPassword, String newPassword);
	
	/**
	 * 检查用户的旧密码
	 * 
	 * @param oldPassword
	 * @return
	 */
	public Map<String, Object> checkCurrentUserOldPassword(String oldPassword);
	
	/**
	 * 根据用户账号查找用户
	 * 
	 * @param userName
	 * @return
	 */
	public GxwlSysUser findByUserName(String userName);

	/**
	 * 重置用户密码
	 * 
	 * @param userId
	 * @return
	 */
	public Map<String, Object> resetPassword(Integer userId);

	
	/**
	 * 设置用户默认密码
	 * 
	 * @param gxwlSysUser
	 */
	public void setDefaultPassword(GxwlSysUser gxwlSysUser);
	
	/**
	 * 获取用户的权限列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<String> getUserPermissionList(Integer userId);
	
	/**
	 * 处理Excel导出业务逻辑
	 * 
	 * @param users
	 * @param workbook
	 */
	public void doExcelExport(List<GxwlSysUser> users, HSSFWorkbook workbook);
	
	
	
	/**
	 * 加载用户组成员
	 * @param userId
	 * @return
	 */
	public  Map<String, Object>  getGxwlSysUserRoleByUserId(Integer userId);
	
	public Map<String, Object> saveNewAccount(HttpServletRequest req, GxwlSysUser user);

	/**
	 * 查看给定的手机号是否已经注册过商户用户
	 * @param phoneNumber
	 * @return 返回true表示手机号已经被注册使用，反之
	 */
	boolean checkPhone(String phoneNumber);
	
}
