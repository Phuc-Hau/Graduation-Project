package com.webbanhang.controller.admin;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.webbanhang.jpa.model.MoneyMonth;
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

        List<MoneyMonth> moneyMonth = orderDao.moneyMonthYear(2022);
        int months[] = new int[13];

        for (int i = 1; i <= 12; i++) {
            for (int j = 0; j < moneyMonth.size(); j++) {
                if (moneyMonth.get(j).getMonth() == i) {
                    months[i] = (int) moneyMonth.get(j).getMoney();
                    break;
                } else {
                    months[i] = 0;
                }
            }
        }

        String data = "var datamonth= "+Arrays.toString(months);
        String dir = "src/main/resources/static/js/datamonth.js";

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
        String year = simpleDateFormat.format(date);

        int sumPriceMonth = orderDao.sumPriceMonth(Integer.parseInt(month));
        int sumCount = orderDao.sumCountMonth(Integer.parseInt(month));
        int sumPriceYear = orderDao.sumPriceYear(Integer.parseInt(year));
        model.addAttribute("month", month);
        model.addAttribute("year", year);
        model.addAttribute("sumpricemonth", sumPriceMonth);
        model.addAttribute("sumcount", sumCount);
        model.addAttribute("sumpriceyear", sumPriceYear);

        return "admin/AdminIndex";
    }
}
