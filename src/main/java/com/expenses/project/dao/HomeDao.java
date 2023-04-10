package com.expenses.project.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.ChartExpenseBean;
import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.UserBean;

@Repository
public class HomeDao {

	Calendar c = Calendar.getInstance();
	int d = c.get(Calendar.DATE);
	int m = c.get(Calendar.MONTH)+1;
	int y = c.get(Calendar.YEAR);
	
	@Autowired
	JdbcTemplate stmt;
	
	public Integer getMonthlyTransaction(Integer userId) {
		String monthly;
		String monthlyTransaction = "select count(*) from expense where userId = ? and date like ?";

		if(m<10) {
			monthly = y + "-0" + m + "-%";
		}else {
			monthly = y + "-" + m + "-%";
		}
		
		System.out.println("Monthly Numbers Transaction => " + monthly);
		return stmt.queryForObject(monthlyTransaction, Integer.class, new Object[] {userId,monthly});
		
	}
	
	
public Integer getUserAmmountOfExpenseMonthly(Integer userId) {
		String monthly;		
		String sumMonthlyExpenseQuery = "select sum(ammount) from expense where userId = ? and date like ?";

//		Integer userId = usb.getUserId();
		if(m<10) {
			monthly = y + "-0" + m + "-%";
		}else {
			monthly = y + "-" + m + "-%";
		}
		
		System.out.println("Monthly Expense Ammount => " + monthly);
		
		return stmt.queryForObject(sumMonthlyExpenseQuery, Integer.class, new Object[]{ userId ,monthly});
	}
	
	public Integer getAmmountOfIncomeMonthly(Integer userId) {
		String monthly;
		String sumMonthlyIncomeQuery = "select sum(ammount) from income where userId = ? and date like ?";

		
		if(m<10) {
			monthly = y + "-0" + m + "-%";
		}else {
			monthly = y + "-" + m + "-%";
		}
		
		System.out.println("Monthly Income => " + monthly);
		
		return stmt.queryForObject(sumMonthlyIncomeQuery, Integer.class, new Object[] {userId, monthly});
	}

public Integer getAmountOfExpenseDaily(Integer userId) {
	String today;
	String todayExpenseQuery = "select sum(ammount) from expense where userId = ? and date like ?";
	
	if (m < 10) {
		today = y + "-0" + m +  "-" + d;
	} else {
		today = y + "-" + m + "-" + d;
	}
	
	System.out.println("Daily Expense => " + today);
	
	
	return stmt.queryForObject(todayExpenseQuery, Integer.class, new Object[] {userId,today});
}
	
public List<ChartExpenseBean> getExpenseStats(Integer userId){
//	select MONTH(date) as month ,sum(ammount) as expenseAmmount from expense group by month(date) order by MONTH(date)
	String selectQuery = "select monthname(date) as month , sum(ammount) as expenseAmmount from expense where year(date) = ? and userId = ? group by monthname(date),month(date)  order by month(date)  ;";
	return 	stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),y,userId);
}

public List<ChartExpenseBean> getStatusOfTransactionStats(Integer userId){
	String selectQuery = "select s.statusShow AS Status, COUNT(e.statusId) AS Transaction from status s LEFT JOIN Expense e ON s.statusId = e.statusId WHERE userId = ? GROUP BY s.statusId;";
	return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),userId);
}
	
}
