package com.dev.shop.service;

import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	private static final Logger logger = LoggerFactory.getLogger(UserLoginFailureHandler.class);
	private String loginid;
	private String loginpw;
	private String errormsg;
	private String defaultFailureUrl;
	
	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getLoginpw() {
		return loginpw;
	}

	public void setLoginpw(String loginpw) {
		this.loginpw = loginpw;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter(loginid);
		String passwd = request.getParameter(loginpw);
		String errormsg = exception.getMessage();
		
		request.setAttribute(loginid, username);
		request.setAttribute(loginpw, passwd);
		request.setAttribute(this.errormsg, errormsg);
		logger.info("id : "+username);
		logger.info("passwd : "+passwd);
		logger.info("errormsg : "+errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
		/*
		 * request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		 * request.getRequestDispatcher("/WEB-INF/views/user/login.page").forward(
		 * request, response);
		 */
	}
	
	

}
