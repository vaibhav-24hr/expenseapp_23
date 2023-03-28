<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<title>Home Page</title>
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

					<div class="row">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${monthlyTransaction}</h3>
												 <p class="text-success ml-2 mb-0 font-weight-medium">+3.5%  </p>
											</div>
										</div>
									 	<div class="col-3">
											<div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>
										</div> 
									</div>
									<h6 class="text-muted font-weight-normal">This Month Transaction</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${monthlyExpense}</h3>
												 <p class="text-success ml-2 mb-0 font-weight-medium">+11%</p> 
											</div>
										</div>
										<div class="col-3">
											 <div class="icon icon-box-success">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div> 
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">This Month Expenses</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
<!-- Expression Language Condition if not NULL --><h3 class="mb-0">${monthlyIncome == null ? 0 : monthlyIncome}</h3>
												 <p class="text-danger ml-2 mb-0 font-weight-medium">-2.4%</p> 
											</div>
										</div>
										<div class="col-3">
											 <div class="icon icon-box-danger">
												<span class="mdi mdi-arrow-bottom-left icon-item"></span>
											</div> 
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">This Month Income</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${dailyExpense == null ? 0 : dailyExpense}</h3>
												 <p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p> 
											</div>
										</div>
										<div class="col-3">
											 <div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div> 
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Today Expenses</h6>
								</div>
							</div>
						</div>
					</div>

<div class="row">
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Line chart</h4>
                    <canvas id="lineChart" style="height: 224px; display: block; width: 449px;" width="622" height="310" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Bar chart</h4>
                    <canvas id="barChart" style="height: 224px; display: block; width: 449px;" width="622" height="310" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Area chart</h4>
                    <canvas id="areaChart" style="height: 224px; display: block; width: 449px;" width="622" height="310" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Doughnut chart</h4>
                    <canvas id="doughnutChart" style="height: 224px; display: block; width: 449px;" width="622" height="310" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
            </div>


</div> <!-- Content Wrapper -->
				
				<footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Vaibhav Adesara</span>
            </div>
          </footer>
				
			</div> <!-- Main Panel -->
		</div> <!-- container fluid -->
	</div> <!-- container scroller -->
	
	<jsp:include page="AllJavascript.jsp"></jsp:include>
	    <!-- Custom js for this page -->
    <script src="../../assets/js/chart.js"></script>
    <!-- End custom js for this page -->

</body>
</html>



<!-- <h1>Home</h1>

<a href = "newincome">Add your Income here</a><br><br>

<a href = "newexpense">Add your Expenses here</a><br><br>

<a href = "logout"> Log Out </a><br> -->