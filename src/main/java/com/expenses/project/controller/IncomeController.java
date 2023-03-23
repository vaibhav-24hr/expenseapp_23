package com.expenses.project.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.AccountBean;
import com.expenses.project.bean.IncomeBean;
import com.expenses.project.bean.StatusBean;
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
	public String newIncome(Model model) {
		
		List<AccountBean> acclist = ado.getAllAccount();
		model.addAttribute("acclist" , acclist);
		
		List<StatusBean> stlist = std.getAllStatus();
		model.addAttribute("stlist" , stlist);
		
		return "NewIncome";
	}
	
	
	@PostMapping("saveincome")
	public String saveIncome(IncomeBean inb, HttpServletRequest req, Model model) {
		
		List<AccountBean> acclist = ado.getAllAccount();
		model.addAttribute("acclist" , acclist);
		
		List<StatusBean> stlist = std.getAllStatus();
		model.addAttribute("stlist" , stlist);
		
		int userId = -1;
		String firstName = "";
		Cookie c[] = req.getCookies();

		for(Cookie x : c) {
			if(x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		
		inb.setUserId(userId);
		ido.addIncome(inb);
		
		
		System.out.println("Title : " + inb.getTitle());
		System.out.println( "Account Type ID : " + inb.getAccountTypeId());
		System.out.println( "Status ID : " + inb.getStatusId());
		System.out.println( "Date : " + inb.getDate());
		System.out.println( "Ammount : " + inb.getAmmount());
		System.out.println("Description : " + inb.getDescription());
	
		
		
		return "NewIncome";
	}
	
	
	@GetMapping("/listincome")
	public String listIncome(Model model, IncomeBean inb, HttpServletRequest req) {
		
//
		int userId =-1;
		String firstName="";
		Cookie c[] = req.getCookies();
		for(Cookie x : c) {
			if (x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		//pull all expense from db-table
		inb.setUserId(userId);
		
		List<IncomeBean> inclist = ido.getAllIncome(userId);
		System.out.println(inclist);
		
		model.addAttribute("inclist",inclist);
		
		return "ListIncome";
	}
	
	@GetMapping("/viewincome/{incomeId}")
	public String viewIncome(@PathVariable("incomeId")Integer incomeId, Model model) {
		IncomeBean inb = ido.getIncomeById(incomeId);
		model.addAttribute("inb", inb);
		return "ViewIncome";
	}
	
}
