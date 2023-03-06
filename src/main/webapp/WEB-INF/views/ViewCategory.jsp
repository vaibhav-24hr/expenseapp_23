<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>View List of Category</h3>

	<%
		CategoryBean cb  = (CategoryBean)request.getAttribute("cb");
	%>
	
	CategoryId : <%=cb.getCategoryId() %><br>
	CategoryName : <%=cb.getCategoryName() %><br>
	Deleted : <%=cb.getDeleted() %> <br>


</body>
</html>