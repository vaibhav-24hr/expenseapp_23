<%@page import="com.expenses.project.bean.SubCategoryBean"%>
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

<% 
	List<SubCategoryBean> list = (List<SubCategoryBean>)request.getAttribute("list");
%>
<table border = "1">

	<tr>
		<th>SubCategoryId</th>
		<th>SubCategoryName</th>
		<th>GroupId</th>
		<th>Deleted?</th>
		<th>Category Name</th>
		<th>Action</th>
		
	</tr>

	<% for(int i=0; i<list.size(); i++){ %>  <!-- we can also use for each loop:  for(CategoryBean cb:list) -->
	<tr>
		<td><%= list.get(i).getSubCategoryId() %></td>
		<td><%=list.get(i).getSubCategoryName() %></td>
		<td><%=list.get(i).getCategoryId() %></td>
		<td><%= list.get(i).getCategoryName() %></td>
		<td><%=list.get(i).getDeleted() %></td>
		<td><a href = "/deletesubcategory/ <%=list.get(i).getSubCategoryId() %>">Delete</a>
		<a href = "viewsubcategory/ <%=list.get(i).getSubCategoryId() %>">View</a>
		</td>
	</tr>   
<%}%>

</body>
</html>