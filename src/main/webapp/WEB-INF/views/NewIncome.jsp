<%@page import="java.util.Calendar"%>
<%@page import="com.expenses.project.bean.StatusBean"%>
<%@page import="com.expenses.project.bean.AccountBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | New Income</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>

<div class="container-scroller">
		<!-- Slidebar -->
	<%-- 	<jsp:include page="LeftSlideBar.jsp"></jsp:include> --%>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">



	<%
	List<AccountBean> acclist = (List<AccountBean>) request.getAttribute("acclist");
	List<StatusBean> stlist = (List<StatusBean>) request.getAttribute("stlist");
	%>

	<form action="saveincome" method="post">

		Title : <input type="text" name="title"> <br><br> 
		
		
		Account Type : <select name="accountTypeId">
			<% for (AccountBean ab : acclist) { %>
			<option value="<%=ab.getAccountTypeId()%>"><%=ab.getAccountType()%></option>
			<%}%>
		</select><br><br>
		
		 Status : <select name="statusId">
			<% for (StatusBean stb : stlist) {%>
			<option value="<%=stb.getStatusId()%>"><%=stb.getStatusShow()%></option>
			<%}%>
		</select><br><br>

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
			value="<%=y + "-" + mon + "-" + dt%>"><br><br> 
			
			Amount: <input type="text" name="ammount"> <br><br> 
			
			Description :
		<textarea rows="4" cols="15" name="description"></textarea><br><br> 
		
		<input type="submit" value="Save Income">

	</form><br>
	<a href="listincome">All Income</a>

</div>
<footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Vaibhav Adesara</span>
            </div>
          </footer>
				
			</div> <!-- Main Panel -->
		</div> <!-- container fluid -->
	</div> <!-- container scroller -->
	
	<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>




<%-- <form action="saveincome" method="post">

		Title : <input type="text" name="title"> <br><br> 
		
		
		Account Type : <select name="accountTypeId">
			<% for (AccountBean ab : acclist) { %>
			<option value="<%=ab.getAccountTypeId()%>"><%=ab.getAccountType()%></option>
			<%}%>
		</select><br><br>
		
		 Status : <select name="statusId">
			<% for (StatusBean stb : stlist) {%>
			<option value="<%=stb.getStatusId()%>"><%=stb.getStatusShow()%></option>
			<%}%>
		</select><br><br>

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
			value="<%=y + "-" + mon + "-" + dt%>"><br><br> 
			
			Amount: <input type="text" name="ammount"> <br><br> 
			
			Description :
		<textarea rows="4" cols="15" name="description"></textarea><br><br> 
		
		<input type="submit" value="Save Income">

	</form><br>
	<a href="listincome">All Income</a> --%>