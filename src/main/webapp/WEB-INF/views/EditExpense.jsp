<%@page import="java.util.Calendar"%>
<%@page import="com.expenses.project.bean.VendorBean"%>
<%@page import="com.expenses.project.bean.AccountBean"%>
<%@page import="com.expenses.project.bean.StatusBean"%>
<%@page import="com.expenses.project.bean.ExpenseBean"%>
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
<title>expense manager | Edit Expense</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>

<body>
	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftsideUserdashboard.jsp"></jsp:include>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">

					<!--  page HEader -->

					<!-- Row or Data Start -->
					<div class="row">
						<div class="col-md-1"></div>
						<!-- Row or Data End -->
						<div class="col-md-10">
							<div class="card-body px-5 py-5">
								<h3 class="card-title text-left mb-3">Edit Expense</h3>
								
			<%  List<ExpenseBean> allExpList = (List<ExpenseBean>)request.getAttribute("allExpList"); 	
			 	ExpenseBean exBean = (ExpenseBean)request.getAttribute("exBean"); 
				
				List<StatusBean> statuslist = (List<StatusBean>)request.getAttribute("statuslist");
				List<AccountBean> acclist = (List<AccountBean>)request.getAttribute("acclist");
				List<CategoryBean> clist = (List<CategoryBean>)request.getAttribute("clist");
				List<SubCategoryBean> sublist = (List<SubCategoryBean>)request.getAttribute("sublist");
				List<VendorBean> vendorlist = (List<VendorBean>)request.getAttribute("vendorlist");
				
			%> 				
								
								<form method="post" action="updateexpense">
								<div class="row">
									<div class="form-group">
									<input type="hidden" name="expenseId" value = "${exBean.expenseId}"/>
									</div>
									
									<div class="form-group col-md-4">
										<h4>Title *</h4>
									<input class="form-control" type="text" name = "title" value="<%=exBean.getTitle()%>">
									</div>
									
									<div class="form-group col-md-4">
										<h4>Status *</h4>
											<select class="form-control"  name="statusId" id="statusId">
											  <% for(StatusBean sb : statuslist) { %>
											    <% String selected = sb.getStatusId() == exBean.getStatusId() ? "selected" : ""; %>
											    <option class="form-control"  value="<%= sb.getStatusId() %>" <%= selected %>><%= sb.getStatusShow() %></option>										
											  <% } %>
											</select> 
										</div>
										
										
										<div class="form-group col-md-4" >
										<h4>Account *</h4>
										<select class="form-control"  name="accountTypeId" id = "accountTypeId">
										<%
											for(AccountBean ab : acclist){
										%>
										<option class="form-control"  value="<%=ab.getAccountTypeId()%>"
										<%=ab.getAccountTypeId() == exBean.getAccountTypeId() ? "selected" : ""%>>
										<%=ab.getAccountType() %></option>
										<%} %>
										</select></div>						
									

									</div>
									<br>
									<div class="row">
									
								<div class="form-group col-md-4" >
										<h4>Category *</h4>
										
										<select class="form-control"  name="categoryId" id = "categoryId">
										<%for(CategoryBean cb : clist){ %>
										<option class="form-control"  value="<%=cb.getCategoryId()%>"
										<%=cb.getCategoryId() == exBean.getCategoryId() ? "selected" : "" %>>
										<%=cb.getCategoryName() %></option>
																				<%} %>
										</select>
									</div>
									
									<div class="form-group col-md-4" >
										<h4>Vendor *</h4>
											<select name="vendorId" id="vendorId" class="form-control" >
											  <% for(VendorBean vb : vendorlist) { %>
											    <% String selected = vb.getVendorId() == exBean.getVendorId() ? "selected" : ""; %>
											    <option class="form-control"  value="<%= vb.getVendorId()%>" <%= selected %>><%= vb.getVendorName() %></option>										
											  <% } %>
											</select> 
										</div>
										
									<div class="form-group col-md-4">
										<h4>Sub Category *</h4>
											<select name="subCategoryId" id="subCategoryId" class="form-control" >
											  <% for(SubCategoryBean sb : sublist) { %>
											    <% String selected = sb.getSubCategoryId() == exBean.getSubCategoryId() ? "selected" : ""; %>
											    <option class="form-control"  value="<%= sb.getSubCategoryId()%>" <%= selected %>><%= sb.getSubCategoryName() %></option>										
											  <% } %>
											</select> 
										</div>
										
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

							<%-- 			Date : <input type="date" id="myDate" name="date"
											class="form-control" value="<%=y + "-" + mon + "-" + dt%>"><br>
										<br> Description:
										<textarea rows="5" cols="15" name="description"
											class="form-control"></textarea>
										<br> <br> --%>
										
								  
								    </div>
								    <br>
								    <div class="row">
									<div class="form-group col-md-4">
										<h4>Amount *</h4>
										<input class="form-control"  type="text" name = "ammount" value="<%=exBean.getAmmount()%>">
									</div>
									
									<div class="form-group col-md-4">
										<h4>Date *</h4>
								<input type="date" id = "myDate" name = "date" value="<%=exBean.getDate() %>" class="form-control" >
								    </div>
									
									</div>
									
									<br>

									<button type="submit"
										class="btn btn-outline-secondary btn-lg btn-block">Update
										Expense</button>

									<div class="d-flex"></div>
									<br> <a href="listexpense"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class=" btn-icon-prepend"></i> List Sub Expense
										</button></a>
								</form>
								
							</div>
						</div>
					</div>
					<!-- Row or Data End -->

				</div>
			</div>
		</div>
	</div>
	
		<jsp:include page="AllJavascript.jsp"></jsp:include>
</body>

</html>