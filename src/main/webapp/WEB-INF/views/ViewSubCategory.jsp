<%@page import="com.expenses.project.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3> Details of SubCategory </h3>
	
	<%
		SubCategoryBean scb = (SubCategoryBean)request.getAttribute("scb");
	%>
	
	CategoryId:  <%=scb.getCategoryId() %> <br>
	CategoryName: <%=scb.getCategoryName() %> <br>
	SubCategoryId: <%=scb.getSubCategoryId()  %><br>
	SubCategoryName: <%=scb.getSubCategoryName() %><br>
	Deleted: <%=scb.getDeleted() %> <br>
	
</body>
</html>