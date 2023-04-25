<%@page import="java.util.Calendar"%>
<%@page import="com.expenses.project.bean.VendorBean"%>
<%@page import="com.expenses.project.bean.StatusBean"%>
<%@page import="com.expenses.project.bean.AccountBean"%>
<%@page import="com.expenses.project.bean.SubCategoryBean"%>
<%@page import="com.expenses.project.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseApp | Add your Expenses</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	List<SubCategoryBean> sublist = (List<SubCategoryBean>) request.getAttribute("sublist");
	List<AccountBean> acclist = (List<AccountBean>) request.getAttribute("acclist");
	List<StatusBean> stlist = (List<StatusBean>) request.getAttribute("stlist");
	/* List<VendorBean> vdlist = (List<VendorBean>) request.getAttribute("vdlist"); */
	List<VendorBean> vendorlist = (List<VendorBean>)request.getAttribute("vendorlist");
	%>

	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftsideUserdashboard.jsp"></jsp:include>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel" >
				<div class="content-wrapper" align="center">
					<!-- <div class="col-md-8"></div> -->
					<div class="col-md-10">
						<div class="card">

							<div class="card-body" align="left">

								<h4 class="card-title" align="center">Add Your expenses
									Here</h4>

								<div class="form-group">
									<form action="saveexpense" method="post">

										Title: <input type="text" name="title" class="form-control">
										<br> <br> Vendor: <select name="vendorId"
											class="form-control">
											<%
											for (VendorBean vb : vendorlist) {
											%>

											<option class="form-control" value="<%=vb.getVendorId()%>">
												<%=vb.getVendorName()%></option>
											<%
											}
											%>

										</select> <br> <br> Category: <select name="categoryId"
											class="form-control">
											<%
											for (CategoryBean cb : list) {
											%>

											<option class="form-control" value="<%=cb.getCategoryId()%>">
												<%=cb.getCategoryName()%></option>
											<%
											}
											%>
										</select> <br> <br> Sub Category : <select
											name="subCategoryId" class="form-control">
											<%
											for (SubCategoryBean sb : sublist) {
											%>
											<option class="form-control" value="<%=sb.getSubCategoryId()%>">
												<%=sb.getSubCategoryName()%></option>
											<%
											}
											%>
										</select> <br> <br> Account: <select name="accountTypeId"
											class="form-control">
											<%
											for (AccountBean acb : acclist) {
											%>

											<option class="form-control" value="<%=acb.getAccountTypeId()%>">
												<%=acb.getAccountType()%></option>

											<%
											}
											%>
										</select> <br> <br> Status: <select name="statusId"
											class="form-control">
											<%
											for (StatusBean stb : stlist) {
											%>
											<option class="form-control" value="<%=stb.getStatusId()%>">
												<%=stb.getStatusShow()%>
											</option>
											<%
											}
											%>
										</select> <br> <br> Amount: <input type="text" name="ammount"
											class="form-control"> <br> <br>

										<%
										Calendar c = Calendar.getInstance();
										int d = c.get(c.DAY_OF_MONTH); //07 
										int m = c.get(c.MONTH) + 1;//03
										String mon = "";
										String dt = "";
										if (m <= 9) {
											mon = 0 + "" + m;
										} else {
											mon = m + "";
										}
										if (d <= 9) {
											dt = 0 + "" + d;
										} else {
											dt = d + "";
										}
										int y = c.get(c.YEAR);//2023 
										System.out.println(y + "-" + m + "-" + d);
										%>

										Date : <input type="date" id="myDate" name="date"
											class="form-control" value="<%=y + "-" + mon + "-" + dt%>"><br>
										<br> Description:
										<textarea rows="5" cols="15" name="description"
											class="form-control"></textarea>
										<br> <br>


										<button type="submit"
											class="btn btn-danger btn-icon-text btn-lg btn-block">
											<i class="mdi btn-icon-prepend"></i> Add Expense
										</button>

									</form>
								</div>
								<br> <a href="listexpense"><button type="button"
										class="btn btn-outline-warning btn-icon-text">
										<i class="mdi btn-icon-prepend"></i>Show All Your Expenses
									</button></a>
							</div>

						</div>
					</div>
				</div>
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
							© Vaibhav Adesara</span>
					</div>
				</footer>
			</div>
			<!-- Main Panel -->

		</div>
		<!-- container fluid -->

	</div>
	<!-- container scroller -->



	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>