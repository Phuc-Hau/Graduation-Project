package com.webbanhang.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webbanhang.impl.UserDao;
import com.webbanhang.model.User;
import com.webbanhang.service.CookieService;
import com.webbanhang.service.SessionService;



@Controller
@RequestMapping("/account")
public class SignInController {
	
	@Autowired
	UserDao dao;
	
	@Autowired 
	SessionService sessionService;
	
	@Autowired
	CookieService cookieService;
	
	@RequestMapping("/signin")
	public String signin(ModelMap model, @ModelAttribute("user") User user ) {
		return "user/dangnhap";
	}
	
	@PostMapping("/login")
	public String login(ModelMap model, @ModelAttribute("user") User user ,@RequestParam("remember") boolean remeber) {
		User check=dao.checkLogin(user.getUsername(), user.getPassword());
		if(check != null) {
			sessionService.set("user", check);
			if(remeber) {
				cookieService.add("username", user.getUsername(), 10);
				cookieService.add("password", check.getPassword(), 10);
			}else {
				cookieService.remove("username");
				cookieService.remove("password");
			}
			return "redirect:/product/index";
		}else {
			model.addAttribute("mess", "Sai UserName Hoặc PassWord!");
			return "user/dangnhap";
		}
		
	}
	
	@RequestMapping("/signout")
	public String signout() {
		cookieService.remove("username");
		sessionService.remove("user");
		return "redirect:/product/index";
	}
	
}
