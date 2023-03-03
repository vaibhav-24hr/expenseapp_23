<%@page import="java.util.List"%>
<%@page import="com.expenses.project.bean.StatusBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expenseManager | List Status</title>
</head>
<body>
	<h3>List Status</h3>
	
	<%
		List<StatusBean> statuslist = (List<StatusBean>)request.getAttribute("statuslist");
	%>
	
	<table border="1">
	
	<tr>
	<th>StatusId</th>
	<th>StatusShow</th>
	<th> Action </th>
	</tr>
	
	<% for(StatusBean cb : statuslist ){ %>
	<tr>
	
	<td><%=cb.getStatusId() %></td>
	<td><%=cb.getStatusShow() %></td>
	<td> <a href = "deletestatus/<%=cb.getStatusId() %>"> Delete </a> </td>
	
	</tr>
	
	<%} %>
	
	
	</table>
	 
</body>
</html>