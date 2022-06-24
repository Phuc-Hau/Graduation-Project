package com.webbanhang.controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webbanhang.jpa.dao.UserDao;
import com.webbanhang.jpa.model.User;
import com.webbanhang.utils.ConvenientUtils;
import com.webbanhang.utils.MailerServiceUtils;

@Controller
@RequestMapping("/account")
public class ForgetPassController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	MailerServiceUtils mailer;

	@Autowired
	ConvenientUtils convenientUtils;
	
	User user;
	String capChas;

	@RequestMapping("/forgetpass")
	public String searchTK(Model model) {
		return "forgetpass/timtk";
	}

	@PostMapping("forgetmail")
	public String capcha(Model model, @RequestParam("email") String email){

		user = userDao.findByEmail(email);

		if (user == null) {
			model.addAttribute("message", "Email chưa đăng ký tài khoản");
			return "forgetpass/timtk";
		} else {
			model.addAttribute("message", "");
			
			capChas = convenientUtils.ranDomCapCha();
			
			try {
				mailer.sendPassword(email, capChas);
			} catch (Exception e) {
				
			}
			model.addAttribute("email", convenientUtils.emailToStar(email));
			return "forgetpass/capcha";
		}

	}

	@PostMapping("/datpassword")
	public String datpass(Model model, @RequestParam("capcha") String capcha) {
		if (capChas.equals(capcha)) {
			model.addAttribute("message", "");
			return "forgetpass/datpass";
		} else {
			model.addAttribute("message", "Sai mã xác thực không chính xác!");
			return "forgetpass/capcha";
		}
	}

	@PostMapping("updatepassword")
	public String updatepassword(@RequestParam("password_new") String password_new) {
		user.setPassword(password_new);
		try {
			userDao.save(user);
			user = null;
			capChas ="";
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/account/signin";
	}

	
}
