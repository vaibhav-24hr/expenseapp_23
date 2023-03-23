<%@page import="com.expenses.project.bean.IncomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseApp | List Income</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<%
	List<IncomeBean> inclist = (List<IncomeBean>) request.getAttribute("inclist");
	%>

	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftsideUserdashboard.jsp"></jsp:include>
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


												<!-- 		<th>IncomeId</th> -->
												<th style="color: white">Title</th>
												<th style="color: white">AccountType</th>
												<th style="color: white">Status</th>
												<!-- 		<th>UserId</th> -->
												<th style="color: white">Amount</th>
												<th style="color: white">Date</th>
												<th style="color: white">Action</th>
												<!-- 		<th>Description</th> -->

											</tr>
										</thead>

										<tbody>

											<%
											for (IncomeBean ib : inclist) {
											%>
											<tr>
												<%-- 		<td><%=ib.getIncomeId() %></td> --%>
												<td><%=ib.getTitle()%></td>
												<td><%=ib.getAccountType()%></td>
												<td><%=ib.getStatusShow()%></td>
												<%-- 		<td><%=ib.getUserId() %></td> --%>
												<td><%=ib.getAmmount()%></td>
												<td><%=ib.getDate()%></td>
												<%-- 	<td><%=ib.getDescription() %></td> --%>
												<td><a
													href="/viewincome?incomeId=<%=ib.getIncomeId()%>">View</a></td>
											</tr>

											<%
											}
											%>
										</tbody>
									</table>
									<div align="left">
										<a href="newincome"><button type="button"
												class="btn btn-outline-warning btn-icon-text">
												<i class="mdi mdi-plus btn-icon-prepend"></i> Add New Income
											</button></a>
									</div>

								</div>
								<br> <br>

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