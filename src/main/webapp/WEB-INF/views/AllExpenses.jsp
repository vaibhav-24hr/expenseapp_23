<%@page import="com.expenses.project.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseApp | List Expense</title>

<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<%
	List<ExpenseBean> allExpList = (List<ExpenseBean>) request.getAttribute("allExpList");
	%>

	<!-- <h2> All Your Expenses </h2> -->

	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftSlideBar.jsp"></jsp:include>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">

					<!--  page HEader End -->

					<div class="row">


						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Expenses</h4>


									<table class="table table-striped" id="lists">
										<thead>
											<tr>



												<th style="color: white">Title</th>
												 		<th style="color: white">Vendor</th>
												<!-- <th style="color: white">SubCategoryId</th> --> 
												<th style="color: white">Category</th>
												<!-- 		<th style="color: white"> AccountTypeId</th> -->
												<!-- <th style="color: white">Status</th> -->
												<th style="color: white">Amount</th>
												<th style="color: white">Date</th>
												<!-- 		<th style="color: white">Description</th> -->
												<!-- 	<th style="color: white">UserId</th -->
												 <th>Action</th> 
											</tr>
										</thead>

										<tbody>

											<%
											for (ExpenseBean exb : allExpList) {
											%>

											<tr>
												<%-- <td> <%=exb.getExpenseId()%> </td> --%>
												<td><%=exb.getTitle()%></td>
												 		<td> <%=exb.getVendorName()%> </td>
											<%-- 	<td> <%=exb.getSubCategoryId()%> </td> --%>
												<td><%=exb.getCategoryName()%></td>
												<%-- 		<td> <%=exb.getAccountTypeId() %> </td> --%>
												<%-- <td><%=exb.getStatusShow()%></td> --%>
												<td><%=exb.getAmmount()%></td>
												<td><%=exb.getDate()%></td>
												<%-- 		<td> <%=exb.getDescription() %> </td> --%>
												<%-- 		<td> <%=exb.getUserId() %> </td> --%>
											     <td><a href="viewallexpense?expenseId=<%=exb.getExpenseId()%>"><button type="button" class="btn btn-rounded mdi mdi-eye btn-inverse-success btn-sm"></button></a></td> 
											   
											</tr>

											<%
											}
											%>
								</tbody>

									</table>

								</div>
								<br>
								<br>

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