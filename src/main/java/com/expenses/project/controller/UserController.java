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
import org.springframework.web.bind.annotation.RequestParam;

import com.expenses.project.bean.ChartExpenseBean;
import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.ExpenseDao;
import com.expenses.project.dao.HomeDao;
import com.expenses.project.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	UserDao uDao;
	
	@Autowired
	HomeDao hoDao;
	

	
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
		
		Integer monthlyTransaction = hoDao.getMonthlyTransaction(userId);
		Integer monthlyExpense = hoDao.getUserAmmountOfExpenseMonthly(userId);
		Integer monthlyIncome = hoDao.getAmmountOfIncomeMonthly(userId);
		Integer dailyExpense = hoDao.getAmountOfExpenseDaily(userId);
		Integer monthlyTransactionRatio = hoDao.getRatioOfTransactionForUser(userId);
		Integer dailyExpenseRatio = hoDao.getExpenseRatioForPeviousDayUser(userId);
		Integer monthlyExpenseRatio = hoDao.getExpenseRatioForPeviousMonthUser(userId);
		Integer monthlyIncomeRatio = hoDao.getRatioAmmountOfIncomeMonthly(userId);
		List<ExpenseBean> explist = hoDao.getUserLastExpense(userId);							
		List<ChartExpenseBean> chartData = hoDao.getExpenseStats(userId);
		List<ChartExpenseBean> pieStatus = hoDao.getStatusOfTransactionStats(userId);
		List<ChartExpenseBean> incoList = hoDao.getIncomeStats(userId);
		List<ChartExpenseBean> categData = hoDao.getCategoryStats(userId);
		
		model.addAttribute("monthlyExpense" , monthlyExpense);
		model.addAttribute("monthlyTransaction", monthlyTransaction);
		model.addAttribute("monthlyIncome" , monthlyIncome);
		model.addAttribute("dailyExpense",dailyExpense);
		model.addAttribute("chartData",chartData);
		model.addAttribute("pieStatus",pieStatus);
		model.addAttribute("dailyExpenseRatio",dailyExpenseRatio);
		model.addAttribute("monthlyExpenseRatio",monthlyExpenseRatio);
		model.addAttribute("monthlyTransactionRatio",monthlyTransactionRatio);
		model.addAttribute("explist", explist);
		model.addAttribute("monthlyIncomeRatio", monthlyIncomeRatio);
		model.addAttribute("incoList", incoList);
		model.addAttribute("categData", categData);
		
		System.out.println(userId);
		
		
		return "Home";
	}
	

	
	
	@GetMapping("/listusers")
	public String listUsers(Model model) {
		
		List<UserBean> userlist = uDao.getAllUsers();
		model.addAttribute("userlist", userlist);
		
		return "ListUsers";
	}
	
	@GetMapping("/viewuser")
	public String viewUser(@RequestParam("userId")Integer userId,Model model) {
		UserBean usBan = uDao.getUserById(userId);
		System.out.println("userId in UserController  =>" + usBan.getUserId());
		model.addAttribute("usBean", usBan);
		
		return "ViewUser";
	}
	
	

	
	
	
	
	
	
	
}
