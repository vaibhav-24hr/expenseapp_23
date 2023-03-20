<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expenseManeger | forgetpassword</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body bgcolor="white">
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="row w-100 m-0">
				<div
					class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
					<div class="card col-lg-4 mx-auto">
						<div class="card-body px-5 py-5">
							<h3 class="card-title text-left mb-3">OTP</h3>
							<form method="post" action="sendotpforforgetpassword">
								Email: <input type="email" name="email" value=""><br><br>
						
							<a href="updatepasswordjspopen"><button type="submit" class="btn btn-outline-warning btn-icon-text">
								<i class=" btn-icon-prepend"></i> Send OTP
										</button></a>
								<br><br>
							</form>
							<a href="login"> Login</a><br>
							<br> 
							<a href="updatepasswordjspopen">Aleready have an OTP</a>
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

<!-- <form method="post" action="sendotpforforgetpassword">
 	Email: <input type= "email" name="email" value="" ><br><br>
 	<input type = "submit"  value = "Send OTP" ><br><br>
 </form>
 <a href = "login"> Login</a><br><br>
 <a href = "updatepasswordjspopen"> Already Have an OTP</a> -->