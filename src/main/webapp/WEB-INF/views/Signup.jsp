<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="saveuser" method = "post">
		FirstName : <input type="text" name="firstName"><br><br>
		LastName : <input type="text" name="lastName"><br><br>
		Email :<input type="email" name="email"><br><br>
		Password : <input type="password" name="password"><br><br>
	
		
		<input type="submit" value="Signup"/><br><br/>
	</form>
	
	<a href="login">Login</a> | <a href="forgetpassword">ForgetPassword</a>
 
</body>
</html> -->


<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Expense Manager | SignUp</title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>

<style type="text/css">
.error {
	color: red;
}
</style>


</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="row w-100 m-0">
				<div  
					class="content-wrapper full-page-wrapper d-flex align-items-center auth register-half-bg">            <!-- register-half-bg     login-bg     lock-full-bg    login-bgf  -->             
					<div class="card col-lg-6 mx-auto">
						<div class="card-body px-5 py-5">
							<h3 class="card-title text-left mb-3">Register</h3>

							<form action="saveuser" method="post" id="myform">

								<div class="form-group">
									<label>First Name *</label> <input type="text"
										class="form-control p_input" name="firstName" id="firstName">
									<span id="firstNameError" class="error"></span>
								</div>

								<div class="form-group">
									<label>Last Name *</label> <input type="text"
										class="form-control p_input" name="lastName" id="lastName">
									<span id="lastNameError" class="error"></span>
								</div>

								<div class="form-group">
									<label>Email *</label> <input type="text"
										class="form-control p_input" name="email" id="email">
									<span id="emailError" class="error"></span>
									<div style="color: red;">${error}</div>
								</div>


								<div class="" align="center">
									<label style="font-size: large;">Gender *</label> <br> 
									Male:
									<input type="radio" class="" name="gender" value="male" >
									Female: <input type="radio" class="" name="gender"
										value="female"><br>
										<span id="genderError" class="error" ></span>
								</div>
								<br>

								<div class="form-group">
									<label>Your Birthdate *</label> <input type="date"
										class="form-control p_input" name="dob" id="dob">
										<span id="dobError" class="error"></span>
								</div>
           
								<div class="form-group">
									<label>Contact Number</label> <input type="text"
										class="form-control p_input" name="contactNum">
								</div>


								<div class="form-group">
									<label>Date of Joining</label>
									<%
									Calendar c = Calendar.getInstance();
									int d = c.get(c.DAY_OF_MONTH); //07 
									int m = c.get(c.MONTH) + 1;//03
									String mon = "";
									String dt = "";
									if (m <= 9) {
										mon = 0 + "" + m;
									} else {
										mon = m + "";
									}
									if (d <= 9) {
										dt = 0 + "" + d;
									} else {
										dt = d + "";
									}
									int y = c.get(c.YEAR);//2023 
									/* System.out.println(y + "-" + m + "-" + d); */
									%>
									<input type="date" id="myDate" class="form-control" name="date"
										value="<%=y + "-" + mon + "-" + dt%>">

								</div>


								<div class="form-group">
									<label>Password *</label> <input type="password" id="password"
										 class="form-control p_input" name="password">
										 <span id= "passwordError" class = "error"></span>
								</div>
								
									<div class="form-group">
									<label>Confirm Password *</label> <input type="password" id="cpassword"
										class="form-control p_input" name="cpassword">
										<span id="cpasswordError" class = "error"></span>
								</div>

								<div
									class="form-group d-flex align-items-center justify-content-between">
									<div class="form-check">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"> Remember me
										</label>
									</div>
									
								</div>
								
								
								<div class="text-center">
									<button type="button"
										class="btn btn-primary btn-block enter-btn"
										onclick="validation()" value="signup">Sign UP</button>
								</div>

								<p class="sign-up text-center">
									Already have an Account?<a href="login"> Login</a>
								</p>

							</form>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
			</div>
			<!-- row ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<jsp:include page="AllJavascript.jsp"></jsp:include>

	<script type="text/javascript">
		
	function validation() { // FUNCTION
			// FirstName Validaton

			isError = false;
			
			firstName = document.getElementById("firstName");
			firstNameError = document.getElementById("firstNameError");
			firstNameRegex = /^[a-zA-Z]+$/;

			if (firstName.value == '') {
				firstNameError.innerHTML = "Please Enter First Name";
				isError = true;
			} else {
				if (firstNameRegex.test(firstName.value) == false) {
					firstNameError.innerHTML = "please Enter Valid FirstName";
					isError = true;
				} else {
					firstNameError.innerHTML = "";
				}
			}

			// Last Name Validation			

			lastName = document.getElementById("lastName");
			lastNameError = document.getElementById("lastNameError");
			lastNameRegex = /^[a-zA-Z]+$/;

			if (lastName.value == '') {
				lastNameError.innerHTML = "please Enter Last Name";
				isError = true;
			} else {
				if (lastNameRegex.test(lastName.value) == false) {
					lastNameError.innerHTML = "Please Enter Valid Last Name";
					isError = true;
				} else {
					lastNameError.innerHTML = "";
				}
			}

			//  Email Validation

			email = document.getElementById("email");
			emailError = document.getElementById("emailError");
			emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-]{2,3}$/;

			if (email.value == '') {
				emailError.innerHTML = "Please Enter Email";
				isError = true;
			} else {
				if (emailRegex.test(email.value) == false) {
					emailError.innerHTML = "Please Enter Valid Email";
					isError = true;
				} else {
					emailError.innerHTML = "";
				}
			}
			
			
			// Gender Validation
			
			x = document.getElementsByName("gender");
			if(! (x[0].checked || x[1].checked) ){
				genderError.innerHTML = "Please Select Your Gender";
				isError = true;
			}else{
				genderError.innerHTML = "";
			}
			
			// Date Of Birth Validation
			
			dob = document.getElementById("dob");
			dobError = document.getElementById("dobError");
			
			if(dob.value == ''){
				dobError.innerHTML = "please Enter Your Date Of Birth"
				isError = true;
			}else{
				dobError.innerHTML = "";
			}
			
			// Password Validation
			
 			password = document.getElementById("password");
			passwordError = document.getElementById("passwordError");
			passwordRegex = /^[a-zA-Z0-9]{8,}$/;        // *?[^A-Za-z0-9]).{8,}  //    /^[a-zA-Z0-9]).{8,}$/;           // 
			
			cpassword = document.getElementById("cpassword");
			cpasswordError = document.getElementById("cpasswordError");
			
			if(password.value == ''){
				passwordError.innerHTML = "please Enter Password";
				isError = true;
			}else{
				if(passwordRegex.test(password.value) == false){
					passwordError.innerHTML = "Please enter atleast 8 character";
					isError = true;
				}else if( ! (password.value == cpassword.value)){
					passwordError.innerHTML = "Password does not match";
					cpasswordError.innerHTML = "Password does not match";
					isError = true;
				}else{
					passwordError.innerHTML = "";
					cpasswordError.innerHTML = "";
				}
			
			}
			
			if(isError == false){
				myform = document.getElementById("myform");
				myform.submit();
			}

		}
	</script>

	<!-- endinject -->
</body>
</html>