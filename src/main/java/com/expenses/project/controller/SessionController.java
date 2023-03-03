package com.expenses.project.controller;

//import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

//import com.expenses.project.bean.AuthenticationBean;
import com.expenses.project.bean.ForgetPasswordBean;
import com.expenses.project.bean.LoginBean;
import com.expenses.project.bean.UpdatePasswordBean;
import com.expenses.project.bean.UserBean;
import com.expenses.project.dao.UserDao;
import com.expenses.project.service.EmailService;
import com.expenses.project.util.OtpGenerator;

//annotation
@Controller
public class SessionController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	EmailService emailService;
	
	// for open JSP  
	@GetMapping("/signup")
	public String signup() {

		return "Signup";
	}
	

	
	@GetMapping("/forgetpassword")
	public String forgetpassword() {
		return "ForgetPassword";
	} 	
	
	@GetMapping("/login")
	public String login() {
		return "Login";
	}
	
	@GetMapping("/")
	public String root() {
		return "Login";
	}
	
	// for process JSP
	
	@PostMapping("/saveuser")
	public String saveUser(UserBean user) {
		System.out.println("jai Hind....");
		System.out.println(user.getFirstName());
		System.out.println(user.getEmail());
		
		//
		userDao.insertUser(user);
		//
		
		return "Login";
	}
	
	@PostMapping("/sendotpforforgetpassword")
		public String sendOtpForForgetPassword(ForgetPasswordBean fpb, Model model) {
		System.out.println(fpb.getEmail());
		
		UserBean user = userDao.findUserByEmail(fpb); // query from userdao class > findUserByEmail method > fpb obj
		
		if(user==null) {
			model.addAttribute("error", "Invalid Email");
			return forgetpassword();	
		
		}else {
			
			// generate OTP //int otp = (int)(Math.random()*1000000);
			
			String otp = OtpGenerator.generateOTP(4);
			userDao.updateOtp(fpb.getEmail(), otp);
			//user set --> email 
			//send mail 
			emailService.sendEmailForForgetPassword(fpb.getEmail(),otp);
			return "redirect:/updatepasswordjspopen";
														// query for OTP generator
		}
		
	}
	
	
	
	@PostMapping("/authentication")
	public String authentication(LoginBean logb, Model model) {
		System.out.println(logb.getEmail());
		System.out.println(logb.getPassword());
		
		
		// validation : true
		// db -> users -> email : password match -> loginBean:email,password
		
		UserBean usB = userDao.authenticateUser(logb);
		
		if (usB == null) {
			// inValid
			model.addAttribute("error","Invalid Credentials");
			return "Login";
		} else {
			if(usB.getRole() == 2) {
				return "redirect:/home";
			}else if (usB.getRole() == 1) {
				return "redirect:/admindashboard";// JSP Name
			}else	
			return "404"; // JSP Name
		}		
		
	}
	
	@GetMapping("/updatepasswordjspopen")
	public String updatePasswordJspOpen() {
		return "UpdatePassword";
		
	}
	
	
	@PostMapping("updatemypassword")
	public String updateMyPassword(UpdatePasswordBean upb, Model model) {
		
		
		
		System.out.println(upb.getEmail());
		System.out.println(upb.getPassword());
		System.out.println(upb.getOtp());
		
		// DB
		
		UserBean usb = userDao.otpValid(upb);
		
		
		if (usb == null) {
			
			//model.addAttribute("error","Invalid Credentials");
			return "UpdatePassword";
			// Valid
		}else {
			userDao.updateMyPassword(upb);
			return "Login";		
		}
	}

}
