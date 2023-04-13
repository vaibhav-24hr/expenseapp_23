<%@page import="com.expenses.project.bean.CategoryBean"%>
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
<title>expenseManager | ListCategories</title>
<!-- plugins:css -->


<jsp:include page="AllCss.jsp"></jsp:include>
</head>

<body>

	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	%>

	<!-- MAin Content -->

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

												<th style="color: white">Category</th>

												 <th style="color: white">Active</th> 
												<th style="color: white">Action</th>
												
												<th style="color: white">Edit Category</th> 
											</tr>
										</thead>

										<tbody>

											<%
											for (int i = 0; i < list.size(); i++) {
											%>
											<tr>
												<td><%=list.get(i).getCategoryName()%></td>
											 <%-- 	<td><%=list.get(i).getDeleted()%></td>  --%>
							<%-- 				<td>
										 	<div class="form-check form-switch">
											
												<input class="form-check-input" onclick="changeStatus(<%=list.get(i).getCategoryId()%>,<%=list.get(i).getDeleted()%>)" type="checkbox"
												id="flexSwitchCheckChecked" <%=!list.get(i).getDeleted() ? "checked" : ""%>>
												 <label class="form-check-label" for="switchTheme">Dark Mode</label>
												</div> 
												</td>  --%>

												<td>
													<div class="form-check form-switch">
														<input class="form-check-input"
															onclick="changeStatus(<%=list.get(i).getCategoryId()%>,<%=list.get(i).getDeleted()%>)"
															type="checkbox" id="<%=list.get(i).getCategoryId()%>"
															<%=!list.get(i).getDeleted() ? "checked" : ""%>>
														<label class="form-check-label"
															for="<%=list.get(i).getCategoryId()%>">Dark Mode</label>
													</div>
												</td>

												<td><%-- <a
													href="deletecategory/<%=list.get(i).getCategoryId()%>"><button type="button" class="btn btn-rounded mdi mdi-delete btn-inverse-danger btn-sm "></button></a>
													/ --%> <a href="viewcategory?categoryId=<%=list.get(i).getCategoryId()%>"><button type="button" class="btn  btn-rounded mdi mdi-eye btn-inverse-success btn-sm"></button> </a></td>
												<td><a href="editcategory?categoryId=<%=list.get(i).getCategoryId()%>"><button type="button" class="btn  btn-rounded mdi mdi-lead-pencil btn-inverse-info btn-sm"></button> </a></td>
												
												
												
											</tr>
											<%
											}
											%>

										</tbody>
									</table>
								</div>
								<div align="right">
									<a href="newcategory"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class="mdi mdi-plus btn-icon-prepend"></i> Add Category
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
	<script type="text/javascript">
		function changeStatus(categoryId, currentStatus) {
			location.href = "deletecategory/"+categoryId+"/"+currentStatus;
		}
	</script>
	<script>
  const switchTheme = document.querySelector('#switchTheme');
  const body = document.querySelector('body');

  switchTheme.addEventListener('change', () => {
    if (switchTheme.checked) {
      body.classList.add('bg-dark');
      body.classList.remove('bg-light');
    } else {
      body.classList.add('bg-light');
      body.classList.remove('bg-dark');
    }
  });
</script>

</body>
</html>