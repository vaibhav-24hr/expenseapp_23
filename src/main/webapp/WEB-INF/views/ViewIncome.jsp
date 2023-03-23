<%@page import="com.expenses.project.bean.IncomeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expense App | View Income</title>
</head>
<body>

<% IncomeBean inb = (IncomeBean)request.getAttribute("inb"); %>

Income Id: <%=inb.getIncomeId() %><br>
Title : <%=inb.getTitle() %><br>
date : <%=inb.getDate() %><br>
userId : <%=inb.getUserId() %><br>
Account Id : <%=inb.getAccountTypeId() %><br>
Account : <%=inb.getAccountnType() %><br>
Description : <%=inb.getDescription() %><br>
Status Id : <%=inb.getStatusId() %><br>
Status : <%=inb.getStatusShow() %><br>
Ammount : <%=inb.getAmmount() %>


</body>
</html>