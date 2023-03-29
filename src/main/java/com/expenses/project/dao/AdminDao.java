package com.expenses.project.dao;

import java.time.LocalDate;
import java.util.Calendar;

//import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	// old Calander Class to get YY-MM-DD
//	Calendar c = Calendar.getInstance();
//	int d = c.get(Calendar.DATE);
//	int m = c.get(Calendar.MONTH) + 1;
//	int y = c.get(Calendar.YEAR);

	// updated CLASS to get YY-MM-DD
	// Current Date
    LocalDate today = LocalDate.now();
		int d = today.getDayOfMonth();
		int m = today.getMonthValue();
		int y = today.getYear();
    		
		// Previous Date
	LocalDate previousDay = LocalDate.now().minusDays(1);
		int pd = previousDay.getDayOfMonth();

		// Previous Month
		LocalDate previousMonth = LocalDate.now().minusMonths(1);
		int pm = previousMonth.getMonthValue();
		
		// Daily Dynamic Date Condition
		String currentDay = String.format("%d-%02d-%02d%%", y, m, d);
		// Monthly Dynamic Date Condition
		String currentMonth = String.format("%d-%02d-%%", y,m,d); 
		// previous Day Dynamic Date Condition
		String lastDay = String.format("%d-%02d-%02d%%", y, m, pd);
		// previous Month Dynamic Date Condition
		String lastMonth = String.format("%d-%02d-%%", y,pm,pd);
		
	@Autowired
	JdbcTemplate stmt;

	public Integer getUsersCount() {
		String countUserQuery = "select count(*) from users where joindate like ?";
		// select count(*) from users where joindate = '2023-08-03'; // dd-mm-yyyy

		// Old wild card operater Syntax for DD-MM-YY in Calander CLASS
//		String today;
//		if (m < 10) {
//			today = y + "-0" + m + "-%";
//		} else {
//			today = y + "-" + m + "-%";
//		}

		
		// New wild card operater Syntax for DD-MM-YY in LocalDate CLASS
		// Dont need to specify bcz aleready specify above for d & M		
//  String currentMonth = String.format("%d-%02d-%%", y, m, d);
		
		// Updated Code with same usage but less line of code
		
		System.out.println("This Month USER count => " + currentMonth);
//		 int num = stmt.queryForObject(countQuery, Integer.class, new Object[] {today});
		return stmt.queryForObject(countUserQuery, Integer.class, new Object[] { currentMonth });
	}

	public Integer getExpenseCount() {
		String countExpenseQuery = "select count(*) from expense where date like ?";
		System.out.println("Monthly Number Of Expense Transaction => " + currentMonth);
		return stmt.queryForObject(countExpenseQuery, Integer.class, new Object[] { currentMonth });
	}

	public Integer getAmmountOfExpennseDaily() {
		
//		getAmmountOfExpennseDaily asd = null;
		Integer dailyExpense;
		String sumDailyExpenseQuery = "select sum(ammount) from expense where date like ?";
		System.out.println("This Expense Ammount => " + currentDay);
		 dailyExpense = stmt.queryForObject(sumDailyExpenseQuery, Integer.class, new Object[] { currentDay });

		 // Authentication if code doesn't work
		if(dailyExpense == null) {
			dailyExpense =0;
		}
		
		return dailyExpense;
	}

	public Integer getAmmountOfExpenseMonthly() {
		String sumMonthlyExpenseQuery = "select sum(ammount) from expense where date like ?";
		System.out.println("Today sum of expense => " + currentMonth);
		Integer monthlyExpense = stmt.queryForObject(sumMonthlyExpenseQuery, Integer.class, new Object[] { currentMonth });
		
		if (monthlyExpense == null) {
			monthlyExpense = 0;
		}
		
		
		System.out.println(lastDay);
		System.out.println(lastMonth);
		
		
		return monthlyExpense;
	
		

		
		
	}
	
//	public Double getExpenseRatioForPeviousDay() {
//	     query for the sum of expenses for the previous day
		
//		String sumMonthlyExpenseQuery = "select sum(ammount) from expense where date like ?";
//		String sumPreviousDayExpenseQuery = 

		


//		System.out.println("Today sum of expense => " + today);
//		Integer
		
 
		
		
		
//	}

}
