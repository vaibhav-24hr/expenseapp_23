<%@page import="com.expenses.project.bean.VendorBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expenseapp | List Vendor</title>
</head>
<body>
	<h3>Vendor List</h3>
	
	<%
		List<VendorBean> list = (List<VendorBean>)request.getAttribute("list");
	%>
	
	<table border = 1 >
		
		<tr>
			<th>VendorId</th>
			<th>VendorName</th>
			<th>Deleted</th>
			<th>Action</th>		
		</tr>
		
		<% for (VendorBean cb : list){ %>
		
		<tr>
			<td><%=cb.getVendorId() %></td>
			<td><%=cb.getVendorName() %></td>
			<td><%=cb.getDeleted() %></td>
			<td><a href = "deletevendor/<%= cb.getVendorId()%>"> Delete </a> </td>
		</tr>
		
		<%} %>
		
	</table>
	
	
</body>
</html>