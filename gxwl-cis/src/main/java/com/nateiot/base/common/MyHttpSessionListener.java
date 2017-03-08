package com.nateiot.base.common;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.util.HttpSessionMutexListener;

public class MyHttpSessionListener extends HttpSessionMutexListener{

	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("执行MyHttpSessionListener的sessionCreated方法");
		super.sessionCreated(event);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
		WebApplicationContext context =  ContextLoader.getCurrentWebApplicationContext();
		ServletContext servletContext = context.getServletContext();
		
		HttpSession session = event.getSession();
		if(session.getAttribute("remoteAddr") != null){
			String remoteAddr = session.getAttribute("remoteAddr").toString();
			System.out.println("执行MyHttpSessionListener的销毁方法"+ remoteAddr);
			servletContext.removeAttribute(remoteAddr);
		}
		super.sessionDestroyed(event);
	}
	
}
