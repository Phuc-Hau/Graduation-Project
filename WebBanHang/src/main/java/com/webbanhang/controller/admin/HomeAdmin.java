package com.webbanhang.controller.admin;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webbanhang.jpa.dao.OrderDao;

@Controller
@RequestMapping("/admin")
public class HomeAdmin {

	@Autowired
	OrderDao orderDao;
	
	@RequestMapping("/index")
	public String index(Model model) {
		
		String data = "var datamonth= [7000, 19780, 38820, 1000, 8108, 11000,8678,4000,8568,900,1800,2000]";
		
		String dir="src/main/resources/static/js/datamonth.js";
	      
		try {
		  FileWriter fileWriter = new FileWriter(dir);
		  fileWriter.write(data);
		  fileWriter.flush();
		  fileWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        Date date = new Date();
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern("MM");
        String month = simpleDateFormat.format(date);
        simpleDateFormat.applyPattern("YYYY");
        String year =simpleDateFormat.format(date);
        
        int sumPriceMonth = orderDao.sumPriceMonth(Integer.parseInt(month));
        int sumCount = orderDao.sumCountMonth(Integer.parseInt(month));
        int sumPriceYear =orderDao.sumPriceYear(Integer.parseInt(year));
        model.addAttribute("month", month);
        model.addAttribute("year", year);
		model.addAttribute("sumpricemonth", sumPriceMonth);
		model.addAttribute("sumcount", sumCount);
		model.addAttribute("sumpriceyear", sumPriceYear);
		
		return "admin/AdminIndex";
	}
}
