package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.AccountBean;
import com.expenses.project.dao.AccountDao;

@Controller
public class AccountController {

	@Autowired
	AccountDao acDao;
	
	@GetMapping("/newaccount")
	public String newAccount(AccountBean acb) {
		System.out.println(acb.getAccountType());
		return "NewAccount";
	}
	
	@PostMapping("/saveaccount")
	public String saveAccount(AccountBean acb) {
		
		// Pull data from DB
		acDao.addAccount(acb);
		return "NewAccount";
	}
	
	
	@GetMapping("listaccount")
	public String listAccount(Model model) {
		
		List<AccountBean> list = acDao.getAllAccount();
		model.addAttribute("list",list);
		return "ListAccount";
	}
	
	@GetMapping("deleteaccount/{accountTypeId}")
	public String deleteAccount(@PathVariable("accountTypeId")Integer accountTypeId) {
		acDao.deleteAccount(accountTypeId);
		return "redirect:/listaccount";
	}
	
}
