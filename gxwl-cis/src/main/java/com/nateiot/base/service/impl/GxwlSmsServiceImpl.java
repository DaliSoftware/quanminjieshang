package com.nateiot.base.service.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.common.SendSms;
import com.nateiot.base.domain.RegisterRecord;
import com.nateiot.base.repository.GxwlSysUserDao;
import com.nateiot.base.service.GxwlSmsService;
import com.nateiot.base.service.GxwlSysUserService;

@Service("gxwlSmsService")
public class GxwlSmsServiceImpl implements GxwlSmsService{
	private static final String CODE = "code";
	private static final String MESSAGE = "message";
	
	@Autowired
	private GxwlSysUserService userService;
	
	@Override
	public Map<String, Object> sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		ServletContext sc = wac.getServletContext();
		RegisterRecord record = (RegisterRecord) sc.getAttribute(NetworkUtil.getIpAddress(req));
		
		//判断用户输入的图形验证码是否正确  排除机器人注册
		if(record.getImageVerifyResult() == 0){
			resultMap.put(CODE, 0);
			resultMap.put(MESSAGE, "请先输入图片验证码！");
			return resultMap;
		}
		
		if(userService.checkPhone(phoneNumber)){
			resultMap.put(CODE, 0);
			resultMap.put(MESSAGE, "手机号已被注册使用！");
			return resultMap;
		}
		
		//一天只发送3次验证码
		if(record.getPhoneErrorCount() > 20){
			resultMap.put(CODE, 0);
			resultMap.put(MESSAGE, "您今天已用完3次发送验证码的机会！");
			return resultMap;
		}
		record.setRegisterPhone(phoneNumber);
		
		//发送验证码
		SendSms.sendRegisterSecurityCode(record);
		
		//成功发送短信验证码
		if(record.getPhoneVerifyCode() != null){
			resultMap.put(CODE, 1);
			resultMap.put(MESSAGE, "短信验证码发送成功");
			sc.setAttribute(req.getRemoteAddr(), record);
		}else{
			resultMap.put(CODE, 0);
			resultMap.put(MESSAGE, "短信验证码发送失败！");
		}
		return resultMap;
	}


	@Override
	public Map<String, Object> checkoutPhoneVerifyCode(HttpServletRequest req,
			String verifyCode) {
		RegisterRecord record = getRegisterRecord(req);
		Map<String, Object> map = new HashMap<String, Object>();
        if(record != null){
        	if(record.getPhoneVerifyCode() != null){
        		
        		//判断验证码是否超时
        		Calendar calendar = Calendar.getInstance();
        		Long endTime = calendar.getTimeInMillis();
        		calendar.setTime(record.getCreateTime());
        		Long beginTime = calendar.getTimeInMillis();
        		if(((endTime - beginTime) / 1000)  > 60){
        			map.put(CODE, 0);
        			map.put(MESSAGE, "验证码失效！");
        			return map;
        		}
        		
        		//判断输入的验证码是否正确
        		if(verifyCode.equals(record.getPhoneVerifyCode().toString())){
        			record.setPhoneVerifyResult(1);
        			resetRecord(req, record);
        			map.put(CODE, 1);
        			map.put(MESSAGE, "验证通过！");
        			return map; 
        		}else{
        			record.setPhoneVerifyResult(0);
        			resetRecord(req, record);
        			record.setPhoneErrorCount(record.getPhoneErrorCount() + 1);
        			map.put(CODE, 0);
        			map.put(MESSAGE, "输入的验证码不正确！");
        			return map;
        		}
        	}
        }else {
        	map.put(CODE, 0);
        	map.put(MESSAGE, "请尝试先输入图形验证码。。");
        }
		return map;
	}
	
	
	@Override
	public Integer checkoutImageVerify(HttpServletRequest req, @PathVariable String code) {
        RegisterRecord record = getRegisterRecord(req);
        if(record != null){
        	if(record.getImageValue().equals(code)){
        		
        		//验证通过
        		record.setImageVerifyResult(1);
        		resetRecord(req, record);
        		return 1;
        	}else {
        		record.setImageErrorCount(record.getImageErrorCount() + 1);
        		resetRecord(req, record);
        		return 0;
        	}
        }
        return 0;
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
