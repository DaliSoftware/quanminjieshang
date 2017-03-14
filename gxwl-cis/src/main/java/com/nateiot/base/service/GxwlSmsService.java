package com.nateiot.base.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;

public interface GxwlSmsService {
	
	/**
	 * 向给定的手机号发送一条验证码，发送短信前会对该手机号进行一些校验工作：
	 * 如果手机号已经被注册使用将不能使用（即不会发生短信）;校验用户是否已经通过了图形验证码验证；
	 * 验证码发送次数是否超过某个范围
	 * @param req
	 * @param phoneNumber
	 * @return 返回一个map集合，通过集合中的code判断短信发送是否成功，不为0表示成功；message得知错误消息
	 */
	public Map<String, Object> sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber);
	
	/**
	 * 验证用户输入的手机验证码是否正确
	 * @param req
	 * @param verifyCode 输入的验证码
	 * @return 验证结果
	 */
	public Map<String, Object> checkoutPhoneVerifyCode(HttpServletRequest req, @PathVariable String verifyCode);

	Integer checkoutImageVerify(HttpServletRequest req, String code);
}
