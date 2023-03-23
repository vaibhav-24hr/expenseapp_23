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
		
		String selectQuery = "select e.title, e.ammount, e.date, e.description, c.categoryName, sc.subcategoryName, v.vendorName,\r\n"
				+ " a.accountType, s.statusShow from expense e, category c, subcategory sc, vendor v, accountType a,\r\n"
				+ " status s where e.categoryId = c.categoryId and e.subCategoryId = sc.subCategoryId \r\n"
				+ " and e.vendorId = v.vendorId and e.accountTypeId = a.accountTypeId and e.statusId = s.statusId \r\n"
				+ " and userId = ?; ";
		List<ExpenseBean> explist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {userId});
		
		return explist;
	}




	public ExpenseBean getExpenseById(Integer expenseId) {
		// TODO Auto-generated method stub
		ExpenseBean exb = null;
		
		try {
			exb = stmt.queryForObject("select * from expense where expenseId = ?", new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[]{expenseId});
		}catch (Exception e) {
			System.out.println("Expense DAO : getExpenseById();");
			System.out.println(e.getMessage());
		}
		
		
	return exb;
	}




	
	
}
