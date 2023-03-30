package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.expenses.project.bean.CategoryBean;
import com.expenses.project.dao.CategoryDao;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao cDao;
	
	@GetMapping("/newcategory") // URL for Browser
	public String newCategory(){ // Method
		return "NewCategory";  // JSP open
	}
	
	@PostMapping("/savecategory")
	public String saveCategory(CategoryBean cgb) {
		System.out.println(cgb.getCategoryName()); // Name of Category
		cDao.addCategory(cgb);
		
		return "NewCategory";
	}
	
	
	
	@GetMapping ("/listcategories")
	public String listCategories(Model model) {
		
		// pull all categories from DB-Table
		List<CategoryBean> list = cDao.getAllCategory();
		model.addAttribute("list",list);
		
		return "ListCategory";
		
	}
	
	@GetMapping("/deletecategory/{categoryId}") //"URl/{print_CATEGORYID from JSP}"
	public String deleteCategory(@PathVariable("categoryId")Integer categoryId) {  // to know categoryID from URL we need to add annotation => path@variable PATH & its datatype
								//@PathVariable()
		cDao.deleteCategory(categoryId);
		return "redirect:/listcategories";
		
	}
	
	@GetMapping("/viewcategory")
	public String viewCategory(@RequestParam("categoryId")Integer categoryId, Model model) {
		CategoryBean cb = cDao.getCategoryById(categoryId);
		model.addAttribute("cb", cb);
		return "ViewCategory";
	}
	
	@GetMapping("/editcategory")
	public String editCategory(@RequestParam("categoryId")Integer categoryId, Model model) {
		CategoryBean cBean = cDao.getCategoryById(categoryId);
		model.addAttribute("cBean" , cBean);
		return "EditCategory";
	}
	
	@PostMapping("/updatecategory")
	public String updateCategory(CategoryBean cBean) {
// (Attr) we take cBean as attributr for data because ID & NAME are arriving and going to update from DAO		
		cDao.updateCategory(cBean); 
		return "redirect:/listcategories";
	}
	
	
	
}
