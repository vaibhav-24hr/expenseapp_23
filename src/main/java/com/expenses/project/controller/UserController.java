package com.expenses.project.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.HomeDao;
import com.expenses.project.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	UserDao udo;
	
	@Autowired
	HomeDao hdo;
	
	@GetMapping("/home")
	public String home(HttpServletRequest req, Model model) {
		
		int userId = -1;
		Cookie c[] = req.getCookies();
		
		for(Cookie x : c) {
			if(x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
		}
		
//		uddo.getUserAmmountOfExpenseMonthly(userId);
		
		Integer monthlyTransaction = hdo.getMonthlyTransaction(userId);
		Integer monthlyExpense = hdo.getUserAmmountOfExpenseMonthly(userId);
		Integer monthlyIncome = hdo.getAmmountOfIncomeMonthly(userId);
		Integer dailyExpense = hdo.getAmountOfExpenseDaily(userId);
		
		model.addAttribute("monthlyExpense" , monthlyExpense);
		model.addAttribute("monthlyTransaction", monthlyTransaction);
		model.addAttribute("monthlyIncome" , monthlyIncome);
		model.addAttribute("dailyExpense",dailyExpense);
		
		System.out.println(userId);
		
		
		return "Home";
	}
	

	
	
	@GetMapping("/listusers")
	public String listUsers(Model model) {
		
		List<UserBean> userlist = udo.getAllUsers();
		model.addAttribute("userlist", userlist);
		
		return "ListUsers";
	}
	
}
