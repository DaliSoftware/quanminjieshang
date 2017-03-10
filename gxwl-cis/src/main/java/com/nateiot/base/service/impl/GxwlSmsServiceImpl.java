package com.nateiot.base.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.common.SendSms;
import com.nateiot.base.domain.RegisterRecord;
import com.nateiot.base.service.GxwlSmsService;

@Service("gxwlSmsService")
public class GxwlSmsServiceImpl implements GxwlSmsService{

	@Override
	public Map<String, Object> sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		ServletContext sc = wac.getServletContext();
		RegisterRecord record = (RegisterRecord) sc.getAttribute(NetworkUtil.getIpAddress(req));
		
		//判断用户输入的图形验证码是否正确  排除机器人注册
		if(record.getImageVerifyResult() == 0){
			resultMap.put("sendCode", 0);
			resultMap.put("message", "请先输入图片验证码！");
			return resultMap;
		}
		
		//一天只发送3次验证码
		if(record.getPhoneErrorCount() > 20){
			resultMap.put("sendCode", 0);
			resultMap.put("message", "您今天已用完3次发送验证码的机会！");
			return resultMap;
		}
		record.setRegisterPhone(phoneNumber);
		
		//发送验证码
		SendSms.sendRegisterSecurityCode(record);
		
		//成功发送短信验证码
		if(record.getPhoneVerifyCode() != null){
			resultMap.put("sendCode", 1);
			resultMap.put("message", "短信验证码发送成功");
			sc.setAttribute(req.getRemoteAddr(), record);
		}else{
			resultMap.put("sendCode", 0);
			resultMap.put("message", "短信验证码发送失败！");
		}
		return resultMap;
	}


}
