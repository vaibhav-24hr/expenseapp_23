package com.expenses.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.AdminDao;

@Controller
public class AdminController {

	@Autowired
	AdminDao admo;
	
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model){
		System.out.println("InSide admindashboard--url-metho--");
		
		// Number Of Transaction or Expenses
		int totalUsers =  admo.getUsersCount();
		int totalExpenseCount = admo.getExpenseCount();
		int totalIncomr = admo.getAmmountOfIncome();
		int totalExpense = admo.getAmmountOfExpense();
		
		model.addAttribute("NumberOfUsers", totalUsers);
		model.addAttribute("ThisMonthExpenses", totalExpenseCount);
		model.addAttribute("ThisMonthIncome", totalIncomr);
		model.addAttribute("TodayExpenses", totalExpense);
		
		return "AdminDashboard";
	}
	
}
