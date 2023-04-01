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
import com.expenses.project.bean.VendorBean;
import com.expenses.project.dao.VendorDao;

@Controller
public class VendorController {
	
	@Autowired
	VendorDao vDao;
	
	@GetMapping("/newvendor")
	public String newVendor() {
		return "NewVendor";
	}
	
	
	@PostMapping("/savevendor")
	public String saveVendor(VendorBean vb) {
		System.out.println(vb.getVendorName());
		
		vDao.addVendor(vb);
		return "NewVendor";
	}
	
	
	@GetMapping("/listvendor")
	public String listVendor(Model model) {
		
		//pull all Vendors List from DB-tABLE
		List<VendorBean> list = vDao.getAllVendor();
		
		model.addAttribute("list",list);
		
	return "ListVendor";	
	} 
	
	@GetMapping("/deletevendor/{vendorId}")
	public String deleteVendor(@PathVariable("vendorId") Integer vendorId) {
			vDao.deleteVendor(vendorId);
		return "redirect:/listvendor";
	}
	
	@GetMapping("/editvendor")
	public String editvendor(@RequestParam("vendorId")Integer vendorId, Model model) {
		VendorBean vBean = vDao.getVendorById(vendorId);
		model.addAttribute("vBean" , vBean);
		return "EditVendor";
	}
	
	@PostMapping("/updatevendor")
	public String updatevendor(VendorBean vBean) {
// (Attr) we take vBean as attributr for data because ID & NAME are arriving and going to update from DAO		
		vDao.updatevendor(vBean); 
		return "redirect:/listvendor";
	}
	
	
	

}
