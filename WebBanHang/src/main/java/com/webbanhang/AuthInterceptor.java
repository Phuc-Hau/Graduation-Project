package com.webbanhang;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.webbanhang.jpa.dao.UserDao;
import com.webbanhang.jpa.model.User;
import com.webbanhang.service.CookieService;
import com.webbanhang.service.SessionService;


@Service
public class AuthInterceptor implements HandlerInterceptor{

	@Autowired
	SessionService session;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CookieService cookie;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = userDao.checkLogin(cookie.getValue("username"), cookie.getValue("password"));
		
		if(user != null) {
			session.set("user", user);
		}
		
		String uri = request.getRequestURI();
		
		String error = "";
		
		if(user == null) { // chưa đăng nhập
			error = "Please login!";
		}
		
		// không đúng vai trò
		else if(!user.isStatus() && uri.startsWith("/admin/")) {
			error = "Access denied!";
		}
		
		if(error.length() > 0) { // có lỗi
			session.set("security-uri", uri);
			response.sendRedirect("/account/signin?error=" + error);
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
