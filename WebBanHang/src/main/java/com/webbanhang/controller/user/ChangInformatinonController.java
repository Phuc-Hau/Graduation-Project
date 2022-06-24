package com.webbanhang.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webbanhang.impl.CutomerDao;
import com.webbanhang.impl.OrderDetailDao;
import com.webbanhang.impl.UserDao;
import com.webbanhang.model.Cutomer;
import com.webbanhang.model.EditUserAdmin;
import com.webbanhang.model.OrderDetail;
import com.webbanhang.model.User;
import com.webbanhang.service.SessionService;
import com.webbanhang.utils.ConvenientUtils;

@Controller
@RequestMapping("/account")
public class ChangInformatinonController {
	@Autowired
	UserDao userDao;
	
	@Autowired
	CutomerDao cutomerDao;
	
	@Autowired
	ConvenientUtils convenientUtils;
	
	@Autowired
	SessionService session;
	
	@Autowired
	OrderDetailDao orderDetailDao;

	@RequestMapping("/changinformation")
	public String changInformation(@ModelAttribute("edituser") EditUserAdmin edituser,Model model) {
		User user =session.get("user");
		if(user !=null) {
			List<OrderDetail> list = orderDetailDao.findAllUsername(user.getCutomer().getId());
			model.addAttribute("amountcart", list.size());
		}
		Cutomer cutomer = cutomerDao.getById(user.getCutomer().getId());

		edituser.setUser(user);
		edituser.setCutomer(cutomer);

		model.addAttribute("edituser",edituser);
		
		return "user/ChangInformation";
	}
	
	@PostMapping("/user/update")
	public String changInformation(Model model, @RequestParam("imgs") MultipartFile imgs,
			@ModelAttribute("edituser") EditUserAdmin edituser) {
			User useo = session.get("user");
		
			User user = edituser.getUser();
			user.setRules(useo.getRules());
			user.setStatus(useo.isStatus());
			Cutomer cutomer = edituser.getCutomer();
			
			if(!imgs.getOriginalFilename().equals("")) {
				user.setImg(imgs.getOriginalFilename());
			}else {
				user.setImg(userDao.getById(user.getId()).getImg());
			}
			
			user.setCutomer(cutomer);
		   
			try {
				cutomerDao.save(cutomer);
				userDao.save(user);
				convenientUtils.saveFile(imgs, "user");
			} catch (Exception e) { 
				e.printStackTrace();
			}
			return"redirect:/account/changinformation";
	}
}
