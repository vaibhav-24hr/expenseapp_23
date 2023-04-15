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
				
			%> 

								
								
								<form method="post" action="updateexpense">
									<div class="form-group">
									<input type="hidden" name="expenseId" value = "${exBean.expenseId}"/>
									
										<%-- <h4>Expense *</h4>
										<input type="text" class="form-control p_input"
											name="statusShow" value="${scBean.statusShow}"> --%>
									</div>
									<div class="form-group">
									
										<h4>Status *</h4>
<%-- 										 <select name="statusId" id = "statusId">
											<option value="-1"> Select Status </option> 
										<%
											for(StatusBean sb : statuslist){
										%>
										
										<option value="<%=sb.getStatusId()%>"
										<%=sb.getStatusId() == exBean.getStatusId() ? "selected" : "" %>>
										<%=sb.getStatusShow() %></option>										
										<%} %>
										</select>  --%>
										
										
											<select name="statusId" id="statusId">
											  <option value="-1">Select Status</option> 
											  <% for(StatusBean sb : statuslist) { %>
											    <% String selected = sb.getStatusId() == exBean.getStatusId() ? "selected" : "Not Found Status Id"; %>
											    <% System.out.println("Status ID: " + sb.getStatusId() + ", Selected: " + selected); %>
											    <option value="<%= sb.getStatusId() %>" <%= selected %>><%= sb.getStatusShow() %></option>										
											  <% } %>
											</select> 
																				
										<br></div>
										
										
										<div>
										<h4>Account *</h4>
										<select name="accountTypeId" id = "accountTypeId">
											<option value="-1"> Select accountType </option> 
										<%
											for(AccountBean ab : acclist){
										%>
										
										<option value="<%=ab.getAccountTypeId()%>"
										<%=ab.getAccountTypeId() == exBean.getAccountTypeId() ? "selected" : ""%>>
										<%=ab.getAccountType() %></option>
										<%} %>
										</select></div>
		<%-- 		<div class="form-group">
									
										<h4>Category *</h4>
										
										<select name = "categoryId" id = "categoryId"> 
												<option value="-1">Select Category </option>													
										<%
											for(CategoryBean cb :list){
										%>
										<option value="<%=cb.getCategoryId()%>"
											<%=cb.getCategoryId() == scBean.getCategoryId() ? "selected" : ""%>>
											<%=cb.getCategoryName()%></option>	
										
										<%}%>
										</select>
										
										
										
										<input type="text" class="form-control p_input"
											name="subCategoryName" value="${scBean.subCategoryName}">
									</div>	 --%>								
									
									
									
									
									
									
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