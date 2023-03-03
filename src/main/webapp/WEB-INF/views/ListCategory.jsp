<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expenseManager | ListCategories</title>
</head>
<body>
<h3>List Category</h3>

<%
    List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
%>

<table border = "1">

	<tr>
		<th>groupId</th>
		<th>CategoryName</th>
		<th>Deleted?</th>
		<th>Action</th>
	</tr>


<% for(int i=0; i<list.size(); i++){ %>  <!-- we can also use for each loop:  for(CategoryBean cb:list) -->
	<tr>
		<td> <%= list.get(i).getCategoryId() %></td>
		<td><%=list.get(i).getCategoryName() %></td>
		<td><%=list.get(i).getDeleted() %></td>
		<td> <a href = "deletecategory/<%=list.get(i).getCategoryId() %>">Delete</a></td>
	</tr>
<%}%>

</table>

</body>
</html>