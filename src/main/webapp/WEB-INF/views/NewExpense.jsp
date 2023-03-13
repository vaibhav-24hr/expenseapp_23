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
<meta charset="ISO-8859-1">
<title>ExpenseApp | Add your Expenses</title>
</head>
<body>

	<%
	List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	List<SubCategoryBean> sublist = (List<SubCategoryBean>) request.getAttribute("sublist");
	List<AccountBean> acclist = (List<AccountBean>) request.getAttribute("acclist");
	List<StatusBean> stlist = (List<StatusBean>)request.getAttribute("stlist");
	List<VendorBean> vdlist = (List<VendorBean>)request.getAttribute("vdlist");
	%>

	<h2>Add Your Expenses Below</h2>

	<form action="saveexpense" method="post">
	
		Title: <input type="text" name="title">
		<br><br>
	    
	    
	    
	    Vendor:  <select name="vendorId">
	    <%for(VendorBean vb : vdlist){ %>
	    
	    <option value = "<%=vb.getVendorId() %>" >
	    	<%=vb.getVendorName() %></option>
	    	<%}%>
	    	
	    </select>
	    <br><br>
	    
	    
	    
		Category: <select name="categoryId">
			<%
			for (CategoryBean cb : list) {
			%>

			<option value="<%=cb.getCategoryId()%>">
				<%=cb.getCategoryName()%></option>
			<%}%>
		</select>
		<br><br>
		
		
	 	Sub Category : <select name = "subCategoryId">
		<% for (SubCategoryBean sb : sublist){ %>
		<option value = "<%=sb.getSubCategoryId() %>" >
			<%=sb.getSubCategoryName() %></option>
			<%} %>
		</select>
		 <br><br> 
		 
		Account: <select name="accountTypeId">
			<%
			for (AccountBean acb : acclist) {
			%>

			<option value="<%=acb.getAccountTypeId()%>">
				<%=acb.getAccountType()%></option>

			<%}%>
			</select>
			<br><br>

		
		Status: <select name = "statusId">
		<%
			for(StatusBean stb : stlist){
		%>
		<option value = "<%=stb.getStatusId() %>" >
		<%=stb.getStatusShow() %>
		</option>
		<%} %>
		</select>
		<br><br>
		
		Amount: <input type ="text" name = "ammount"> 
		<br><br>
		
		<%
						Calendar c = Calendar.getInstance(); 
						int d = c.get(c.DAY_OF_MONTH); //07 
						int m = c.get(c.MONTH)+1;//03
						String mon = "";
						String dt = "";
						if(m<=9){
							mon = 0+""+m; 
						}else{
							mon = m+"";
						}
						if(d <= 9){
							dt = 0+""+d;
						}else{
							dt = d+"";
						}
						int y = c.get(c.YEAR);//2023 
						System.out.println(y+"-"+m+"-"+d);
					%>
		
		Date :  <input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>
			
		
		
		Description:
		<textarea rows="5" cols="15" name = "description"></textarea>
		<br><br>
		
		<input type="submit">
	</form>
	<br><br>
	<a href="listexpense">Show all your Expenses</a>

</body>
</html>