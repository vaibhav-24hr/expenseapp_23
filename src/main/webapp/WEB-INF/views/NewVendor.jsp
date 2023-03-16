<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expense manager | New Vendor</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftSlideBar.jsp"></jsp:include>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">

					<!--  page HEader -->

					<!-- Row or Data Start -->
					<div class="row">
						<div class="col-md-1"></div>
						<!-- Row or Data End -->
						<div class="col-md-10">
							<div class="card-body px-5 py-5">
								<h3 class="card-title text-left mb-3">Add New Vendor</h3>
								<form method="post" action="savevendor">
									<div class="form-group">
										<h4>Vendor *</h4>
										<input type="text" class="form-control p_input"
											name="vendorName">
									</div>
									<br>

									<button type="submit"
										class="btn btn-outline-secondary btn-lg btn-block">Add
										Vendor</button>

									<div class="d-flex"></div>
									<br> <a href="listvendor"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class=" btn-icon-prepend"></i> See All Vendors
										</button></a>
								</form>
							</div>
						</div>
					</div>
					<!-- Row or Data End -->

				</div>
			</div>
		</div>
	</div>


	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>


<!-- <form action="savevendor" method="post">
		Vendor Name:  <input type= "text" name="vendorName"><br><br>
		
		<input type = "submit" name="Save New Vendor"> 
	</form><br> <br>
	<a href = "listvendor"> Display All Vendors </a><br> <br>
 -->