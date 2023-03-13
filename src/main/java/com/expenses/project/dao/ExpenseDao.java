package com.expenses.project.dao;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.ExpenseBean;

@Repository
public class ExpenseDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void addExpense(ExpenseBean exb , HttpServletRequest req) {
		
		int userId = -1;
		String firstName = "";
		Cookie c[] = req.getCookies();
		
		for(Cookie x : c) {
			if(x.getName().equals("userId")) {
				userId = Integer.parseInt(x.getValue());
			}
			if(x.getName().equals("firstName")) {
				firstName = x.getValue();
			}
		}
		
		String insertQuery = "insert into expense(title, categoryId, subCategoryId, vendorId, accountTypeId, statusId, ammount, date, description, userId) values(?,?,?,?,?,?,?,?,?,?)";
		stmt.update(insertQuery, exb.getTitle(), exb.getCategoryId(), exb.getSubCategoryId(), exb.getVendorId(), exb.getAccountTypeId(), exb.getStatusId(), exb.getAmmount(), exb.getDate(), exb.getDescription(), exb.getUserId());
	}
	
	
	
	
	public List<ExpenseBean> getAllExpense(Integer userId){
		
		String selectQuery = "select * from expense where userId = ?";
		List<ExpenseBean> explist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {userId});
		
		return explist;
	}
	
}
