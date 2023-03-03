package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.StatusBean;

@Repository
public class StatusDao {
	
	@Autowired
	JdbcTemplate stmt;

	// add
	public void addStatus(StatusBean stb) {
		String insertQuery = "insert into status (statusShow, deleted)  value (?,?) ";
		stmt.update(insertQuery,stb.getStatusShow(),false); //(query_Name,? <=> beanObj.getTABLE_ROW_NAme)
	}
	
	
	// list
	// ReturnType
	
	public List<StatusBean> getAllStatus(){
		
		String selectQuery = "select * from status where deleted = false";
		List<StatusBean> statuslist = stmt.query(selectQuery, new BeanPropertyRowMapper<StatusBean>(StatusBean.class));
	
		return statuslist;
	}
	
	
	// update 
	
	
	
	// delete
	public void deleteStatus(Integer statusId) {
		String updateQuery = "update status set deleted = true where statusId = ?";
		stmt.update(updateQuery,statusId);
	}
	
	
	
}
