<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expenseManeger | Update Password</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="row w-100 m-0">
				<div
					class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
					<div class="card col-lg-4 mx-auto">
						<div class="card-body px-5 py-5">
							<h3 class="card-title text-left mb-3">Update Password</h3>
							<form action="updatemypassword" method="post">

								Email :<input type="email" name="email"><br>
								<br> Password : <input type="password" name="password"><br>
								<br> Confirm Password : <input type="password"
									name="confirmPassword"><br>
								<br> OTP : <input type="text" name="otp" /> <br>
								<br> 
								
								<button type="submit" class="btn btn-outline-warning btn-icon-text">
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