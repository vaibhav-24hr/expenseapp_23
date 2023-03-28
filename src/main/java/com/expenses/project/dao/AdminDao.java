package com.expenses.project.dao;

import java.util.Calendar;

//import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	Calendar c = Calendar.getInstance();
	int d = c.get(Calendar.DATE);
	int m = c.get(Calendar.MONTH) + 1;
	int y = c.get(Calendar.YEAR);
		
	
	@Autowired
	JdbcTemplate stmt;

	public Integer getUsersCount() {
		String countUserQuery = "select count(*) from users where joindate like ?";
		// select count(*) from users where joindate = '2023-08-03'; // dd-mm-yyyy
		String today;

		if (m < 10) {
			today = y + "-0" + m + "-" + "%";
		} else {
			today = y + "-" + m + "-%";
		}
		
		System.out.println("This Month USER count => " + today);

//		 int num = stmt.queryForObject(countQuery, Integer.class, new Object[] {today});
		return stmt.queryForObject(countUserQuery, Integer.class, new Object[] { today });
	}

	public Integer getExpenseCount() {
		String countExpenseQuery = "select count(*) from expense where date like ?";
		String today;

		if (m < 10) {
			today = y + "-0" + m + "-" + "%";
		} else {
			today = y + "-" + m + "-%";
		}
		
		
		System.out.println("Monthly Number Of Expense Transaction => " + today);

		return stmt.queryForObject(countExpenseQuery, Integer.class, new Object[] { today });

	}

	public Integer getAmmountOfExpennseDaily() {
		
//		getAmmountOfExpennseDaily asd = null;
		
		Integer dailyExpense;
		
		String sumDailyExpenseQuery = "select sum(ammount) from expense where date like ?";
		String today ="";

		if (m < 10) {
			today = y + "-0" + m +  "-" + d;
		} else {
			today = y + "-" + m + "-" + d;
		}
		
		
		System.out.println("This Expense Ammount => " + today);
		 dailyExpense = stmt.queryForObject(sumDailyExpenseQuery, Integer.class, new Object[] { today });

		if(dailyExpense == null) {
			dailyExpense =0;
		}
		
		return dailyExpense;
	}

	public Integer getAmmountOfExpenseMonthly() {
		String sumMonthlyExpenseQuery = "select sum(ammount) from expense where date like ?";
		String today;

		if (m < 10) {
			today = y + "-0" + m +  "-%";
		} else {
			today = y + "-" + m + "-%";
		}

		System.out.println("Today sum of expense => " + today);
		return stmt.queryForObject(sumMonthlyExpenseQuery, Integer.class, new Object[] { today });
	}

}
