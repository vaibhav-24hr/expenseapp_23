package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.StatusBean;
import com.expenses.project.dao.StatusDao;

@Controller
public class StatusController {

	@Autowired
	StatusDao std;
	
	@GetMapping("/newstatus")
	public String newStatus() {
		return "NewStatus";
	}
	
	@PostMapping("/savestatus")
	public String saveStatus(StatusBean stb) {
		 
		System.out.println(stb.getStatusShow());
		// DataBase
		std.addStatus(stb);
		return "NewStatus"; 
	}
	
	@GetMapping("/liststatus")
	public String listStatus(Model model) {
		
		// Pull all Status from Database via DAO
		List<StatusBean> statuslist =  std.getAllStatus(); 
		model.addAttribute( "statuslist" ,statuslist);
		return "ListStatus";
	}
	
	@GetMapping("/deletestatus/{statusId}")
	public String deleteStatus(@PathVariable("statusId") Integer statusId  ) {
		std.deleteStatus(statusId);
		return "redirect:/liststatus";
	}
	
}
