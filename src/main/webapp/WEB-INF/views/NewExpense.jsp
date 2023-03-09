<%@page import="com.expenses.project.bean.AccountBean"%>
<%@page import="com.expenses.project.bean.SubCategoryBean"%>
<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ExpenseApp | Add your Expenses</title>
</head>
<body>

	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	List<SubCategoryBean> sublist = (List<SubCategoryBean>) request.getAttribute("sublist");
	List<AccountBean> acclist = (List<AccountBean>) request.getAttribute("acclist");
	%>

	<h3>Add Your Expenses Below</h3>

	<form action="saveexpense" method="post">
	
		Title: <input type="text" name="title">
		<br><br>
	    
	    Vendor: 
	    <br><br>
	    
		Category: <select name="categoryId">
			<%
			for (CategoryBean cb : list) {
			%>

			<option value="<%=cb.getCategoryId()%>">
				<%=cb.getCategoryName()%></option>
			<%}%>
		</select>
		<br><br>
		
		
		SubCategory : <input type="text" name="subCategoryName">
		 <br><br>
		 
		Account: <select name="accountType">
			<%
			for (AccountBean acb : acclist) {
			%>

			<option value="<%=acb.getAccountTypeId()%>">
				<%=acb.getAccountType()%></option>

			<%}%>
			</select>
			<br><br>

		
		Status: 
		<br><br>
		
		Amount: 
		<br><br>
		
		Date: 
		<br><br>
		
		Description:
		<textarea rows="" cols=""></textarea>
		<br><br>
		
		<input type="submit">
	</form>

</body>
</html>