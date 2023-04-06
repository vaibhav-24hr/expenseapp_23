package com.expenses.project.bean;

public class ChartExpenseBean {

	String month;
	Long expenseAmmount;
	Integer transaction;
	String PaymentType;
	
	
	
	public String getPaymentType() {
		return PaymentType;
	}
	public void setPaymentType(String paymentType) {
		PaymentType = paymentType;
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
