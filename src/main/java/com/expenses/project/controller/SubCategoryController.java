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
import com.expenses.project.bean.SubCategoryBean;
import com.expenses.project.dao.CategoryDao;
import com.expenses.project.dao.SubCategoryDao;

@Controller
public class SubCategoryController {
	

	@Autowired
	CategoryDao cDao;
	@Autowired
	SubCategoryDao scDao;

	@GetMapping("/newsubcategory") // URL
	public String newSubCategory(Model model) { // File
		model.addAttribute("list", cDao.getAvailableCategory());
		return "NewSubCategory"; // JSP file
	}
	
	@PostMapping("/savesubcategory")
	public String saveSubCategory(SubCategoryBean scb, Model model) {
		System.out.println(scb.getSubCategoryName());
		System.out.println(scb.getCategoryId());    // DaoObj.DaoMethod(BeanObj)
		
		// DAO
		// Insert
		scDao.addSubCategory(scb);
		
		List<SubCategoryBean> sclist = scDao.getAllSubCategory();
		model.addAttribute("sclist",sclist);
		
		return "ListSubCategory"; // redirect 
	}
	
	@GetMapping("listsubcategories")
	public String listSubCategory(Model model) {
		// pull all categories from DB-Table
		List<SubCategoryBean> sclist = scDao.getAllSubCategory();
		
		model.addAttribute("sclist",sclist);
		return "ListSubCategory";
	}
	
	@GetMapping("/deletesubcategory/{subCategoryId}")
	public String deleteSubcategory(@PathVariable("subCategoryId")Integer subCategoryId){
		scDao.deleteSubcategory(subCategoryId);
		return "redirect:/listsubcategories";  // this will open listSubcategory and there is one query that print only fall action list...
		
	}
	
	@GetMapping("/viewsubcategory")
	public String viewSubCategory(@RequestParam("subCategoryId")Integer subCategoryId, Model model) {
		
		SubCategoryBean scb = scDao.getSubCategoryById(subCategoryId);
		model.addAttribute("scb", scb);
		return "ViewSubCategory";
	}
	
	@GetMapping("editsubcategory")
	public String editSubCategory(@RequestParam("subCategoryId")Integer subCategoryId, Model model) {
		SubCategoryBean scBean = scDao.getSubCategoryById(subCategoryId);
		model.addAttribute("scBean" , scBean);
		model.addAttribute("list", cDao.getAvailableCategory());
		return "EditSubCategory";
	}
	
	@PostMapping("updatesubcategory")
	public String updateSubCategory(SubCategoryBean scBean) {
		scDao.updateSubcategory(scBean);
		return "redirect:/listsubcategories";
	}
	
}






