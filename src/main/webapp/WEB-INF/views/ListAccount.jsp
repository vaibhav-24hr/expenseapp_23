<%@page import="com.expenses.project.bean.AccountBean"%>
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
<title>expenseApp | List of Account</title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>
	


	<%
		List<AccountBean> list = (List<AccountBean>)request.getAttribute("list");
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
						<h3 class="page-title">Category</h3>
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


						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Categories</h4>
	
	
	<table class="table table-striped" id="lists">
		
												<thead>
											<tr>

												<th style="color: white">AccountId</th>

												<th style="color: white">AccountType</th>
										
												
												<!-- <th style="color: white">Edit Category</th>  -->
											</tr>
										</thead>
		
<tbody>
		
		<%for(AccountBean ab : list){ %>
		
		<tr>
			<td> <%= ab.getAccountTypeId() %> </td>
			<td> <%= ab.getAccountType() %> </td>
		</tr>
			
			<%}%>
		</tbody>	
	</table>
</div>
								<div align="right">
									<a href="newaccount"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class="mdi mdi-plus btn-icon-prepend"></i> Add Vendor
										</button></a>
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