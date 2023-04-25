package com.expenses.project.dao;

import java.time.LocalDate;
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

//	Calendar c = Calendar.getInstance();
//	int d = c.get(Calendar.DATE);
//	int m = c.get(Calendar.MONTH)+1;
//	int y = c.get(Calendar.YEAR);

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
	String currentMonth = String.format("%d-%02d-%%", y, m, d);
	// previous Day Dynamic Date Condition
	String lastDay = String.format("%d-%02d-%02d%%", y, m, pd);
	// previous Month Dynamic Date Condition
	String lastMonth = String.format("%d-%02d-%%", y, pm, pd);

	@Autowired
	JdbcTemplate stmt;

	public Integer getMonthlyTransaction(Integer userId) {
		String monthlyTransaction = "select count(*) from expense where userId = ? and date like ?";
		System.out.println("Monthly Numbers Transaction => " + currentMonth);
		return stmt.queryForObject(monthlyTransaction, Integer.class, new Object[] { userId, currentMonth });
	}

	public Integer getUserAmmountOfExpenseMonthly(Integer userId) {
		String sumMonthlyExpenseQuery = "select sum(ammount) from expense where userId = ? and date like ?";
//		Integer userId = usb.getUserId();
		System.out.println("Monthly Expense Ammount => " + currentMonth);
		return stmt.queryForObject(sumMonthlyExpenseQuery, Integer.class, new Object[] { userId, currentMonth });
	}

	public Integer getAmmountOfIncomeMonthly(Integer userId) {
		String sumMonthlyIncomeQuery = "select sum(ammount) from income where userId = ? and date like ?";
		System.out.println("Monthly Income => " + currentMonth);
		return stmt.queryForObject(sumMonthlyIncomeQuery, Integer.class, new Object[] { userId, currentMonth });
	}

	public Integer getAmountOfExpenseDaily(Integer userId) {
		String todayExpenseQuery = "select sum(ammount) from expense where userId = ? and date like ?";
		System.out.println("Daily Expense => " + currentDay);
		return stmt.queryForObject(todayExpenseQuery, Integer.class, new Object[] { userId, currentDay });
	}
	
	// Difference Of Data
	
	
	public Integer getExpenseRatioForPeviousDayUser(Integer userId) {
		//Query
				String sumExpenseQuery = "select sum(ammount) from expense where date like ? and userId = ?";
				
				//  the sum of expenses for the  today
				Integer cuurentDayExpense = stmt.queryForObject(sumExpenseQuery, Integer.class, new Object[] { currentDay,userId });
					if(cuurentDayExpense == null) {
						cuurentDayExpense = 0;
					}
				System.out.println("Today Expense =>" + cuurentDayExpense);
			    //  the sum of expenses for the previous day
				Integer previousDayExpense = stmt.queryForObject(sumExpenseQuery, Integer.class, new Object[] { lastDay,userId });
					if(previousDayExpense == null) {
						previousDayExpense = 0;
					}
				System.out.println("YesterDay Expense =>" + previousDayExpense);
				// calculate the ratio between the previous day's expenses and the current day's expenses
//				if(cuurentDayExpense == null || previousDayExpense == null ) {
//					return null;
//				}else {
				Integer ratio = cuurentDayExpense - previousDayExpense; // (cuurentDayExpense - previousDayExpense) / 250000 * 100% ;
					System.out.println( " Expense Daily Ratio  =>" +  ratio);
					return ratio;
//				}
			}
	
	public Integer getExpenseRatioForPeviousMonthUser(Integer userId) {
		String sumExpenseQuery = "select sum(ammount) from expense where date like ? and userId = ?";
		
		//  the sum of expenses for the  today
		Integer cuurentMonthExpense = stmt.queryForObject(sumExpenseQuery, Integer.class, new Object[] { currentMonth,userId });
		System.out.println("This Month Expense =>" + cuurentMonthExpense);
	    //  the sum of expenses for the previous day
		Integer previousMonthExpense = stmt.queryForObject(sumExpenseQuery, Integer.class, new Object[] { lastMonth,userId });
		System.out.println("Last Month Expense =>" + previousMonthExpense);
		// calculate the ratio between the previous day's expenses and the current day's expenses
		if(cuurentMonthExpense == null || previousMonthExpense == null ) {
			return null;
		}else {
			Integer ratio = cuurentMonthExpense - previousMonthExpense;
			System.out.println( " Expense Month Ratio  =>" +  ratio);
			return ratio;
		}
	}
	
	
	public Integer getRatioOfTransactionForUser(Integer userId) {
		String countTransactionQuery = "select count(*) from expense where date like ? and userId = ?";
		//  the sum of expenses for the  today
		Integer cuurentMonthTransaction = stmt.queryForObject(countTransactionQuery, Integer.class, new Object[] { currentMonth,userId });
	    //  the sum of expenses for the previous day
		Integer previousMonthTransaction = stmt.queryForObject(countTransactionQuery, Integer.class, new Object[] { lastMonth,userId });
		// calculate the ratio between the previous day's expenses and the current day's expenses
		if(cuurentMonthTransaction == null || previousMonthTransaction == null) {
			return 0;
		}else {
			Integer ratio = cuurentMonthTransaction - previousMonthTransaction;
			System.out.println( " Transaction Ratio  =>" +  ratio);
			return ratio;
		}
	}
	
	public Integer getRatioAmmountOfIncomeMonthly(Integer userId) {
		String sumMonthlyIncomeQuery = "select sum(ammount) from income where userId = ? and date like ?";
		Integer currentMonthIncome = stmt.queryForObject(sumMonthlyIncomeQuery, Integer.class, new Object[] {userId, currentMonth});
		Integer lastMonthIncome = stmt.queryForObject(sumMonthlyIncomeQuery,  Integer.class, new Object[] {userId, lastMonth});
		System.out.println("Monthly Income => " + currentMonthIncome + " & " + lastMonthIncome);
		
		if(lastMonthIncome == null || currentMonthIncome == null) {
			return 0;
		}else {
		Integer ratio = currentMonthIncome - lastMonthIncome;
		return ratio;
	}
	}
	
	public List<ExpenseBean> getUserLastExpense(Integer useId) {
		String selectQuery = "SELECT e.title, e.ammount, e.date, s.statusShow from expense e LEFT JOIN status s ON e.statusId = s.statusId WHERE userId = ? GROUP BY e.title, e.ammount, e.date, s.statusShow ORDER BY e.date DESC";
		List<ExpenseBean> userExpenselist = stmt.query(selectQuery, new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {useId});
		return userExpenselist;
	}
	
	
	

	public List<ChartExpenseBean> getExpenseStats(Integer userId) {
//	select MONTH(date) as month ,sum(ammount) as expenseAmmount from expense group by month(date) order by MONTH(date)
		String selectQuery = "select monthname(date) as month , sum(ammount) as expenseAmmount from expense where year(date) = ? and userId = ? group by monthname(date),month(date)  order by month(date)  ";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class), y, userId);
	}

	public List<ChartExpenseBean> getStatusOfTransactionStats(Integer userId) {
		String selectQuery = "select s.statusShow AS Status, COUNT(e.statusId) AS Transaction from status s LEFT JOIN Expense e ON s.statusId = e.statusId WHERE userId = ? GROUP BY s.statusId";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class), userId);
	}
	
	public List<ChartExpenseBean> getIncomeStats(Integer userId){
		String selectQuery = "select monthname(date) as income_month, sum(ammount) as incomeAmount from income where year(date) = ? and userId = ? group by monthname(date) , month(date) order by month(date)";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),y,userId);
	}
	
	public List<ChartExpenseBean> getCategoryStats(Integer userId) {
		String selectQuery = "SELECT c.categoryName, COUNT(*) AS Transaction FROM category c  JOIN expense e ON e.categoryId = c.categoryId where userId = ? GROUP BY c.categoryName ORDER BY c.categoryName";
		return stmt.query(selectQuery, new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),userId);
	}
	
	public List<ChartExpenseBean> getVendorStats(Integer userId){
		String selectQuery = " select v.vendorName as vendor , count(*) as Transaction FROM expense e RIGHT JOIN vendor v ON e.vendorId = v.vendorId where userId = ? GROUP BY v.vendorName";
		return stmt.query(selectQuery,new BeanPropertyRowMapper<ChartExpenseBean>(ChartExpenseBean.class),userId);
	}

}
