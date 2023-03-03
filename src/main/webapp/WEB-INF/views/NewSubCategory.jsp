<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expenseApp | New Sub Categpory</title>
</head>
<body>

<% 
	List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
%>

 <form action = "savesubcategory" method = "post">
 	SubCategory : <input type="text" name="subCategoryName">
 	<br><br>
 	category <select name="categoryId">
 	<%
 		for(CategoryBean cb : list){
 	%>
 	
 	<option value = "<%= cb.getCategoryId() %>">
 		<%=	cb.getCategoryName()%></option>
 		<%
				}
			%>
			
			</select><br><br>
 	
 	
 	
		 <input type="submit" value="Add Sub Category"/>
		  </form>
		  <a href="listsubcategories">List Sub Category</a> 
 	

 
</body>
</html>