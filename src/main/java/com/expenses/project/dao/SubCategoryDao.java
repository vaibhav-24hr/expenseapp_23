package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.CategoryBean;
import com.expenses.project.bean.SubCategoryBean;

@Repository
public class SubCategoryDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void addSubCategory(SubCategoryBean scb) {
		String insertQuery = "insert into subcategory (subCategoryName , categoryId , deleted) values (?,?,?)";
		
		stmt.update(insertQuery,scb.getSubCategoryName(),scb.getCategoryId(),false);	 // insert, update, delete
	}
	
	public List<SubCategoryBean> getAllSubCategory(){
		String selectQuery = "select * from subcategory where deleted = false";
		List<SubCategoryBean> sublist = stmt.query(selectQuery, new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
		return sublist;
	}
	
	public void deleteSubcategory(Integer subCategoryId) {
		String updateQuery = "update subcategory set deleted = true where subCategoryId = ?";
		stmt.update(updateQuery, subCategoryId);
	}
	
}
 