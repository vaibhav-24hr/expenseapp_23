<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expenseManeger | Update Password</title>

<style type="text/css">
.error{
	color: red;
}
</style>


<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="row w-100 m-0">
				<div
					class="content-wrapper full-page-wrapper d-flex align-items-center auth lock-full-bg">    
					<div class="card col-lg-4 mx-auto">
						<div class="card-body px-5 py-5">
							<h3 class="card-title text-left mb-3">Update Password</h3>
							<form action="updatemypassword" method="post" id="myform">

								Email :<input type="email" name="email"><br>
								<br> 
								Password : <input type="password" name="password" id = "password"><br>
								<span id="passwordError" class = "error"> </span> <br>
								Confirm Password : <input type="password" id = "cpassword"
									name="confirmPassword"><br><span id="cpasswordError" class = "error"></span>
								<br> 
								OTP : <input type="text" name="otp" /> <br>
								<br> 
								
								<button type="button" class="btn btn-outline-warning btn-icon-text" onclick="validation()">
								<i class=" btn-icon-prepend"></i> Update Password
										</button>
								
							</form>
							<br>
							<br>

						</div>

					</div>
				</div>
				<!-- content-wrapper ends -->
			</div>
			<!-- row ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>

<script type="text/javascript">

function validation(){
	
	
	isError = false;
	
	password = document.getElementById("password");
	passwordError = document.getElementById("passwordError");
	passwordRegex = /^[a-zA-Z0-9]{8,}$/;   
	
	cpassword = document.getElementById("cpassword");
	cpasswordError = document.getElementById("cpasswordError");
	
	
	if(password.value == ''){
		passwordError.innerHTML = "please Enter Password";
		isError = true;
	}else{
		if(passwordRegex.test(password.value) == false){
			passwordError.innerHTML = "password must have atleast 8 character";
			isError = true;
		}else if(!(password.value == cpassword.value)){
			passwordError.innerHTML = "Password and confirm password must be match";
			cpasswordError.innerHTML = "Password and confirm password must be match";
			isError = true;
		}else{
			passwordError.innerHTML = '';
			cpasswordError.innerHTML = '';
		}
	}
	
	
	if(isError == false){
		myform = document.getElementById("myform");
		myform.submit();
	}
	
	
	
	
}


</script>

</body>
</html>

<!-- 
	<form action="updatemypassword" method="post">
	 
		Email :<input type="email" name="email"><br><br>
		Password : <input type="password" name="password"><br><br>
		Confirm Password : <input type="password" name="confirmPassword"><br><br>
		OTP : <input type="text" name="otp"/>
		<br><br>
		
		<input type="submit" value="Update Password"/>
	</form><br><br> -->