package com.expenses.project.bean;

public class ChartExpenseBean {

	private String month;
	private Long expenseAmmount;
	private Integer transaction;
	private String PaymentType;
	private String Status;
	private String Transaction;
	private String income_month;
	private String incomeAmount;
	private String categoryName;
	
	
	
	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getIncome_month() {
		return income_month;
	}
	public void setIncome_month(String income_month) {
		this.income_month = income_month;
	}
	public String getIncomeAmount() {
		return incomeAmount;
	}
	public void setIncomeAmount(String incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	public String getPaymentType() {
		return PaymentType;
	}
	public void setPaymentType(String paymentType) {
		PaymentType = paymentType;
	}

	
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public void setTransaction(String transaction) {
		Transaction = transaction;
	}
	public Integer getTransaction() {
		return transaction;
	}
	public void setTransaction(Integer transaction) {
		this.transaction = transaction;
	}
	public Long getExpenseAmmount() {
		return expenseAmmount;
	}
	public void setExpenseAmmount(Long expenseAmmount) {
		this.expenseAmmount = expenseAmmount;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	
	
}
