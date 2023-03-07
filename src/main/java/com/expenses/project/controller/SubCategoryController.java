package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.CategoryBean;
import com.expenses.project.bean.SubCategoryBean;
import com.expenses.project.dao.CategoryDao;
import com.expenses.project.dao.SubCategoryDao;

@Controller
public class SubCategoryController {
	
//	SubCategoryDao scd;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SubCategoryDao scd;

	@GetMapping("/newsubcategory") // URL
	public String newSubCategory(Model model) { // File
		model.addAttribute("list", categoryDao.getAllCategory());
		return "NewSubCategory"; // JSP file
	}
	
	@PostMapping("/savesubcategory")
	public String saveSubCategory(SubCategoryBean scb, Model model) {
		System.out.println(scb.getSubCategoryName());
		System.out.println(scb.getCategoryId());    // DaoObj.DaoMethod(BeanObj)
		
		// DAO
		// Insert
		scd.addSubCategory(scb);
		
		List<SubCategoryBean> list = scd.getAllSubCategory();
		model.addAttribute("list",list);
		
		return "ListSubCategory"; // redirect 
	}
	
	@GetMapping("listsubcategories")
	public String listSubCategory(Model model) {
		// pull all categories from DB-Table
		List<SubCategoryBean> list = scd.getAllSubCategory();
		model.addAttribute("list",list);
		return "ListSubCategory";
	}
	
	@GetMapping("/deletesubcategory/{subCategoryId}")
	public String deleteSubcategory(@PathVariable("subCategoryId")Integer subCategoryId){
		scd.deleteSubcategory(subCategoryId);
		return "redirect:/listsubcategories";  // this will open listSubcategory and there is one query that print only fall action list...
		
	}
	
	@GetMapping("/viewsubcategory/{subCategoryId}")
	public String viewSubCategory(@PathVariable("subCategoryId")Integer subCategoryId, Model model) {
		
		SubCategoryBean scb = scd.getSubCategoryById(subCategoryId);
		model.addAttribute("scb", scb);
		return "ViewSubCategory";
	}
	
}






