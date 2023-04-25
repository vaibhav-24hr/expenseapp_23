<%@page import="com.expenses.project.bean.ExpenseBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | Expensees View</title> 
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
					<div class="page-header">
						<h3 class="page-title">Expense Details </h3>

					</div>
					<div class="row" align="center" style="font-size: large;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

<% ExpenseBean AllExb = (ExpenseBean)request.getAttribute("AllExb"); %>
	<h3>Expense Bill:</h3>
<div id="bill-image-container">
    <img id="bill-image" style="object-fit: cover; max-width: 100%; border: solid 2px #36ff00;" src="<%=AllExb.getBillURL()%>" alt="">
</div>

<script>
    var billImageContainer = document.getElementById("bill-image-container");
    var imageUrl = '<%=AllExb.getBillURL()%>';
    if (imageUrl) {
        document.getElementById("bill-image").src = imageUrl;
    } else {
        billImageContainer.innerHTML = 'You don\'t have an expense bill.';
    }
</script>
	

	Date: <%=AllExb.getDate()%><br>
	userId = <%=AllExb.getUserId() %><br>
	firstName: <%=AllExb.getFirstName() %><br>
	lastName: <%=AllExb.getLastName() %><br>
	email: <%=AllExb.getEmail() %><br>
	 expenseId: <%=AllExb.getExpenseId()%><br>
	 title: 	<%=AllExb.getTitle()%><br>
	 Vendor Name:  <%=AllExb.getVendorName()%><br>
	Category Name: <%=AllExb.getCategoryName() %> <br>
	SubCategory Name: <%=AllExb.getSubCategoryName() %><br>
	Ammount: <%=AllExb.getAmmount() %><br>
	Account Type: <%=AllExb.getAccountType() %><br>
	Status: <%=AllExb.getStatusShow() %><br>
	Description : <%=AllExb.getDescription() %><br>
	
	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>