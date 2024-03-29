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
		<jsp:include page="LeftsideUserdashboard.jsp"></jsp:include>
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

<% ExpenseBean exb = (ExpenseBean)request.getAttribute("exb"); %>

	
	<h3>Expense Bill:</h3>



<div id="bill-image-container">
    <img id="bill-image" style="object-fit: cover; max-width: 100%; border: solid 2px #36ff00;" src="<%=exb.getBillURL()%>" alt="">
</div>

<script>
    var billImageContainer = document.getElementById("bill-image-container");
    var imageUrl = '<%=exb.getBillURL()%>';
    if (imageUrl) {
        document.getElementById("bill-image").src = imageUrl;
    } else {
        billImageContainer.innerHTML = 'You don\'t have an expense bill.';
    }
</script>
	<br>
	Date: <%=exb.getDate()%>  <br>
	 expenseId: <%=exb.getExpenseId()%><br>
	 title: 	<%=exb.getTitle()%><br>
	 Vendor Name:  <%=exb.getVendorName()%><br>
	Category Name: <%=exb.getCategoryName() %> <br>
	SubCategory Name: <%=exb.getSubCategoryName() %><br>
	Ammount: <%=exb.getAmmount() %><br>
	Account Type: <%=exb.getAccountType() %><br>
	Status: <%=exb.getStatusShow() %><br>
	Description : <%=exb.getDescription() %><br>
	
	

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


	<%-- <h3> Expense Bill : </h3><img style="object-fit:cover; max-width: 100%; border: solid 2px #36ff00;"  class="" src="<%=exb.getBillURL()%>" alt="" > --%>


<%-- 	<img id="bill-image" style="object-fit:cover; max-width: 100%; border: solid 2px #36ff00;"  class="" src="<%=exb.getBillURL()%>" alt="" ><!-- </div> -->
<script>
    var billImage = document.getElementById("bill-image");
    var imageUrl = '<%=exb.getBillURL()%>';
    if (imageUrl) {
        billImage.innerHTML = '<img src="' + imageUrl + '">';
    } else {
        billImage.innerHTML = 'You don\'t have an expense bill.';
    }
</script> --%>

<%-- <div id="bill-image-container">
    <img id="bill-image" style="object-fit: cover; max-width: 100%; border: solid 2px #36ff00;" src="<%=exb.getBillURL()%>" alt="">
</div>

<script>
    var billImageContainer = document.getElementById("bill-image-container");
    var imageUrl = '<%=exb.getBillURL()%>';
    if (imageUrl == null) {
        billImageContainer.innerHTML = 'You don\'t have an expense bill.';
    }
</script> --%>