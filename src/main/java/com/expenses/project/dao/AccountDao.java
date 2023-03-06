package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.AccountBean;

@Repository
public class AccountDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	//add
	public void addAccount(AccountBean acb) {
		
		String insertQuery = "insert into AccountType (accountType) value (?) ";
		stmt.update(insertQuery, acb.getAccountType());
		
	}
	
	// List
	public List<AccountBean> getAllAccount(){
		
		String selectQuery = "select * from AccountType";
		List<AccountBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<AccountBean>(AccountBean.class));
		return list;
	}
	
}
