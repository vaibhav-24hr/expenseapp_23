<%@page import="com.expenses.project.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> expense App | List Users </title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

<%
	List<UserBean> userlist = (List<UserBean>)request.getAttribute("userlist");
%>

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
						<h3 class="page-title">Users</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">User List</li>
							</ol>
						</nav>
					</div>
<!--  page HEader End -->

<!-- Row or Data Start -->
					<div class="row">


						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">All Users</h4>
									
									<table class="table table-striped" id="lists">
									
									<thead>
											<tr>

												<th style="color: white">First Name</th>

												<th style="color: white">Last Name</th>
												<th style="color: white">Email</th>
												<th style="color: white">Joining Date</th>
												<th style="color: white">Password</th>
												<th style="color: white">Gender</th>
												<th style="color: white">Date of Birth</th>
												<!-- <th style="color: white">Email</th>
												<th style="color: white">Email</th> -->
											</tr>
										</thead>
										
																				<tbody>

											<%
											for (int i = 0; i < userlist.size(); i++) {
											%>
											<tr>
												<td><%=userlist.get(i).getFirstName()%></td>
												<td><%=userlist.get(i).getLastName()%></td>
												<td><%=userlist.get(i).getEmail()%></td>
												<td><%=userlist.get(i).getJoindate()%></td>
												<td><%=userlist.get(i).getPassword()%></td>
												<td><%=userlist.get(i).getGender()%></td>
												<td><%=userlist.get(i).getDob()%></td>
												
												
												
												
												<%--  <td><a
													href="deleteuser/<%=userlist.get(i).getUserId()%>"><button type="button" class="btn btn-rounded btn-inverse-danger btn-sm">Delete</button></a>
													/ <a href="viewuser?userId=<%=userlist.get(i).getUserId()%>"><button type="button" class="btn btn-rounded btn-inverse-success btn-sm">View</button> </a></td>
												 --%> 
												
												
												
											</tr>
											<%
											}
											%>
											

										</tbody>
										</table>
										</div>
										
										</div>
						</div>
					</div>
				</div>
				<!-- Content Wrapper -->
			</div>
			<!-- Main Panel -->
		</div>
		<!-- container fluid -->
	</div>
	<!-- container scroller -->
	
	<!-- All JavaScript Plugin -->
	<jsp:include page="AllJavascript.jsp"></jsp:include>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('#lists').DataTable();
	});
	</script>




</body>
</html>