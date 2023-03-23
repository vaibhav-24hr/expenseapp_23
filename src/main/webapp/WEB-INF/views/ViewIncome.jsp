<%@page import="com.expenses.project.bean.IncomeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expense App | View Income</title>
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
						<h3 class="page-title">Income Details </h3>

					</div>
					<div class="row" align="center" style="font-size: large;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

	<%
	IncomeBean inb = (IncomeBean) request.getAttribute("inb");
	%>

	Income Id : <%=inb.getIncomeId()%><br> 
	Title : <%=inb.getTitle()%><br> 
	date : <%=inb.getDate()%><br>
	<%-- userId : <%=inb.getUserId() %><br>
Account Id : <%=inb.getAccountTypeId() %><br> --%>
	Account :	<%=inb.getAccountType()%><br> 
	Description :	<%=inb.getDescription()%><br>
	<%-- Status Id : <%=inb.getStatusId() %><br> --%>
	Status :	<%=inb.getStatusShow()%><br> 
	Ammount :	<%=inb.getAmmount()%>
	
	
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