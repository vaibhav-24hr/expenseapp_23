package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.AccountBean;
import com.expenses.project.bean.CategoryBean;
import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.StatusBean;
import com.expenses.project.bean.SubCategoryBean;
import com.expenses.project.bean.VendorBean;
import com.expenses.project.dao.AccountDao;
import com.expenses.project.dao.CategoryDao;
import com.expenses.project.dao.StatusDao;
import com.expenses.project.dao.SubCategoryDao;
import com.expenses.project.dao.VendorDao;

@Controller
public class ExpenseController {
	
	@Autowired
	CategoryDao cgd;
	
	@Autowired
	SubCategoryDao scd;
	
	@Autowired
	VendorDao vdo;
	
	@Autowired
	AccountDao acd;
	
	@Autowired
	StatusDao std;
	
	
	
	@GetMapping("/newexpense")
	public String newExpense(ExpenseBean exb,Model model) {
		

		List<CategoryBean> list = cgd.getAllCategory();
		model.addAttribute("list",list);
		
		 List<SubCategoryBean> sublist = scd.getAllSubCategory();
		 model.addAttribute("sublist",sublist);
		 
		 List<AccountBean> acclist = acd.getAllAccount();
		 model.addAttribute("acclist", acclist);
		 
		 List<VendorBean> vendorlist = vdo.getAllVendor();
		 model.addAttribute("vendorlist", vendorlist);
		
		 List<StatusBean> stlist = std.getAllStatus();
		 model.addAttribute("stlist", stlist);
		 
		 List<VendorBean> vdlist = vdo.getAllVendor();
		 model.addAttribute("vdlist", vdlist);
		 
//			
		
		 
				 return "NewExpense";
		
		
	}
	
	@PostMapping("/saveexpense")
	public String saveExpense(ExpenseBean exb , Model model) {
		 
//		cgd.addCategory(cgb);
		
		List<CategoryBean> list = cgd.getAllCategory();
		model.addAttribute("list",list);
		
		 List<SubCategoryBean> sublist = scd.getAllSubCategory();
		 model.addAttribute("sublist",sublist);
		 
		 List<AccountBean> acclist = acd.getAllAccount();
		 model.addAttribute("acclist", acclist);
		 
		 List<VendorBean> vendorlist = vdo.getAllVendor();
		 model.addAttribute("vendorlist", vendorlist);
		
		 List<StatusBean> stlist = std.getAllStatus();
		 model.addAttribute("stlist", stlist);
		 
		 List<VendorBean> vdlist = vdo.getAllVendor();
		 model.addAttribute("vdlist", vdlist);
		
		System.out.println();
		System.out.println( "Title : " + exb.getTitle());
		System.out.println("Vendor : " +  exb.getVendorId());
		System.out.println("Category : " + exb.getCategoryId());
		System.out.println("Sub Category : " + exb.getSubCategoryId());
		System.out.println("Account : " + exb.getAccountTypeId());
		System.out.println("Status : " + exb.getStatusId());
		
		
		
		return "NewExpense";
	}

}
