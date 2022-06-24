package com.webbanhang;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.webbanhang.jpa.dao.UserDao;
import com.webbanhang.service.CookieService;
import com.webbanhang.service.SessionService;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	AuthInterceptor auth;

	@Autowired
	UserDao userDao;
	
	@Autowired
	CookieService cookie;
	
	@Autowired
	SessionService session;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
		.addPathPatterns("/account/cart/**", "/admin/**","/account/newcart","/account/cartpay",
				"/account/changinformation","account/user")
		.excludePathPatterns("/assets/**","/js","/product/index");
		
	}
	
}
