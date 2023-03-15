package com.expenses.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.expenses.project.dao.AccountDao;
import com.expenses.project.dao.IncomeDao;
import com.expenses.project.dao.StatusDao;
import com.expenses.project.dao.UserDao;

@Controller
public class IncomeController {

	@Autowired
	UserDao udo;

	@Autowired
	AccountDao ado;
	
	@Autowired
	StatusDao std;
	
	@Autowired	
	IncomeDao ido;
	
	
	@GetMapping("newincome")
	public String newIncome() {
		
		return "NewIncome";
	}
	
}
