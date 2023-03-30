<%@page import="java.util.List"%>
<%@page import="com.expenses.project.bean.StatusBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expenseManager | List Status</title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>

</head>

<body>

		
	<%
		List<StatusBean> statuslist = (List<StatusBean>)request.getAttribute("statuslist");
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
						<h3 class="page-title">Status</h3>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="admindashboard">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">List</li>
							</ol>
						</nav>
					</div>
					<!--  page HEader End -->

					<!-- Row or Data Start -->
					<div class="row">


						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Status List</h4>

									<div class="table-responsive">
										<table class="table table-striped" id = "lists">
											<thead>
												<tr>
													
													<th style="color: white">Status Show</th>
													<th style="color: white">Action</th>
												</tr>
											</thead>
											<tbody>

												<% for(StatusBean cb : statuslist ){ %>

												<tr>

													<td><%=cb.getStatusShow() %></td>
													<td> <a href = "deletestatus/<%=cb.getStatusId() %>"> <button type="button" class="btn btn-rounded mdi mdi-delete btn-inverse-danger btn-sm"></button> </a> </td>
												</tr>

												<%
												}
												%>

											</tbody>
										</table>
									</div>
									<div align="right">
										<a href="newstatus"><button type="button"
												class="btn btn-outline-warning btn-icon-text">
												<i class="mdi mdi-plus btn-icon-prepend"></i> Add Status</button>
												</a>
									</div>
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




<%-- <h3>List Status</h3>
	
	<%
		List<StatusBean> statuslist = (List<StatusBean>)request.getAttribute("statuslist");
	%>
	
	<table border="1">
	
	<tr>
	<th>StatusId</th>
	<th>StatusShow</th>
	<th> Action </th>
	</tr>
	
	<% for(StatusBean cb : statuslist ){ %>
	<tr>
	
	<td><%=cb.getStatusId() %></td>
	<td><%=cb.getStatusShow() %></td>
	<td> <a href = "deletestatus/<%=cb.getStatusId() %>"> Delete </a> </td>
	
	</tr>
	
	<%} %>
	
	
	</table>
	<br><br>
	<a href = "newstatus"> New Status </a> --%>