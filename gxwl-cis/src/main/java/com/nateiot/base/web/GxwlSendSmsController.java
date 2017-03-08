package com.nateiot.base.web;

import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.domain.RegisterRecord;
import com.nateiot.base.service.GxwlSmsService;

@Controller
@RequestMapping("/verifyCode")
public class GxwlSendSmsController {

	@Autowired
	private GxwlSmsService smsService;
		
	/**
	 * 发送新的验证码到指定手机号
	 * @param req
	 * @param phoneNumber 指定的手机号码
	 */
	@RequestMapping("/sendRegisterSecurityCode/{phoneNumber}")
	public void sendRegisterSecurityCode(HttpServletRequest req, @PathVariable String phoneNumber){
		smsService.sendRegisterSecurityCode(req, phoneNumber);
	}
	
	
	/**
	 * 校验手机验证码是否正确
	 * @param req
	 * @return
	 */
	@RequestMapping("/checkoutPhoneVerifyCode/{verifyCode}")
	@ResponseBody
	public Integer checkoutPhoneVerifyCode(HttpServletRequest req, @PathVariable String verifyCode) {
        RegisterRecord record = getRegisterRecord(req);
        if(record != null){
        	
        	if(record.getPhoneVerifyCode() != null && record.getPhoneVerifyResult() == 0){
        		
        		//判断验证码是否超时
        		Calendar calendar = Calendar.getInstance();
        		Long endTime = calendar.getTimeInMillis();
        		calendar.setTime(record.getCreateTime());
        		Long beginTime = calendar.getTimeInMillis();
        		if(((endTime - beginTime) / 1000)  > 60){
        			return 0;
        		}
        		
        		//判断输入的验证码是否正确
        		if(verifyCode.equals(record.getPhoneVerifyCode().toString())){
        			record.setPhoneVerifyResult(1);
        			resetRecord(req, record);
        			return 1; 
        		}else{
        			record.setPhoneVerifyResult(0);
        			resetRecord(req, record);
        			return 0;
        		}
        	}
        }
		return 0;
	}
	
	/**
	 * 更换图形验证码
	 * @param req
	 * @return
	 */
	@RequestMapping("/updateImageVerify")
	@ResponseBody
	public String updateImageVerify(HttpServletRequest req) {
        RegisterRecord record = getRegisterRecord(req);
        if(record == null){
        	record = new RegisterRecord();
        	
        	//TODO 假设图片验证码对应的值为9999
        	record.setImageValue("9999");
    		record.setImageVerifyResult(0);
    		record.setImageErrorCount(0);
    		record.setPhoneErrorCount(0);
        }else{
        	record.setImageValue(Integer.parseInt(record.getImageValue()) + "1");
    		record.setImageVerifyResult(0);
    		record.setImageErrorCount(record.getImageErrorCount() + 1);
        }
        resetRecord(req, record);
		return "/resources/images/logo_48.png";
	}
	
	/**
	 * 校验验证码是否正确
	 * @param req
	 * @param code 用户输入的验证码
	 * @return
	 */
	@RequestMapping("/updateImageVerify/{code}")
	@ResponseBody
	public Integer checkoutImageVerify(HttpServletRequest req, @PathVariable String code) {
        RegisterRecord record = getRegisterRecord(req);
        if(record != null){
        	if(record.getImageValue().equals(code)){
        		
        		//验证通过
        		record.setImageVerifyResult(1);
        		resetRecord(req, record);
        		return 1;
        	}else {
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
