package com.nateiot.base.service;

import javax.servlet.http.HttpServletRequest;

public interface GxwlSmsService {
	public void sendRegisterSecurityCode(HttpServletRequest req, String phoneNumber);
}
