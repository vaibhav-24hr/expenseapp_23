package com.expenses.project.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import org.apache.commons.io.FileUtils;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.expenses.project.bean.ChartExpenseBean;
import com.expenses.project.bean.ProfileBean;
//import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.AdminDao;
import com.expenses.project.dao.UserDao;

import ch.qos.logback.core.util.FileUtil;

@Controller
public class AdminController {

	@Autowired
	AdminDao admo;
	
	@Autowired
	UserDao udo;
	
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model){
		System.out.println("InSide admindashboard--url-metho--");
		
		// Number Of Transaction or Expenses
		int totalUsers =  admo.getUsersCount();
		int totalExpenseCount = admo.getExpenseCount();
		int totalExpenseDaily = admo.getAmmountOfExpennseDaily();
		int totalExpenseMonthly = admo.getAmmountOfExpenseMonthly();
		int ratioUsersMonthly = admo.getUserRatioMonthly();
		int ratioTransactionMonthly = admo.getRatioOfTransaction();
		Double ratioExpenseDaily = admo.getExpenseRatioForPeviousDay();
		Double ratioExpenseMonthly = admo.getExpenseRatioForPeviousMonth();
		List<ChartExpenseBean> chartData = admo.getExpenseStats();
		List<ChartExpenseBean> lineChartData = admo.getTransactionStats();
		
		model.addAttribute("NumberOfUsers", totalUsers);
		model.addAttribute("NumberOfMonthlyExpenses", totalExpenseCount);
		model.addAttribute("TodayExpense", totalExpenseDaily);
		model.addAttribute("MonthlyExpense", totalExpenseMonthly);
		model.addAttribute("ratioExpenseDaily", ratioExpenseDaily);
		model.addAttribute("ratioExpenseMonthly", ratioExpenseMonthly);
		model.addAttribute("ratioUsersMonthly", ratioUsersMonthly);
		model.addAttribute("ratioTransactionMonthly", ratioTransactionMonthly);
		model.addAttribute("chartData" , chartData);
		model.addAttribute("lineChartData" , lineChartData);

		
		
		return "AdminDashboard";
	}
	
	
	@GetMapping("/myprofile")
		public String editProfile() {
		
		return "MyProfile";
	}
	
	
	@PostMapping("/saveprofilepic")
	public String saveProfilepic(ProfileBean pBean) {
		System.out.println("in AdminController saveProfilepic() userID =>" +pBean.getUserId());
		System.out.println(pBean.getProfileImg().getOriginalFilename());
		
		try {
			File userDir = new File ("C:\\Users\\vaibhav\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\expenseManager-23_Final\\src\\main\\resources\\static\\assets\\profiles",
					pBean.getImageUrl()+"");
			if(userDir.exists() == false) {
				userDir.mkdir();
			}
			File file = new File(userDir, pBean.getProfileImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file, pBean.getProfileImg().getBytes());
			pBean.setImageUrl("assets/profiles/" + pBean.getUserId() + "/" + pBean.getProfileImg().getOriginalFilename());
			
			admo.updateImageUrl(pBean);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in image uploading");
		}
		
		return "redirect:/myprofile";
	}
	
	// This URL made in UserController
//	@GetMapping("/listusers")
//	public String listUsers(Model model) {
//		
//		List<UserBean> userlist = udo.getAllUsers();
//		model.addAttribute("userlist", userlist);
//		
//		return "ListUsers";
//	}
	
}
