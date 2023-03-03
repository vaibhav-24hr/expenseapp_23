<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> expenseManager | New Status </title>
</head>
<body>
	
	<form method ="post" action="savestatus"> <!-- Action means after clicking submit button the next page URL_name where we can redirect --> 
	
		Status: <input type="text" name = "statusShow" > <!-- in name = "BEAN_FILE_Variable_Name" -->
		<br><br>
		<input type="submit" value="Save Status" > 
	
	</form><br>
	<a href = "liststatus">Show all your Status</a>

</body>
</html>