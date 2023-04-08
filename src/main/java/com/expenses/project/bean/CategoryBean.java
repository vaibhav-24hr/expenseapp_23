package com.expenses.project.bean;


public class CategoryBean {
	
	private Integer categoryId;
	private String categoryName;
	private Boolean deleted;
	
	
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer groupId) {
		this.categoryId = groupId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	
	

}
