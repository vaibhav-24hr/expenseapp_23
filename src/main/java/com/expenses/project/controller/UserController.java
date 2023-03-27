package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	UserDao udo;
	
	@GetMapping("/home")
	public String home() {
		return "Home";
	}
	
	
	@GetMapping("/listusers")
	public String listUsers(Model model) {
		
		List<UserBean> userlist = udo.getAllUsers();
		model.addAttribute("userlist", userlist);
		
		return "ListUsers";
	}
	
}
