<%@page import="com.expenses.project.bean.SubCategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<%
	List<SubCategoryBean> list = (List<SubCategoryBean>) request.getAttribute("list");
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
						<h3 class="page-title">Sub Category</h3>
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
									<h4 class="card-title">Sub Categories</h4>

									<div class="table-responsive">
										<table class="table table-striped" id = "lists">
											<thead>
												<tr>

													<th style="color: white">Sub Category</th>
													<th style="color: white">Category</th>
													<th style="color: white">Status</th>
													<th style="color: white">Action</th>
												</tr>
											</thead>

											<tbody>

												<%
												for (int i = 0; i < list.size(); i++) {
												%>
												<!-- we can also use for each loop:  for(CategoryBean cb:list) -->
												<tr>

													<td><%=list.get(i).getSubCategoryName()%></td>

													<td><%=list.get(i).getCategoryName()%></td>
													<td><%=list.get(i).getDeleted()%></td>
													<td><a
														href="/deletesubcategory/<%=list.get(i).getSubCategoryId()%>">Delete</a> /
														<a
														href="viewsubcategory/<%=list.get(i).getSubCategoryId()%>">View</a>
													</td>
												</tr>
												<%
												}
												%>

											</tbody>
										</table>
									</div>
									<div align="right">
										<a href="newsubcategory"><button type="button"
												class="btn btn-outline-warning btn-icon-text">
												<i class="mdi mdi-plus btn-icon-prepend"></i> Add Sub Category
											</button></a>
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

	<jsp:include page="AllJavascript.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#lists').DataTable();
		});
	</script>

</body>
</html>

<%-- <table border = "1">

	<tr>
		<th>SubCategoryId</th>
		<th>SubCategoryName</th>
		<th>GroupId</th>
		<th>Category Name</th>
		<th>Deleted?</th>
		<th>Action</th>
		
	</tr>

	<% for(int i=0; i<list.size(); i++){ %>  <!-- we can also use for each loop:  for(CategoryBean cb:list) -->
	<tr>
		<td><%= list.get(i).getSubCategoryId() %></td>
		<td><%=list.get(i).getSubCategoryName() %></td>
		<td><%=list.get(i).getCategoryId() %></td>
		<td><%= list.get(i).getCategoryName() %></td>
		<td><%=list.get(i).getDeleted() %></td>
		<td><a href = "/deletesubcategory/<%=list.get(i).getSubCategoryId()%>">Delete</a>
		<a href = "viewsubcategory/<%=list.get(i).getSubCategoryId()%>">View</a>
		</td>
	</tr>   
<%}%>
</table>
<br><br>
<a href="newsubcategory"> New Sub Category </a>
 --%>