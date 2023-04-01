package com.expenses.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.expenses.project.bean.CategoryBean;
import com.expenses.project.bean.SubCategoryBean;
import com.expenses.project.bean.VendorBean;

@Repository
public class VendorDao {

	@Autowired
	JdbcTemplate stmt;
	
	//add
	
	public void addVendor(VendorBean vb) {
		String insertQuery = "insert into vendor (vendorName, deleted) value (?,?)";
		
		stmt.update(insertQuery , vb.getVendorName(), false);
	}
	
	//Return List
	
	public List<VendorBean> getAllVendor(){
		
		String selectQuery = "select * from vendor where deleted = false";
		
		List<VendorBean> list = stmt.query(selectQuery, new BeanPropertyRowMapper<VendorBean>(VendorBean.class)); 
		return list;
	}
	
	//Delete
	
	public void deleteVendor(Integer vendorId) {
		String updateQuery = "update vendor set deleted = true where vendorId = ?";
		stmt.update(updateQuery,vendorId);
	}
	
	public VendorBean getVendorById(Integer vendorId) {
		VendorBean vBean = null;
		
		try {
			vBean = stmt.queryForObject("select * from vendor where vendorId = ? ", new BeanPropertyRowMapper<VendorBean>(VendorBean.class), new Object[] {vendorId});
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("VendorDao :: getVendorById()");
			System.out.println(e.getMessage());
		}
		return vBean;
	}
	
	public void updatevendor(VendorBean vBean) {
		String updateQuery = "update vendor set vendorName = ? where vendorId = ?";
		stmt.update(updateQuery, vBean.getVendorName() , vBean.getVendorId());
	}
}
