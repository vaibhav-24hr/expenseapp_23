<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<title>Home Page</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>

<body>

<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftsideUserdashboard.jsp"></jsp:include> 
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">

<h1>Home</h1>

<a href = "newincome">Add your Income here</a><br><br>

<a href = "newexpense">Add your Expenses here</a><br><br>

<a href = "logout"> Log Out </a><br>


</div> <!-- Content Wrapper -->
				
				<footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Vaibhav Adesara</span>
            </div>
          </footer>
				
			</div> <!-- Main Panel -->
		</div> <!-- container fluid -->
	</div> <!-- container scroller -->
	
	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>



<!-- <h1>Home</h1>

<a href = "newincome">Add your Income here</a><br><br>

<a href = "newexpense">Add your Expenses here</a><br><br>

<a href = "logout"> Log Out </a><br> -->