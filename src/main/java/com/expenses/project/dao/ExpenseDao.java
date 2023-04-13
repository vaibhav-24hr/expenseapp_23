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
	
	
	
	
	public List<ExpenseBean> getAllExpenseByUser(Integer userId){
		
		String selectQuery = "select e.userId, e.expenseId, e.title, e.ammount, e.date, e.description, c.categoryName, sc.subcategoryName, v.vendorName, a.accountType, s.statusShow from expense e, category c, subcategory sc, vendor v, accountType a, status s where e.categoryId = c.categoryId and e.subCategoryId = sc.subCategoryId and e.vendorId = v.vendorId and e.accountTypeId = a.accountTypeId and e.statusId = s.statusId and userId = ?";
		List<ExpenseBean> explist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {userId});
		
		return explist;
	}




	public ExpenseBean getExpenseById(Integer expenseId) {
		// TODO Auto-generated method stub
		
		ExpenseBean exb = null;
		String selectQuery = "select e.expenseId, e.title, e.ammount, e.date, e.description, c.categoryName, sc.subcategoryName, v.vendorName, a.accountType, s.statusShow from expense e, category c, subcategory sc, vendor v, accountType a, status s where e.categoryId = c.categoryId and e.subCategoryId = sc.subCategoryId and e.vendorId = v.vendorId and e.accountTypeId = a.accountTypeId and e.statusId = s.statusId and expenseId = ?";
// String selectQuery= "select * from expense where expenseId = ?"; 
		try {
			exb = stmt.queryForObject(selectQuery ,new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[]{expenseId});
		}catch (Exception e) {
			System.out.println("Expense DAO : getExpenseById();");
			System.out.println(e.getMessage());
		}
	return exb;
	}

// for Admin Dashboard
	public List<ExpenseBean> getAllExpense(){
		
		String selectQuery = "select e.userId, e.expenseId, e.title, e.ammount, e.date, e.description, c.categoryName, sc.subcategoryName, v.vendorName, a.accountType, s.statusShow from expense e, category c, subcategory sc, vendor v, accountType a, status s where e.categoryId = c.categoryId and e.subCategoryId = sc.subCategoryId and e.vendorId = v.vendorId and e.accountTypeId = a.accountTypeId and e.statusId = s.statusId";
		List<ExpenseBean> explist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class));
		return explist;
	}




	public ExpenseBean getAllExpenseById(Integer expenseId) {
		// TODO Auto-generated method stub
		ExpenseBean AllExb = null;  
		String selectQuery = "select e.userId, e.expenseId, u.firstName, u.lastName, u.email, e.title, e.ammount, e.date, e.description, c.categoryName, sc.subcategoryName, v.vendorName, a.accountType, s.statusShow from expense e,users u, category c, subcategory sc, vendor v, accountType a, status s where e.categoryId = c.categoryId and e.subCategoryId = sc.subCategoryId and e.userId = u.userId and e.vendorId = v.vendorId and e.accountTypeId = a.accountTypeId and e.statusId = s.statusId and expenseId = ?";
		try {
			AllExb = stmt.queryForObject(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[]{expenseId});
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Expense DAO : getAllExpenseById();");
			System.out.println(e.getMessage());
		}
		return AllExb;
	}
	
	
	public void updateExpense(ExpenseBean exBean) {
		String updateQuery = " update expense set statusId = ? , accountTypeId = ? where expenseId = ?";
		stmt.update(updateQuery,exBean.getStatusId(),exBean.getAccountTypeId(),exBean.getExpenseId());
	}

	
	
}
