package com.nateiot.base.service.impl;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.domain.RegisterRecord;
import com.nateiot.base.service.GxwlSmsService;

@Service("gxwlSmsService")
public class GxwlSmsServiceImpl implements GxwlSmsService{

	@Override
	public void sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber) {
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		ServletContext sc = wac.getServletContext();
		
		RegisterRecord record = (RegisterRecord) sc.getAttribute(NetworkUtil.getIpAddress(req));
		
		//判断用户输入的图形验证码是否正确  排除机器人注册
		if(record.getImageVerifyResult() == 0){
			return;
		}
		
		//一天只发送3次验证码
		if(record.getPhoneErrorCount() > 3){
			return;
		}
		
		//TODO 假设发送到这个固定手机号上
		//record.setRegisterPhone(phoneNumber);
		record.setRegisterPhone("13076246464");
		
		//发送验证码
		//SendSms.sendRegisterSecurityCode(record);
		
		//TODO 假设发送的手机验证码为8888
		record.setPhoneVerifyCode(8888);
		record.setCreateTime(new Date());
		
		//手机验证码发送次数加一
		record.setPhoneErrorCount(record.getPhoneErrorCount() + 1);
		sc.setAttribute(req.getRemoteAddr(), record);
	}


}
