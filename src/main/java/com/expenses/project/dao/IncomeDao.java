package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
		String selectQuery = "select * from income where userId = ?";
		List<IncomeBean> inclist = stmt.query(selectQuery , new BeanPropertyRowMapper<IncomeBean>(IncomeBean.class), new Object[] {userId} );
		return inclist;
		
	}
	
}
