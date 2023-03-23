<%@page import="com.expenses.project.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ExpenseApp | Sub Category View</title>
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
						<h3 class="page-title">Sub Category Details</h3>

					</div>
					<div class="row" align="center" style="font-size: large;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

									<%
									SubCategoryBean scb = (SubCategoryBean) request.getAttribute("scb");
									%>

									CategoryId:
									<%=scb.getCategoryId()%>
									<br> CategoryName:
									<%=scb.getCategoryName()%>
									<br> SubCategoryId:
									<%=scb.getSubCategoryId()%><br> SubCategoryName:
									<%=scb.getSubCategoryName()%><br> Deleted:
									<%=scb.getDeleted()%>
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