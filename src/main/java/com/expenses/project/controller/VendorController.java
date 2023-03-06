package com.expenses.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.VendorBean;
import com.expenses.project.dao.VendorDao;

@Controller
public class VendorController {
	
	@Autowired
	VendorDao vdo;
	
	@GetMapping("/newvendor")
	public String newVendor() {
		return "NewVendor";
	}
	
	
	@PostMapping("/savevendor")
	public String saveVendor(VendorBean vb) {
		System.out.println(vb.getVendorName());
		
		vdo.addVendor(vb);
		return "NewVendor";
	}
	
	
	@GetMapping("/listvendor")
	public String listVendor(Model model) {
		
		//pull all Vendors List from DB-tABLE
		List<VendorBean> list = vdo.getAllVendor();
		
		model.addAttribute("list",list);
		
	return "ListVendor";	
	} 
	
	@GetMapping("/deletevendor/{vendorId}")
	public String deleteVendor(@PathVariable("vendorId") Integer vendorId) {
			vdo.deleteVendor(vendorId);
		return "redirect:/listvendor";
	}
	
	
	

}
