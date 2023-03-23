<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseApp | Category View</title>
<!-- plugins:css -->
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
				<div class="page-header">
						<h3 class="page-title">Category Details</h3>
						
					</div>
					<div class="row" align="center" style="font-size: large;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<%
									CategoryBean cb = (CategoryBean) request.getAttribute("cb");
									%>


									CategoryId :
									<%=cb.getCategoryId()%><br> CategoryName :
									<%=cb.getCategoryName()%><br> Deleted :
									<%=cb.getDeleted()%>
									<br>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>
