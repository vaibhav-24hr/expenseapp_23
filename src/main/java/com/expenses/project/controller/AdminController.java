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
import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.ProfileBean;
import com.expenses.project.bean.UserBean;
//import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.AdminDao;
import com.expenses.project.dao.UserDao;

import ch.qos.logback.core.util.FileUtil;

@Controller
public class AdminController {

	@Autowired
	AdminDao admDao;
	
	@Autowired
	UserDao uDao;
	
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model){
		System.out.println("InSide admindashboard--url-metho--");
		
		// Number Of Transaction or Expenses
		int totalUsers =  admDao.getUsersCount();
		int totalExpenseCount = admDao.getExpenseCount();
		int totalExpenseDaily = admDao.getAmmountOfExpennseDaily();
		int totalExpenseMonthly = admDao.getAmmountOfExpenseMonthly();
		int ratioUsersMonthly = admDao.getUserRatioMonthly();
		int ratioTransactionMonthly = admDao.getRatioOfTransaction();
		Double ratioExpenseDaily = admDao.getExpenseRatioForPeviousDay();
		Double ratioExpenseMonthly = admDao.getExpenseRatioForPeviousMonth();
		List<ChartExpenseBean> chartData = admDao.getExpenseStats();
		List<ChartExpenseBean> lineChartData = admDao.getTransactionStats();
		List<ChartExpenseBean> donutChartData = admDao.getTransactionTypeStats();
		
		List<ChartExpenseBean> categData = admDao.getCategoryStatsMonthly();
		List<ChartExpenseBean> vendorData = admDao.getVendorStatsMonthly();
		List<ChartExpenseBean> categDataAmmount = admDao.getCategoryStatsAmmountMonthly();
		List<ChartExpenseBean> vendorDataAmmount = admDao.getVendorStatsAmmountMonthly();
		
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
		model.addAttribute("donutChartData", donutChartData);
		model.addAttribute("categData", categData);
		model.addAttribute("vendorData", vendorData);
		model.addAttribute("categDataAmmount", categDataAmmount);
		model.addAttribute("vendorDataAmmount", vendorDataAmmount);
		
		
		return "AdminDashboard";
	}
	
	
	@GetMapping("/myprofile")
		public String editProfile() {
		
		return "MyProfile";
	}
	
	
	@PostMapping("/saveprofilepic")
	public String saveProfilePic(ProfileBean pBean, UserBean usBean) {
		System.out.println("in AdminController saveProfilepic() userID =>" +pBean.getUserId());
		System.out.println("in AdminController saveuserprofile() userID =>" +usBean.getUserId());
		System.out.println(pBean.getProfileImg().getOriginalFilename());
		System.out.println("userDetails updated => " + usBean.getFirstName() + usBean.getLastName());
		admDao.updateUser(usBean);
		try {
			File userDir = new File ("C:\\Users\\vaibhav\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\expenseManager-23_Final\\src\\main\\resources\\static\\assets\\profiles",
					pBean.getUserId()+"");
			if(userDir.exists() == false) {
				userDir.mkdir();
			}
			File file = new File(userDir, pBean.getProfileImg().getOriginalFilename());
			FileUtils.writeByteArrayToFile(file, pBean.getProfileImg().getBytes());
			pBean.setImageUrl("assets/profiles/" + pBean.getUserId() + "/" + pBean.getProfileImg().getOriginalFilename());
			
			admDao.updateImageUrl(pBean);
		
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
