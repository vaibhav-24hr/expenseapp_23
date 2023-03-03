package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.CategoryBean;
import com.expenses.project.dao.CategoryDao;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;
	
	@GetMapping("/newcategory") // URL for Browser
	public String newCategory(){ // Method
		return "NewCategory";  // JSP open
	}
	
	@PostMapping("/savecategory")
	public String saveCategory(CategoryBean cgb) {
		System.out.println(cgb.getCategoryName()); // Name of Category
		categoryDao.addCategory(cgb);
		
		return "NewCategory";
	}
	
	
	
	@GetMapping ("/listcategories")
	public String listCategories(Model model) {
		
		// pull all categories from DB-Table
		List<CategoryBean> list = categoryDao.getAllCategory();
		model.addAttribute("list",list);
		
		return "ListCategory";
		
	}
	
	@GetMapping("/deletecategory/{categoryId}") //"URl/{print_CATEGORYID from JSP}"
	public String deleteCategory(@PathVariable("categoryId")Integer categoryId) {  // to know categoryID from URL we need to add annotation => path@variable PATH & its datatype
								//@PathVariable()
		categoryDao.deleteCategory(categoryId);
		return "redirect:/listcategories";
		
	}
	
	
}
