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
		// String selectQuery = "select * from subcategory where deleted = false";
		
		String joinQuery = "select c.categoryName , c.categoryId , s.subcategoryId , s.subcategoryname , s.deleted from category c , subcategory s where\r\n"
				+ " c.categoryId = s.categoryID and s.deleted = false;"; 
		
		List<SubCategoryBean> sublist = stmt.query(joinQuery, new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
		return sublist;
	}
	
	public void deleteSubcategory(Integer subCategoryId) {
		String updateQuery = "update subcategory set deleted = true where subCategoryId = ?";
		stmt.update(updateQuery, subCategoryId);
	}
	
	public SubCategoryBean getSubCategoryById(Integer subCategoryId) {
		SubCategoryBean scb = null;
		
		try {
			String viewQuery = "select * from category , subcategory where subcategory.subCategoryId = ? and subcategory.subCategoryId = category.categoryId and subcategory.deleted = false ";
			scb = stmt.queryForObject( viewQuery , new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class), new Object[] {subCategoryId});
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("SubCategoryDao :: getSubCategoryById");
			System.out.println(e.getMessage());
		}
		
		return scb;
	}
	
}
	

 