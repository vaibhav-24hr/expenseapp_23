package com.expenses.project.bean;

import java.security.KeyStore.PrivateKeyEntry;

import org.springframework.web.multipart.MultipartFile;

public class ExpenseBean {

	private Integer expenseId;
	private String title;
	private Integer categoryId;
	private Integer subCategoryId;
	private Integer vendorId;
	private Integer accountTypeId;
	private Integer statusId;
	private String date;
	private String description;
	private Integer userId;
//	private String expenseName;
	private String categoryName;
	private String vendorName;
	private String subCategoryName;
	private String accountType;
	private String ammount;
	private String statusShow;
	private String firstName;
	private String lastName;
	private String email;
	
	
	private MultipartFile billImg; // used to Store Bill Image
	private String billURL;       // Bill Url in DataBase
	
	
	
	
	public MultipartFile getBillImg() {
		return billImg;
	}
	public void setBillImg(MultipartFile billImg) {
		this.billImg = billImg;
	}
	public String getBillURL() {
		return billURL;
	}
	public void setBillURL(String billURL) {
		this.billURL = billURL;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatusShow() {
		return statusShow;
	}
	public void setStatusShow(String statusShow) {
		this.statusShow = statusShow;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public Integer getExpenseId() {
		return expenseId;
	}
	public void setExpenseId(Integer expenseId) {
		this.expenseId = expenseId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(Integer subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public Integer getVendorId() {
		return vendorId;
	}
	public void setVendorId(Integer vendorId) {
		this.vendorId = vendorId;
	}
	public Integer getAccountTypeId() {
		return accountTypeId;
	}
	public void setAccountTypeId(Integer accountTypeId) {
		this.accountTypeId = accountTypeId;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAmmount() {
		return ammount;
	}
	public void setAmmount(String ammount) {
		this.ammount = ammount;
	}
	
	
}
