<%@page import="com.expenses.project.bean.VendorBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>expenseapp | List Vendor</title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>
</head>


<body>

	<%
	List<VendorBean> list = (List<VendorBean>) request.getAttribute("list");
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
						<h3 class="page-title">Vendor</h3>
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
									<h4 class="card-title">Vendor List</h4>

									<div class="table-responsive">
										<table class="table table-striped" id = "lists">
											<thead>
												<tr>
													<th style="color: white">Vendor</th>
													<th style="color: white">Status</th>
													<th style="color: white">Action</th>
												</tr>
											</thead>
											<tbody>

												<%
												for (VendorBean cb : list) {
												%>

												<tr>

													<td><%=cb.getVendorName()%></td>
													<td><%=cb.getDeleted()%></td>
													<td><a href="deletevendor/<%=cb.getVendorId()%>">
															<button type="button" class="btn btn-rounded mdi mdi-delete btn-inverse-danger btn-sm"></button> </a></td>
												</tr>

												<%
												}
												%>

											</tbody>
										</table>
									</div>
									<div align="right">
										<a href="newvendor"><button type="button"
												class="btn btn-outline-warning btn-icon-text">
												<i class="mdi mdi-plus btn-icon-prepend"></i> Add Vendor</button>
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




<%-- 
<h3>Vendor List</h3>
	
	<%
		List<VendorBean> list = (List<VendorBean>)request.getAttribute("list");
	%>
	
	<table border = 1 >
		
		<tr>
			<th>VendorId</th>
			<th>VendorName</th>
			<th>Deleted</th>
			<th>Action</th>		
		</tr>
		
		<% for (VendorBean cb : list){ %>
		
		<tr>
			<td><%=cb.getVendorId() %></td>
			<td><%=cb.getVendorName() %></td>
			<td><%=cb.getDeleted() %></td>
			<td><a href = "deletevendor/<%= cb.getVendorId()%>"> Delete </a> </td>
		</tr>
		
		<%} %>
		
	</table>
	
	<br><br>

<a href="newvendor"> Add Vendor </a>	 --%>