package com.expenses.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admindashboard")
	public String adminDashboard(Model model){
		System.out.println("InSide admindashboard--url-metho--");
		
		model.addAttribute("Number of users", 500);
		model.addAttribute("This Month Expenses", 10000);
		model.addAttribute("This Month Income", 200000);
		model.addAttribute("Today Expenses", 2000);
		
		return "AdminDashboard";
	}
	
}
