package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.ExpenseBean;
import com.expenses.project.bean.IncomeBean;

@Repository
public class IncomeDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void  addIncome(IncomeBean inb) {
		String insertQuery = "insert into income(title, date, userId, accountTypeId, description, statusId, ammount) values(?,?,?,?,?,?,?)";
		stmt.update(insertQuery, inb.getTitle(), inb.getDate(), inb.getUserId(), inb.getAccountTypeId(), inb.getDescription(), inb.getStatusId(), inb.getAmmount());
	
	}
	
	public List<IncomeBean> getAllIncome(Integer userId){
		String selectQuery = "select i.title, i.date, i.ammount, i.description, a.accountType, s.statusShow from income i, accountType a, status s where i.accountTypeId = a.accountTypeId and s.statusId = i.statusId and userId = ?";
		List<IncomeBean> inclist = stmt.query(selectQuery , new BeanPropertyRowMapper<IncomeBean>(IncomeBean.class), new Object[] {userId} );
		return inclist;
		
	}

	public IncomeBean getIncomeById(Integer incomeId) {
		IncomeBean inb = null;
		
		try {
			inb = stmt.queryForObject("select * from income where incomeId = ?", new BeanPropertyRowMapper<IncomeBean>(IncomeBean.class), new Object[] {incomeId} );
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("IncomeDao : getIncomeById();");
		}
		
		return inb;
	}
	
}
//Right :----->   select i.title, i.date, i.ammount, i.description, a.accountType, s.statusShow from income i, accountType a, status s where i.accountTypeId = a.accountTypeId and s.statusId = i.statusId and userId = ?
//wrong :----->   select i.title, i.ammount,i.date,i.description, a.accountType, s.statusShow from income i, accountType a, status s where i.accountTypeId=a.accountTypeId and s.statusId= i.statusId and userId = ?