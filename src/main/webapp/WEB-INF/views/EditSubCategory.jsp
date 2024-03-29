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
<title>expense manager | Edit SubCategory</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>

<body>
	<div class="container-scroller">
		<!-- Slidebar -->
		<jsp:include page="LeftSlideBar.jsp"></jsp:include>
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
								<h3 class="card-title text-left mb-3">Edit Sub Category</h3>
								
			<% List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
				SubCategoryBean scBean = (SubCategoryBean)request.getAttribute("scBean");	
			%>
								
								
								<form method="post" action="updatesubcategory">
									<div class="form-group">
									<input type="hidden" name="subCategoryId" value = "${scBean.subCategoryId}"/>
										<h4>Sub Category *</h4>
										<input type="text" class="form-control p_input"
											name="subCategoryName" value="${scBean.subCategoryName}">
									</div>
									<div class="form-group">
									
										<h4>Category *</h4>
										
										<select class="form-control  name = "categoryId" id = "categoryId"> 
												<option value="-1">Select Category </option>													
										<%
											for(CategoryBean cb :list){
										%>
										<option class="form-control  value="<%=cb.getCategoryId()%>"
											<%=cb.getCategoryId() == scBean.getCategoryId() ? "selected" : ""%>>
											<%=cb.getCategoryName()%></option>	
										
										<%}%>
										</select>
										
										
										
								<%-- 		<input type="text" class="form-control p_input"
											name="subCategoryName" value="${scBean.subCategoryName}"> --%>
									</div>
									
									<br>

									<button type="submit"
										class="btn btn-outline-secondary btn-lg btn-block">Update
										Sub Category</button>

									<div class="d-flex"></div>
									<br> <a href="listsubcategories"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class=" btn-icon-prepend"></i> List Sub Categorie
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