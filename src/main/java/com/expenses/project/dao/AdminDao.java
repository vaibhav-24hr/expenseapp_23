package com.expenses.project.dao;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

//import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.ChartExpenseBean;
import com.expenses.project.bean.ProfileBean;
import com.expenses.project.bean.UserBean;

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
	
	
	public Double getExpenseRatioForPeviousDay() {
//Query
		String sumExpenseQuery = "select sum(ammount) from expense where date like ?";
		
		//  the sum of expenses for the  today
		Double cuurentDayExpense = stmt.queryForObject(sumExpenseQuery, Double.class, new Object[] { currentDay });
			if(cuurentDayExpense == null) {
				cuurentDayExpense = 0.0;
			}
		System.out.println("Today Expense =>" + cuurentDayExpense);
	    //  the sum of expenses for the previous day
		Double previousDayExpense = stmt.queryForObject(sumExpenseQuery, Double.class, new Object[] { lastDay });
			if(previousDayExpense == null) {
				previousDayExpense = 0.0;
			}
		System.out.println("YesterDay Expense =>" + previousDayExpense);
		// calculate the ratio between the previous day's expenses and the current day's expenses
//		if(cuurentDayExpense == null || previousDayExpense == null ) {
//			return null;
//		}else {
			Double ratio = cuurentDayExpense - previousDayExpense; // (cuurentDayExpense - previousDayExpense) / 250000 * 100% ;
			System.out.println( " Expense Daily Ratio  =>" +  ratio);
			return Double.parseDouble(String.format("%.2f", ratio));
//		}
	}
	
	
	public Double getExpenseRatioForPeviousMonth() {
		String sumExpenseQuery = "select sum(ammount) from expense where date like ?";
		
		//  the sum of expenses for the  today
		Double cuurentMonthExpense = stmt.queryForObject(sumExpenseQuery, Double.class, new Object[] { currentMonth });
		System.out.println("This Month Expense =>" + cuurentMonthExpense);
	    //  the sum of expenses for the previous day
		Double previousMonthExpense = stmt.queryForObject(sumExpenseQuery, Double.class, new Object[] { lastMonth });
		System.out.println("Last Month Expense =>" + previousMonthExpense);
		// calculate the ratio between the previous day's expenses and the current day's expenses
		if(cuurentMonthExpense == null || previousMonthExpense == null ) {
			return null;
		}else {
			Double ratio = cuurentMonthExpense - previousMonthExpense;
			System.out.println( " Expense Month Ratio  =>" +  ratio);
			return Double.parseDouble(String.format("%.4f", ratio));
			
		}

	}
	
	
	public Integer getUserRatioMonthly() {
		String countUserQuery = "select count(*) from users where joindate like ?";
		
		//  the sum of expenses for the  today
		Integer cuurentMonthUser = stmt.queryForObject(countUserQuery, Integer.class, new Object[] { currentMonth });
		
	    //  the sum of expenses for the previous day
		Integer previousMonthUser = stmt.queryForObject(countUserQuery, Integer.class, new Object[] { lastMonth });
		
		// calculate the ratio between the previous day's expenses and the current day's expenses
		if(cuurentMonthUser == null || previousMonthUser == null) {
			return 0;
		}else {
			Integer ratio = cuurentMonthUser - previousMonthUser;
			System.out.println( " User Ratio  =>" +  ratio);
			return ratio;
		}
	}
	
	public Integer getRatioOfTransaction() {
		String countTransactionQuery = "select count(*) from expense where date like ?";
		//  the sum of expenses for the  today
		Integer cuurentMonthTransaction = stmt.queryForObject(countTransactionQuery, Integer.class, new Object[] { currentMonth });
	    //  the sum of expenses for the previous day
		Integer previousMonthTransaction = stmt.queryForObject(countTransactionQuery, Integer.class, new Object[] { lastMonth });
		// calculate the ratio between the previous day's expenses and the current day's expenses
		if(cuurentMonthTransaction == null || previousMonthTransaction == null) {
			return 0;
		}else {
			Integer ratio = cuurentMonthTransaction - previousMonthTransaction;
			System.out.println( " Transaction Ratio  =>" +  ratio);
			return ratio;
		}
	}
	
	// To display Chart
	public List<ChartExpenseBean> getExpenseStats(){
//		select MONTH(date) as month ,sum(ammount) as expenseAmmount from expense group by month(date) order by MONTH(date)
		String selectQuery = "select monthname(date) as month , sum(ammount) as expenseAmmount from expense where year(date) = ? group by monthname(date),month(date)  order by month(date)  ";
		return 	stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),y);
	}
	
	public List<ChartExpenseBean> getTransactionStats(){
		String selectQuery = "select monthname(date) as month , count(*) as transaction from expense where year(date) = ? group by monthname(date), month(date) order by month(date)";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),y);
	}
	
	public List<ChartExpenseBean> getTransactionTypeStats(){
		String selectQuery = "SELECT a.accountType AS PaymentType, COUNT(e.accountTypeId) AS transaction  FROM accountType a LEFT JOIN expense e ON a.accountTypeId = e.accountTypeId group by a.accountTypeId";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class));
	}
	
	
	// For Users Profile Picture
	
	public void updateImageUrl(ProfileBean pBean) {
		stmt.update("update users set imageUrl = ? where userId = ?", pBean.getImageUrl(), pBean.getUserId());
	}
	
	public void updateUser(UserBean usBean) {
		stmt.update("update users set firstName = ?, lastName = ? , email = ?,dob = ?, contactNum = ? where userId = ? ",usBean.getFirstName(), usBean.getLastName(), usBean.getEmail(),usBean.getDob(),usBean.getContactNum(),usBean.getUserId());
	
	}
	
}
