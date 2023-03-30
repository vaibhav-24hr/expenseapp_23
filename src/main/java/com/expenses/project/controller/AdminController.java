package com.expenses.project.controller;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

//import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.AdminDao;
import com.expenses.project.dao.UserDao;

@Controller
public class AdminController {

	@Autowired
	AdminDao admo;
	
	@Autowired
	UserDao udo;
	
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model){
		System.out.println("InSide admindashboard--url-metho--");
		
		// Number Of Transaction or Expenses
		int totalUsers =  admo.getUsersCount();
		int totalExpenseCount = admo.getExpenseCount();
		int totalExpenseDaily = admo.getAmmountOfExpennseDaily();
		int totalExpenseMonthly = admo.getAmmountOfExpenseMonthly();
		int ratioUsersMonthly = admo.getUserRatioMonthly();
		int ratioTransactionMonthly = admo.getRatioOfTransaction();
		Double ratioExpenseDaily = admo.getExpenseRatioForPeviousDay();
		Double ratioExpenseMonthly = admo.getExpenseRatioForPeviousMonth();
		
		model.addAttribute("NumberOfUsers", totalUsers);
		model.addAttribute("NumberOfMonthlyExpenses", totalExpenseCount);
		model.addAttribute("TodayExpense", totalExpenseDaily);
		model.addAttribute("MonthlyExpense", totalExpenseMonthly);
		model.addAttribute("ratioExpenseDaily", ratioExpenseDaily);
		model.addAttribute("ratioExpenseMonthly", ratioExpenseMonthly);
		model.addAttribute("ratioUsersMonthly", ratioUsersMonthly);
		model.addAttribute("ratioTransactionMonthly", ratioTransactionMonthly);
		
		return "AdminDashboard";
	}
	
	
//	@GetMapping("/listusers")
//	public String listUsers(Model model) {
//		
//		List<UserBean> userlist = udo.getAllUsers();
//		model.addAttribute("userlist", userlist);
//		
//		return "ListUsers";
//	}
	
}
