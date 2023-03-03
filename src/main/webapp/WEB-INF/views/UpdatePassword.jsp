<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>
	
	<form action="updatemypassword" method="post">
	 
		Email :<input type="email" name="email"><br><br>
		Password : <input type="password" name="password"><br><br>
		Confirm Password : <input type="password" name="confirmPassword"><br><br>
		OTP : <input type="text" name="otp"/>
		<br><br>
		
		<input type="submit" value="Update Password"/>
	</form><br><br>

</body>
</html>