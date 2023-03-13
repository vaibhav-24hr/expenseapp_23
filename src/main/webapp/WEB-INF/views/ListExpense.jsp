<%@page import="com.expenses.project.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ExpenseApp | List Expense</title>
</head>
<body>

<%
	List<ExpenseBean> explist = (List<ExpenseBean>)request.getAttribute("explist");
%>

<h2> All Your Expenses </h2>

<table border="1" >

	<tr>
		<th>ExpenseId</th>
		<th>Title</th>
		<th>CategoryId</th>
		<th>SubCategoryId</th>
		<th>VendorId</th>
		<th>AccountTypeId</th>
		<th>StatusId</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Description</th>
		<th>UserId</th>
	</tr>
	
	<%for(ExpenseBean exb : explist ){ %>
	
	<tr>
		<td> <%=exb.getExpenseId()%> </td>
		<td> <%=exb.getTitle() %> </td>
		<td> <%=exb.getCategoryId()%> </td>
		<td> <%=exb.getSubCategoryId()%> </td>
		<td> <%=exb.getVendorId()%> </td>
		<td> <%=exb.getAccountTypeId() %> </td>
		<td> <%=exb.getStatusId() %> </td>
		<td> <%=exb.getAmmount() %> </td>
		<td> <%=exb.getDate() %> </td>
		<td> <%=exb.getDescription() %> </td>
		<td> <%=exb.getUserId() %> </td>
	</tr>

<%} %>

</table>
<br><br>

<a href="newexpense">AddNewExpense</a> 

</body>
</html>