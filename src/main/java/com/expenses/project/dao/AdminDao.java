package com.expenses.project.dao;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	@Autowired
	JdbcTemplate stmt;
	
	public Integer getUsersCount() {
		String countUserQuery = "select count(*) from users where joindate like ?";
		// select count(*) from users where joindate = '08-03-2023';
		
		// dd-mm-yyyy
		Calendar c = Calendar.getInstance();
		int d = c.get(Calendar.DATE);
		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
//		String today  = d  + "-" + m +"-" +y;
		
		String today;
		
		
		if(m<10) {
			today = d + "-0" + m + "-" + y;
		}else {
			today = d + "-" + m + "-" + y;
		}
//		
//		 today = "%-" + m +  "-" + y;
		
//		today ;
		today = "%-" + y;
		 
		System.out.println("Today count USER => " +  today);
		
//		 int num = stmt.queryForObject(countQuery, Integer.class, new Object[] {today});
		return stmt.queryForObject(countUserQuery, Integer.class, new Object[] {today});
	}
	
	public Integer getExpenseCount() {
		String countExpenseQuery = "select count(*) from expense where date like ?";
		
		Calendar c = Calendar.getInstance(); 
//		int d = c.get(Calendar.DATE);
//		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
		String today =   y + "-%";
		
//		if(m<10) {
//			today = d + "-0" + m + "-" + y;
//		}else {
//			today = d + "-" + m + "-" + y;
//		}
		System.out.println("Today Number Of Expense => " +  today);
		
		return stmt.queryForObject(countExpenseQuery, Integer.class, new Object[] {today});
		
	}
	
	
	public Integer getAmmountOfIncome() {
		String sumIncomeQuery = "select sum(ammount) from income where date like ?";
	
		Calendar c = Calendar.getInstance(); 
//		int d = c.get(Calendar.DATE);
//		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
		String today =   y + "-%";
		
//		if(m<10) {
//			today = d + "-0" + m + "-" + y;
//		}else {
//			today = d + "-" + m + "-" + y;
//		}
		System.out.println("Today income Ammount => " +  today);
		
		return stmt.queryForObject(sumIncomeQuery, Integer.class, new Object[] {today});
		
	}
	
	
	
	
public Integer getAmmountOfExpense() {
		
		String sumExpenseQuery = "select sum(ammount) from expense where date like ?";
		
		Calendar c = Calendar.getInstance(); 
		
//		int d = c.get(Calendar.DATE);
//		int m = c.get(Calendar.MONTH)+1;
		int y = c.get(Calendar.YEAR);
		
		String today =   y + "-%";
		
//		if(m<10) {
//			today = d + "-0" + m + "-" + y;
//		}else {
//			today = d + "-" + m + "-" + y;
//		}
		
		System.out.println("Today sum of expense => " +  today);
		
		return stmt.queryForObject(sumExpenseQuery, Integer.class, new Object[] {today});
		
	}	
	
	
}
