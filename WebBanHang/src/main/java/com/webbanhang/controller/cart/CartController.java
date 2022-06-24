package com.webbanhang.controller.cart;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webbanhang.jpa.dao.CutomerDao;
import com.webbanhang.jpa.dao.OrderDao;
import com.webbanhang.jpa.dao.OrderDetailDao;
import com.webbanhang.jpa.dao.ProductDao;
import com.webbanhang.jpa.dao.UserDao;
import com.webbanhang.jpa.model.Order;
import com.webbanhang.jpa.model.OrderDetail;
import com.webbanhang.jpa.model.Product;
import com.webbanhang.jpa.model.User;
import com.webbanhang.service.SessionService;

@Controller
@RequestMapping("/account")
public class CartController {
	
	@Autowired
	OrderDetailDao orderDetailDao;
	
	@Autowired
	OrderDao orderDao; 
	
	@Autowired 
	ProductDao productDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	SessionService session;
	
	@Autowired
	CutomerDao cutomerDao;

	@RequestMapping("/cart")
	public String cart(Model model) {
		
		User user =session.get("user");
		
		List<OrderDetail> list = orderDetailDao.findAllUsername(user.getCutomer().getId());
		model.addAttribute("cart", list);
		model.addAttribute("amountcart", list.size());
		int idCutomer =user.getCutomer().getId();
		Order order = orderDao.findIdCutomer(idCutomer);
		
		double priceSum = 0;
		
		int amountSum=0;
		for (OrderDetail orderDetail : list) {
			priceSum+= (orderDetail.getProduct().getPrice()-orderDetail.getProduct().getPrice()
					*orderDetail.getProduct().getSale())*orderDetail.getQuantity();
			amountSum+=orderDetail.getQuantity();
		}
		model.addAttribute("pricesum", priceSum);
		model.addAttribute("amountsum", amountSum);
		
		try {
			order.setTotalmoney(priceSum);
			orderDao.save(order);
		} catch (Exception e) {
			
		}
		priceSum=0;
		amountSum=0;
		return "cart";
	}
	
	@PostMapping("/cart/{p}")
	public String u (Model model,@PathVariable("p")String p,@RequestParam("id") int id) {
		try {
		    OrderDetail orderDetail	= orderDetailDao.getById(id);
		    if(p.equals("plus")) {
		    	orderDetail.setQuantity(orderDetail.getQuantity()+1);
		    }else if(p.equals("pre") && orderDetail.getQuantity()>0) {
		    	orderDetail.setQuantity(orderDetail.getQuantity()-1);
		    }
		    orderDetailDao.save(orderDetail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/account/cart";
	}
	
	
	@PostMapping("/cart/delete")
	public String deleteCart(@RequestParam("id") int id) {
		OrderDetail orderDetail = orderDetailDao.getById(id);
		orderDetailDao.delete(orderDetail);
		return "redirect:/account/cart";
	}
	
	@PostMapping("/newcart")
	public String newCart(@RequestParam("quantity") int quantity,@RequestParam("id") int id) {
		Product product = productDao.getById(id);
		User user= session.get("user");
		int idCutomer =user.getCutomer().getId();
		
		Order order = orderDao.findIdCutomer(idCutomer);
		
		OrderDetail orderDetail = new OrderDetail();
		try {
			orderDetail.setId(orderDetailDao.maxId()+1);
		} catch (Exception e) {
			orderDetail.setId(0);
		}
		
		orderDetail.setProduct(product);
		orderDetail.setQuantity(quantity);
		
		try {
			if(order != null) {
				OrderDetail orderDetailTym = orderDetailDao.findIdProduct(product.getId(),idCutomer);
				
				if(orderDetailTym == null) {
					orderDetail.setOrder(order);
					orderDetailDao.save(orderDetail);
				}else {
					orderDetailTym.setQuantity(orderDetailTym.getQuantity()+quantity);
					orderDetailDao.save(orderDetailTym);
				}
				
			}else {
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				Order order2 = new Order();
				try {
					order2.setId(orderDao.maxId()+1);
				} catch (Exception e) {
					order2.setId(1);
				}
				order2.setStatus(false);
				order2.setOrderDetails(null);
				order2.setDate(timestamp);
				order2.setCutomer(cutomerDao.getById(idCutomer));
				orderDao.save(order2);
				orderDetail.setOrder(order2);
				orderDetailDao.save(orderDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/sanpham/"+id;
	}
	
	@PostMapping("/cart/newpay")
	public String Pay() {
		
		
		User user= session.get("user");
		List<OrderDetail> list = orderDetailDao.findAllUsername(user.getCutomer().getId());
		double priceSum = 20000;
		
		for (OrderDetail orderDetail : list) {
			priceSum+= (orderDetail.getProduct().getPrice()-orderDetail.getProduct().getPrice()
					*orderDetail.getProduct().getSale())*orderDetail.getQuantity();
			
		}
		int idCutomer =user.getCutomer().getId();
		Order order = orderDao.findIdCutomer(idCutomer);

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		order.setDate(timestamp);
		order.setStatus(true);
		order.setTotalmoney(priceSum); 
		orderDao.save(order);
		return "redirect:/account/cart";
	}
}
