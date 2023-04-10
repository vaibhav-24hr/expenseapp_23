<%@page import="com.expenses.project.bean.UserBean"%>
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
<title>ExpenseApp | Users View</title>
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
						<h3 class="page-title">Users Details</h3>
						
					</div>
					<div class="row" align="center" style="font-size: large;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<%
									UserBean usBean = (UserBean)request.getAttribute("usBean");
									%>


									userId: <%-- :${user.userId} --%>
									 <%=usBean.getUserId()%> <br> 
									 firstName : <%=usBean.getFirstName() %><br> 
									Last Name: <%=usBean.getLastName()%><br>
									email : <%=usBean.getEmail() %><br> 
									password: <%=usBean.getPassword()%><br>
									role : <%-- <%=usBean.getRole()%> --%> ${user.role == 1 ? "Admin" : "Customer"}<br> 
									gender: <%=usBean.getGender()%><br>
									Birth Date : <%=usBean.getDob() %><br> 
									Sign-up Date: <%=usBean.getJoindate()%><br>
									contactNum : <%=usBean.getContactNum() %><br> 
									imageUrl: <%=usBean.getImageUrl()%><br>
									
									

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
