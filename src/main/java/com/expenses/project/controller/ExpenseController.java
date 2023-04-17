package com.expenses.project.controller;

import java.security.PublicKey;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.expenses.project.bean.AccountBean;
import com.expenses.project.bean.CategoryBean;
import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.StatusBean;
import com.expenses.project.bean.SubCategoryBean;
import com.expenses.project.bean.VendorBean;
import com.expenses.project.dao.AccountDao;
import com.expenses.project.dao.CategoryDao;
import com.expenses.project.dao.ExpenseDao;
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
	
	@Autowired
	ExpenseDao exd;
	
	@Autowired
	AccountDao acDao;
	
	
	
	@GetMapping("/newexpense")
	public String newExpense(ExpenseBean exb,Model model) {
		

		List<CategoryBean> list = cgd.getAvailableCategory();
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
		 
				 return "NewExpense";
		
		
	}
	
	@PostMapping("/saveexpense")
	public String saveExpense(ExpenseBean exb , Model model, HttpServletRequest req) {
		 
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
		 
//		 List<VendorBean> vdlist = vdo.getAllVendor();
//		 model.addAttribute("vdlist", vdlist);
		
		
		int userId = -1;
		String firstName = "";
		
		Cookie c[] =  req.getCookies();
		
		for(Cookie x : c) {
			if(x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		
		System.out.println();
		System.out.println( "Title : " + exb.getTitle());
		System.out.println("Vendor : " +  exb.getVendorId());
		System.out.println("Category : " + exb.getCategoryId());
		System.out.println("Sub Category : " + exb.getSubCategoryId());
		System.out.println("Account : " + exb.getAccountTypeId());
		System.out.println("Status : " + exb.getStatusId());
		System.out.println("Ammount : " + exb.getAmmount());
		
		exb.setUserId(userId);
		System.out.println(exb.getUserId());
		exd.addExpense(exb, req);
		
		return "NewExpense";
	}
	
	@GetMapping("listexpense")
	public String listExpense(ExpenseBean exb , HttpServletRequest req , Model model) {
		
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
		// Pull All Data from DB
		
		exb.setUserId(userId);
		List<ExpenseBean> explist = exd.getAllExpenseByUser(userId);
		System.out.println(explist);
		model.addAttribute("explist", explist);
		
		return "ListExpense";
	}
	
	@GetMapping("/viewexpense")
	public String viewExpense(@RequestParam("expenseId") Integer expenseId , Model model){
		ExpenseBean exb =  exd.getExpenseById(expenseId);
		System.out.println(exb.getExpenseId());
		model.addAttribute("exb", exb);
		return "ViewExpense";
	}
	
	// For Admin
	@GetMapping("/allexpenses")
	public String allExpenses(Model model) {
		List<ExpenseBean> allExpList = exd.getAllExpense();
		model.addAttribute("allExpList", allExpList);
		return "AllExpenses";
	}

	@GetMapping("/viewallexpense")
	public String viewAllExpense(@RequestParam("expenseId") Integer expenseId , Model model){
		ExpenseBean AllExb =  exd.getAllExpenseById(expenseId);
		System.out.println(AllExb.getExpenseId());
		model.addAttribute("AllExb", AllExb);
		return "ViewAllExpense";
	}
	
	@GetMapping("/editexpense")
	public String editExpense(@RequestParam("expenseId")Integer expenseId , Model model) {
		ExpenseBean exBean = exd.getExpenseById(expenseId);

		 List<CategoryBean> clist = cgd.getAllCategory();
		 model.addAttribute("clist",clist);
		
		 List<SubCategoryBean> sublist = scd.getAllSubCategory();
		 model.addAttribute("sublist",sublist);
		 
		 List<AccountBean> acclist = acd.getAllAccount();
		 model.addAttribute("acclist", acclist);
		 
		 List<VendorBean> vendorlist = vdo.getAllVendor();
		 model.addAttribute("vendorlist", vendorlist);
		
		 List<StatusBean> statuslist =  std.getAllStatus(); 
		 model.addAttribute( "statuslist" ,statuslist);
		
		
		
		System.out.println("editExpense() expenseId => " + expenseId);
		
		System.out.println("Expense Status Id =>" + exBean.getStatusId());
		
		model.addAttribute("exBean" , exBean); // All info of Expense go to JSP 
		model.addAttribute("allExpList" , exd.getAllExpense());


		return "EditExpense";
	}
	
	@PostMapping("/updateexpense")
	public String updateExpense(ExpenseBean exBean) {
		exd.updateExpense(exBean);
		return "redirect:/listexpense";
	}
	
	@GetMapping("/uploadbill")
	public String uploadBill() {
		return "UploadBill";
	}
}
