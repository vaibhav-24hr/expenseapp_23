<%@page import="com.expenses.project.bean.ExpenseBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | Expensees View</title>
</head>
<body>

<h2>Expense Detail</h2>

<% ExpenseBean exb = (ExpenseBean)request.getAttribute("exb"); %>

	Date: <%=exb.getDate() %><br>
	 expenseId: <%=exb.getExpenseId() %><br>
	 title: 	<%=exb.getTitle() %><br>
	 Vendor Id:  <%=exb.getVendorId() %><br>
	 Vendor Name:  <%=exb.getVendorName() %><br>
	Category Id:  <%=exb.getCategoryId() %> <br>
	Category Name: <%=exb.getCategoryName() %> <br>
	SubCategory Id: <%=exb.getSubCategoryId()  %><br>
	SubCategory Name: <%=exb.getSubCategoryName() %><br>
	Ammount: <%=exb.getAmmount() %><br>
	AccountTypeId: <%=exb.getAccountTypeId() %><br>
	Account Type: <%=exb.getAccountType() %><br>
	StatusID: <%=exb.getStatusId() %><br>
	Status: <%=exb.getStatusShow() %><br>
	Description : <%=exb.getDescription() %><br>
	USerId : <%=exb.getUserId() %><br>
	

</body>
</html>