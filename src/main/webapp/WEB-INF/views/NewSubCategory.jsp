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
<title>expenseApp | New Sub Subcategory</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
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

					<!--  page HEader -->

					<!-- Row or Data Start -->
					<div class="row">
						<div class="col-md-1"></div>
						<!-- Row or Data End -->
						<div class="col-md-10">
							<div class="card-body px-5 py-4">
								<h3 class="card-title text-left mb-3">Add New Sub Category</h3>

								<form method="post" action="savesubcategory">
									<div class="form-group">
										<h4>SubCategory *</h4>
										<input type="text" class="form-control p_input"
											name="subCategoryName">
									</div>
								
									<div class="form-group">
										<h4>Category *</h4>
                       
									 <select name="categoryId"> 
											<%
											for (CategoryBean cb : list) {
											%>

											<option value="<%=cb.getCategoryId()%>">
												<%=cb.getCategoryName()%></option>
											<%
											}
											%>

										</select><br>
									<!-- </div> -->
							 </div>

									<button type="submit"
										class="btn btn-outline-secondary btn-lg btn-block">Add
										Sub Category</button>

									<div class="d-flex"></div>
									<br> <a href="listsubcategories"><button type="button"
											class="btn btn-outline-warning btn-icon-text">
											<i class=" btn-icon-prepend"></i> See All Sub Categories
										</button></a>
								</form>




							</div>
						</div>
						<!-- Row or Data End -->

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>




<%-- <% 
	List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
%>

 <form action = "savesubcategory" method = "post">
 	SubCategory : <input type="text" name="subCategoryName">
 	<br><br>
 	category <select name="categoryId">
 	<%
 		for(CategoryBean cb : list){
 	%>
 	
 	<option value = "<%= cb.getCategoryId() %>">
 		<%=	cb.getCategoryName()%></option>
 		<%
				}
			%>
			
			</select><br><br>
 	
 	
 	
		 <input type="submit" value="Add Sub Category"/>
		  </form>
		  <a href="listsubcategories">List Sub Category</a> --%>