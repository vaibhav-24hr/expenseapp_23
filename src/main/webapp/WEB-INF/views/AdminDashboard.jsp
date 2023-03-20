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
												<h3 class="mb-0">$12.34</h3>
												<p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p>
											</div>
										</div>
										<div class="col-3">
											<div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Potential growth</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">$17.34</h3>
												<p class="text-success ml-2 mb-0 font-weight-medium">+11%</p>
											</div>
										</div>
										<div class="col-3">
											<div class="icon icon-box-success">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Revenue current</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">$12.34</h3>
												<p class="text-danger ml-2 mb-0 font-weight-medium">-2.4%</p>
											</div>
										</div>
										<div class="col-3">
											<div class="icon icon-box-danger">
												<span class="mdi mdi-arrow-bottom-left icon-item"></span>
											</div>
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Daily Income</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">$31.53</h3>
												<p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p>
											</div>
										</div>
										<div class="col-3">
											<div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>
										</div>
									</div>
									<h6 class="text-muted font-weight-normal">Expense current</h6>
								</div>
							</div>
						</div>
					</div>  <!-- Row or Data End -->

<!-- 2nd Row Start -->
	
	<div class="row" align="center" >
              <div class="col-md-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Transaction History</h4>
                    <canvas id="transaction-history" class="transaction-chart chartjs-render-monitor" style="display: block; height: 134px; width: 268px;" width="371" height="185"></canvas>
                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">Transfer to Paypal</h6>
                        <p class="text-muted mb-0">07 Jan 2019, 09:12AM</p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">$236</h6>
                      </div>
                    </div>
                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">Tranfer to Stripe</h6>
                        <p class="text-muted mb-0">07 Jan 2019, 09:12AM</p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">$593</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		
<!-- 2nd Row End -->


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