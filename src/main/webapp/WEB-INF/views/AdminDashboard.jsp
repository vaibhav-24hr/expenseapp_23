<%@page import="com.expenses.project.bean.ChartExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ExpenseManager | Admin Dashboard</title>
<!-- plugins:css -->
<jsp:include page="AllCss.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="path/to/chartjs/dist/chart.umd.js"></script>
<script type="text/javascript">https://cdnjs.com/libraries/Chart.js</script> -->

<style type="text/css">
.error {
	color: red;
}
</style>

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
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${NumberOfUsers == null ? 0 : NumberOfUsers}</h3>
												<p class=" ml-2 mb-0 font-weight-medium  mdi" id="user">${ratioUsersMonthly == null ? 0 : ratioUsersMonthly}</p>
											</div>
										</div>
										<div class="col-3">
											<!-- <span id="user"></span> -->
											<!-- <div class="icon icon-box-success " id ="arrow">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div> -->
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">This Month Users
									</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${NumberOfMonthlyExpenses == null ? 0 : NumberOfMonthlyExpenses}</h3>
												<p class=" ml-2 mb-0 font-weight-medium mdi"
													id="ratioTransaction">
													<!-- <span id="ratioTransaction" class="{{ ratioTransaction >= 0 ? 'text-success' : 'text-danger' }}"> -->${ratioTransactionMonthly}<!-- </span> -->
												</p>
											</div>
										</div>
										<div class="col-3">
											<!--  <div class="icon icon-box-success" id ="arrow">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>  -->
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">This Month
										Transactiones</h6>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<!-- Expression Language Condition if not NULL -->
												<h3 class="mb-0">${TodayExpense == null ? 0 : TodayExpense}</h3>
												<p class=" ml-2 mb-0 font-weight-medium  " id="ratio">${ratioExpenseDaily == null ? 0 : ratioExpenseDaily}</p>
											</div>
										</div>
										<div class="col-3" id="arrow">
											<!--  <div class="icon icon-box-success">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>  -->
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Today Expenses
										Ammount</h6>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${MonthlyExpense == null ? 0 : MonthlyExpense}</h3>
												<p class="  ml-2 mb-0 font-weight-medium " id="ratioMonthly">${ratioExpenseMonthly == null ? 0 : ratioExpenseMonthly}</p>
											</div>
										</div>
										<div class="col-3">
											<!--  <div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>  -->
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">This Month
										Expense Ammount</h6>
								</div>
							</div>
						</div>
					</div>
					<!-- Row or Data End -->

					<!-- 2nd Row Start -->

					<div class="row" align="center">
						<div class="col-md-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<h4 class="card-title">Transaction History</h4>
									<canvas id="transaction-history"
										class="transaction-chart chartjs-render-monitor"
										style="display: block; height: 134px; width: 268px;"
										width="371" height="185"></canvas>
									<div
										class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
										<div class="text-md-center text-xl-left">
											<h6 class="mb-1">Transfer to Paypal</h6>
											<p class="text-muted mb-0">07 Jan 2019, 09:12AM</p>
										</div>
										<div
											class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
											<h6 class="font-weight-bold mb-0">$236</h6>
										</div>
									</div>
									<div
										class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
										<div class="text-md-center text-xl-left">
											<h6 class="mb-1">Tranfer to Stripe</h6>
											<p class="text-muted mb-0">07 Jan 2019, 09:12AM</p>
										</div>
										<div
											class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
											<h6 class="font-weight-bold mb-0">$593</h6>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<!-- Bar Chart -->
									<div class="chartjs-size-monitor"> <!--   -->
										<div class="chartjs-size-monitor-expand"> <!--  -->
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink"> <!--  -->
											<div class=""></div>
										</div>
									</div>
									<!-- Bar Chart -->
									<!-- <h4 class="card-title">Bar chart</h4>
									<canvas id="barChart"
										style="height: 224px; display: block; width: 449px;"
										width="622" height="310" ></canvas> --> <!-- class="chartjs-render-monitor" -->

<% 
List<ChartExpenseBean> chartData = (List<ChartExpenseBean>)request.getAttribute("chartData"); 
%>

								<h4 class="card-title" >Bar chart</h4>
								<div>
									<canvas id="barChart" class="chartjs-render-monitor"></canvas>
								</div>

									<script>
									
									  BGcolorArray= [
										    'rgba(201, 203, 207, 0.2)',
										    'rgba(255, 99, 132, 0.2)',
									        'rgba(54, 162, 235, 0.2)',
									        'rgba(255, 206, 86, 0.2)',
									        'rgba(75, 192, 192, 0.2)',
									        'rgba(153, 102, 255, 0.2)',
									        'rgba(255, 159, 64, 0.2)',
									        'rgba(48, 51, 204, 0.2)',
									        'rgba(50, 200, 204, 0.2)',
									        'rgba(189, 129, 46, 0.2)',
									        'rgba(122, 124, 129, 0.2',
									        'rgba(48, 30, 38, 0.2)'
									      ]
									  
									  bordderArray = ['rgba(201, 203, 207, 1)',
										    'rgba(255, 99, 132, 1)',
									        'rgba(54, 162, 235, 1)',
									        'rgba(255, 206, 86, 1)',
									        'rgba(75, 192, 192, 1)',
									        'rgba(153, 102, 255, 1)',
									        'rgba(255, 159, 64, 1)',
									        'rgba(48, 51, 204, 0.2)',
									        'rgba(50, 200, 204, 0.2)',
									        'rgba(189, 129, 46, 0.2)',
									        'rgba(122, 124, 129, 0.2',
									        'rgba(48, 30, 38, 0.2)'
									        ]
									
									bgColor = [];
									borderColor = [];
									
									<% for(int i = 0; i<chartData.size(); i++){%>
										bgColor.push(BGcolorArray[<%=i%>]);
									<%}%>
									
									<% for(int i=0; i<chartData.size(); i++){ %>
										borderColor.push(bordderArray[<%=i%>]);
									<%}%>
									
										const ctx = document
												.getElementById('barChart');

										new Chart(
												ctx,
												{
													type : 'bar',
													data : {
														
														labels : [ 
															<% for(ChartExpenseBean cb : chartData) {%>
														'<%=cb.getMonth()%>', 
																<%}%>
																],
																
																
														datasets : [ {
															label : '# Expense Ammount',
															data : [
																<%for(ChartExpenseBean cb : chartData){%>
																'<%=cb.getExpenseAmmount()%>',
																	<%}%>
																	],
																	  backgroundColor: bgColor
																	       
																	      ,
																	      borderColor: borderColor
																	    	 
																	        ,
															borderWidth : 1
															
														} ]
													},
													options : {
														scales : {
															y : {
																beginAtZero : true
															}
														}
													}
												});
									</script>




								</div>
							</div>
						</div>




					</div>

					<!-- 2nd Row End -->
					<div class="row">

						<div class="col-lg-7 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<!-- Line Chart -->
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>
									<h4 class="card-title">Line chart</h4>
									<canvas id="lineChart"
										style="height: 224px; display: block; width: 449px;"
										width="622" height="310" class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>



					</div>



				</div>
				<!-- Content Wrapper -->

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
	<!-- Custom js for this page -->
<!-- 	<script src="../../assets/js/chart.js"></script> -->
	<!-- End custom js for this page -->
	<script type="text/javascript">
		// Today Expense Colour
		ratioElement = document.getElementById('ratio');
		ratioValue = ratioElement.textContent.trim();

		ratioElement.textContent = ratioValue;

		if (ratioValue > 0) {
			ratioElement.classList.add('text-success', 'icon-box-success',
					'mdi-arrow-top-right');
		} else {
			ratioElement.classList.add('text-danger', 'icon-box-danger',
					'mdi-arrow-bottom-left');
		}

		// No Of Users colour validation
		userElmment = document.getElementById('user');
		userValue = userElmment.textContent.trim();
		user.textContent = userValue;

		if (userValue > 0) {
			userElmment.classList.add('text-success', 'icon-box-success',
					'mdi-arrow-top-right');
		} else {
			userElmment.classList.add('text-danger', 'icon-box-danger',
					'mdi-arrow-bottom-left');
		}

		// No of Transaction

		ratioTransactionElement = document.getElementById('ratioTransaction');
		ratioTransactionValue = ratioTransactionElement.textContent.trim();
		ratioTransactionValue = ratioTransaction.textContent;

		if (ratioTransactionValue > 0) {
			ratioTransactionElement.classList.add('text-success',
					'icon-box-success', 'mdi-arrow-top-right');
		} else {
			ratioTransactionElement.classList.add('text-danger',
					'icon-box-danger', 'mdi-arrow-bottom-left');
		}

		// Monyhly Expense
		ratioMonthly
		ratioMonthlyElement = document.getElementById('ratioMonthly');
		ratioMonthlyValue = ratioMonthly.textContent.trim();
		ratioMonthlyValue = ratioMonthly.textContent;

		if (ratioMonthlyValue > 0) {
			ratioMonthlyElement.classList.add('text-success',
					'icon-box-success', 'mdi-arrow-top-right');
		} else {
			ratioMonthlyElement.classList.add('text-danger', 'icon-box-danger',
					'mdi-arrow-bottom-left');
		}
	</script>


</body>
</html>





<!-- <a href = "newcategory" > Add New Category </a><br><br>
<a href = "listcategories" > Display All Category </a> <br> <br>
<a href = "newsubcategory" > Add Sub Category </a><br> <br>
<a href = "newstatus">Status of Expenses</a><br> <br>
<a href = "newvendor"> Add Vendor </a><br> <br>
<a href = "listvendor"> Display All Vendors </a><br> <br>
<a href = "newaccount"> Add Account Type </a><br> <br>
<a href = "listaccount"> List All Account </a><br> <br>
<a href = "logout"> Log Out </a> -->