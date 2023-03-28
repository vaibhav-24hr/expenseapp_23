package com.expenses.project.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.ForgetPasswordBean;
import com.expenses.project.bean.LoginBean;
import com.expenses.project.bean.UpdatePasswordBean;
import com.expenses.project.bean.UserBean;

@Repository
public class UserDao {

	@Autowired
	JdbcTemplate stmt;
	
	Calendar c = Calendar.getInstance();
	int d = c.get(c.DAY_OF_MONTH); //07 
	int m = c.get(c.MONTH) + 1;//03
	int y = c.get(c.YEAR);//2023 
	
	//add customer -- signup 
	public void insertUser(UserBean usb) {
		String today ="";
		
		if (m < 10) {
			today = y + "-0" + m + "-" + d;
		} else {
			today = y + "-" + m + "-" + d;
		}if(d<10) {
			today = y + "-" + m + "-0" + d;
		}else {
			today = y + "-" + m + "-" + d;
		}

		System.out.println(today);
		
		String insertQuery = "insert into users (firstName,lastName,email,dob,contactNum,gender,password,joindate,role) values (?,?,?,?,?,?,?,?,?)"; 

	//role - 2 for customer/buyer/user
		stmt.update(insertQuery,usb.getFirstName(),usb.getLastName(),usb.getEmail(),usb.getDob(),usb.getContactNum(),usb.getGender(),usb.getPassword(),today,2);//query execute 
		System.out.println("user added...");
		
	}
	
	public UserBean authenticateUser(LoginBean lb) {
		try {
		String loginQuery = "select * from users where email = ? and password = ? "; // Query
		UserBean user = stmt.queryForObject(loginQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
				new Object[] {lb.getEmail(), lb.getPassword()});
		
		return user;
		
		}catch(Exception e){
			System.out.println("SMW --> UserDao::authenticateUser()");
			System.out.println(e.getMessage());
		}
		return null;
	}
	

	public UserBean findUserByEmail(ForgetPasswordBean fpb) {
		// TODO Auto-generated method stub
		try {
			String selectEmailQuery = "select * from users where email = ?";
			UserBean user = stmt.queryForObject(selectEmailQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] { fpb.getEmail()});
			return user;
		}catch (Exception e) {
				System.out.println("SMW --> UserDao::authenticateUser()");
				System.out.println(e.getMessage()); 
			
		}
		return null;
	} // end of fpb
	
	
	
	public void updateOtp(String email, String otp) {
		String updateOtpQuery = "update users set otp = ? where email = ?";
		stmt.update(updateOtpQuery,otp,email);
	}
	
	public void updateMyPassword(UpdatePasswordBean upb) {
		String updateQuery = "update users set password = ? , otp = ? where email = ? ";
		stmt.update(updateQuery,upb.getPassword(), "" , upb.getEmail());
	}
	
	
	public UserBean otpValid(UpdatePasswordBean upb) {
		try {
			String otpQuery = "select * from users where email = ? and otp = ?";
			UserBean user = stmt.queryForObject(otpQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] {upb.getEmail() , upb.getOtp()});
			
			return user;
		}catch(Exception e) {
			System.out.println("---> validate OTP");
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	
	public UserBean getUserByEmail(String email) {
		String selecyQuery = "select * from users where email = ?";
		
		try {
			return stmt.queryForObject(selecyQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class), new Object[] {email});
		}catch(Exception e){	
			System.out.println(e.getMessage());
		}
	return null;
	}
	
	
	
	public List<UserBean> getAllUsers(){
		
		String selectQuery = "select * from users where role = 2";
		List<UserBean> userlist = stmt.query(selectQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return userlist;
	}	
	

	
	
	
}
