<%@page import="com.expenses.project.bean.IncomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h3>All Income</h3>


<%
	List<IncomeBean> inclist = (List<IncomeBean>)request.getAttribute("inclist");
%>

<table border="1">

	<tr>
		<th>IncomeId</th>
		<th>Title</th>
		<th>AccountTypeId</th>
		<th>StatusId</th>
		<th>UserId</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Description</th>
		
	</tr>

<% for(IncomeBean ib : inclist){ %>
	<tr>
		<td><%=ib.getIncomeId() %></td>
		<td><%=ib.getTitle() %></td>
		<td><%=ib.getAccountTypeId() %></td>
		<td><%=ib.getStatusId() %></td>
		<td><%=ib.getUserId() %></td>
		<td><%=ib.getAmmount() %></td>
		<td><%=ib.getDate() %></td>
		<td><%=ib.getDescription() %></td>
	</tr>
	
	<%} %>
	
</table>
<br><br>

<a href = "newincome">Add new source of income</a>

</body>
</html>