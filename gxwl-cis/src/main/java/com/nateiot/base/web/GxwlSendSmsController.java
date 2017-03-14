package com.nateiot.base.web;

import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import com.nateiot.base.common.NetworkUtil;
import com.nateiot.base.common.VerifyCodeUtils;
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
	@ResponseBody
	public Map<String, Object> sendRegisterSecurityCode(HttpServletRequest req, @PathVariable String phoneNumber){
		return smsService.sendRegisterSecurityCode(req, phoneNumber);
	}
	
	
	/**
	 * 校验手机验证码是否正确
	 * @param req
	 * @return
	 */
	@RequestMapping("/checkoutPhoneVerifyCode/{verifyCode}")
	@ResponseBody
	public Map<String, Object> checkoutPhoneVerifyCode(HttpServletRequest req, @PathVariable String verifyCode) {
        return smsService.checkoutPhoneVerifyCode(req, verifyCode);
	}
	
	/**
	 * 更换图形验证码
	 * @param req
	 * @return
	 */
	@RequestMapping("/updateImageVerify")
	public void updateImageVerify(HttpServletRequest req, HttpServletResponse response) {
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg"); 
        RegisterRecord record = getRegisterRecord(req);
        
        // 生成随机字串  
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4).toLowerCase();  
        if(record == null){
        	//初始化
        	record = new RegisterRecord();
    		record.setImageErrorCount(0);
    		record.setImageVerifyResult(0);
    		record.setPhoneErrorCount(0);
    		record.setPhoneVerifyResult(0);
        }
    	record.setImageValue(verifyCode);
        resetRecord(req, record);
        
        // 存入会话session  
        int w = 100, h = 30;
        if(req.getParameter("width") != null){
        	w = Integer.parseInt(req.getParameter("width").toString());
        }
        if(req.getParameter("height") != null){
        	h = Integer.parseInt(req.getParameter("height").toString());
        }
        try {
			VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		}  
	}
	
	/**
	 * 校验验证码是否正确
	 * @param req
	 * @param code 用户输入的验证码
	 * @return
	 */
	@RequestMapping("/checkoutImageVerify/{code}")
	@ResponseBody
	public Integer checkoutImageVerify(HttpServletRequest req, @PathVariable String code) {
        return smsService.checkoutImageVerify(req, code);
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
