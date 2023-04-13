package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.CategoryBean;

@Repository
public class CategoryDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	public void addCategory(CategoryBean cgb) {
		String insertQuery = "insert into category (categoryName , deleted) values (?,?)";
		
		stmt.update(insertQuery,cgb.getCategoryName(),false);	 // insert, update, delete
		
	}
	
	public List<CategoryBean> getAllCategory(){
		
		//		String selectQuery = "select * from category where deleted = false";
		String selectQuery = "select * from category";
		List<CategoryBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
		return list;
	}
	
//	public void deleteCategory(Integer categoryId) {
//		
//		String updateQuery = "update category set deleted = true where categoryId = ?";
//		stmt.update(updateQuery,categoryId);
//		
//	}
	
	public void deactiveCategory(Integer categoryId, boolean currentStatus) {
		currentStatus = !currentStatus;
		String updateCategory = "update category set deleted = ? where categoryId = ?";
		 stmt.update(updateCategory,currentStatus,categoryId);
	}
	
	
	// use for Operation like view,delete  and Edit to specific categoryId 
	public CategoryBean getCategoryById(Integer categoryId) {
		CategoryBean cb = null;
		
		try {
			cb = stmt.queryForObject("select * from category where categoryId = ?", new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), new Object[] {categoryId});
			
		}catch(Exception e){
			System.out.println("CategoryDao :: getCategoryById()");
			System.out.println(e.getMessage());
			
		}
		return cb;
	}
	
	public void updateCategory(CategoryBean cgb) {
		String updateQuery = "update category set categoryName = ? where categoryId = ?";
		stmt.update(updateQuery, cgb.getCategoryName() , cgb.getCategoryId());
	}
	
}
