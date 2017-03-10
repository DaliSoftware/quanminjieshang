package com.nateiot.base.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GxwlSmsService {
	public Map<String, Object> sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber);
}
