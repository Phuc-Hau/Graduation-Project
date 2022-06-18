package com.webbanhang.controller;


import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webbanhang.impl.CutomerDao;
import com.webbanhang.impl.UserDao;
import com.webbanhang.model.Cutomer;
import com.webbanhang.model.User;
import com.webbanhang.utils.ConvenientUtils;
import com.webbanhang.utils.MailerServiceUtils;

@Controller
@RequestMapping("/account")
public class SignUpController {

	@Autowired
	MailerServiceUtils mail;

	@Autowired
	ConvenientUtils convenientUtils;

	@Autowired
	UserDao userDao;

	@Autowired
	CutomerDao cutomerDao;
	
	@RequestMapping("/signup")
	public String showForm(@ModelAttribute("user") User user) {
		return "user/dangky";
	}

	User tymUser;
	Cutomer tymCutomer;
	String capchas = "";

	@PostMapping("/signup/confirm")
	public String senEmail(Model model, @ModelAttribute("user") User user, @RequestParam("fullname") String fullname)
			throws MessagingException {
		if (userDao.findByEmail(user.getEmail()) == null) {

			user.setStatus(true);
			user.setRules(1);

			Cutomer cutomer = new Cutomer();
			int id = cutomerDao.getIdFinal() + 1;
			cutomer.setId(id);
			cutomer.setName(fullname);

			user.setCutomer(cutomer);
			tymCutomer = cutomer;
			tymUser = user;

			model.addAttribute("email", convenientUtils.emailToStar(user.getEmail()));

			capchas = convenientUtils.ranDomCapCha();
			mail.sendSignUp(user.getEmail(), capchas);
			model.addAttribute("message", "");
			return "user/capchasignup";
		} else {
			model.addAttribute("message", "Email đã tồn tại!");
			return "user/dangky";
		}
	}

	@PostMapping("/confirm")
	public String signUp(Model model, @RequestParam("capcha") String capcha) {
		
		if (capcha.equals(capchas)) {
			try {
				cutomerDao.save(tymCutomer);
				userDao.save(tymUser);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/account/signin";
		} else {
			model.addAttribute("message", "Sai mã xác thực không chính xác!");
			return "user/capchasignup";
		}

	}

}
