<%@page import="com.expenses.project.bean.AccountBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expenseApp | List of Account</title>
</head>
<body>
	
	<h3> Account List </h3>

	<%
		List<AccountBean> list = (List<AccountBean>)request.getAttribute("list");
	%>
	
	<table border = 1>
		
		<tr>
			<th> AccountId </th>
			<th> AccountType </th>
		</tr>
		
		<%for(AccountBean ab : list){ %>
		
		<tr>
			<td> <%= ab.getAccountTypeId() %> </td>
			<td> <%= ab.getAccountType() %> </td>
		</tr>
			
			<% } %>
			
	</table>
<br><br>	
	<a href="New Account"> Add Account </a>

</body>
</html>