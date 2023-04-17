<%@page import="com.expenses.project.bean.ExpenseBean"%>
<%@page import="com.expenses.project.bean.ChartExpenseBean"%>
<%@page import="java.util.List"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
												<h3 class="mb-0">${monthlyTransaction == null ? 0 : monthlyTransaction}</h3>
												<p class="text icon mdi ml-2 mb-0 font-weight-medium ratio">
													${monthlyTransactionRatio == null ? 0 : monthlyTransactionRatio}
												</p>
											</div>
										</div>
										<!-- 	<div class="col-3">
											<div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div>
										</div>  -->
									</div>
									<h6 class="text-muted font-weight-normal">This Month
										Transaction</h6>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-9">
											<div class="d-flex align-items-center align-self-start">
												<h3 class="mb-0">${monthlyExpense == null ? 0 : monthlyExpense}</h3>
												<p class="text icon mdi ml-2 mb-0 font-weight-medium ratio">${monthlyExpenseRatio == null ? 0 : monthlyExpenseRatio}</p>
											</div>
										</div>
										<!-- <div class="col-3">
											 <div class="icon icon-box-success">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div> 
										</div> -->
									</div>
									<h6 class="text-muted font-weight-normal">This Month
										Expenses</h6>
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
												<h3 class="mb-0">${monthlyIncome == null ? 0 : monthlyIncome}</h3>
												<p class="text icon mdi ml-2 mb-0 font-weight-medium  ratio">${monthlyIncomeRatio == null ? 0 : monthlyIncomeRatio}</p>
											</div>
										</div>
										<!-- 	<div class="col-3">
											 <div class="icon icon-box-danger">
												<span class="mdi mdi-arrow-bottom-left icon-item"></span>
											</div> 
										</div> -->
									</div>
									<h6 class="text-muted font-weight-normal">This Month
										Income</h6>
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
												<p class="text icon mdi  ml-2 mb-0 font-weight-medium ratio">${dailyExpenseRatio == null ? 0 : dailyExpenseRatio}</p>
											</div>
										</div>
										<!-- 	<div class="col-3">
											 <div class="icon icon-box-success ">
												<span class="mdi mdi-arrow-top-right icon-item"></span>
											</div> 
										</div> -->
									</div>
									<h6 class="text-muted font-weight-normal">Today Expenses</h6>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<%
						List<ExpenseBean> explist = (List<ExpenseBean>) request.getAttribute("explist");
						%>
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Expense History</h4>
									<!-- <p class="card-description"> Add class <code>.table</code>
                    </p> -->
									<div class="table-responsive"
										style="height: 250px; overflow: auto;">
										<!-- style="overflow-y: scroll; height: 250px;" -->
										<table class="table" id="list">
											<thead>
												<tr>
													<th style="color: white">Name</th>
													<th style="color: white">Amount</th>
													<th style="color: white">Date</th>
													<th style="color: white">Status</th>
												</tr>
											</thead>

											<tbody>


												<%
												/*  int k = 0; */
												for (ExpenseBean eb : explist) {
													/* k++;
													if (k == 4)
														break; */
												%>
												<tr>
													<td><%=eb.getTitle()%></td>
													<td><%=eb.getAmmount()%></td>
													<td><%=eb.getDate()%></td>
													<td><label class="badge  status" style="color: black"><%=eb.getStatusShow()%></label></td>
												</tr>
												<%
												}
												%>


											</tbody>
										</table>
									</div>
									<!-- To Hide ScrolBar -->
<style>
::-webkit-scrollbar {
	width: 0;
	height: 0;
}
</style>
								</div>
							</div>
						</div>

						<div class="col-lg-4 grid-margin stretch-card">

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
									<!-- 	<h4 class="card-title">Transaction History</h4>
									<canvas id="transaction-history"
										class="transaction-chart chartjs-render-monitor"
										style="display: block; height: 134px; width: 268px;"
										width="371" height="185"></canvas> -->
									<%
									List<ChartExpenseBean> pieStatus = (List<ChartExpenseBean>) request.getAttribute("pieStatus");
									%>

									<h4 class="card-title">Transaction Status</h4>
									<div>
										<canvas id="pieChart" class="chartjs-render-monitor"></canvas>
									</div>
									<script type="text/javascript">
							 
							 BGcolorArray= [
								  'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<%for (int i = 0; i < pieStatus.size(); i++) {%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<%for (int i = 0; i < pieStatus.size(); i++) {%>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx3 = document.getElementById('pieChart');
							
							 new Chart(ctx3, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for (ChartExpenseBean db : pieStatus) {%>
							       '<%=db.getStatus()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Transaction Status',
							       data: [ <%for (ChartExpenseBean db : pieStatus) {%>
							         <%=db.getTransaction()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Donut Chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script>
								</div>
							</div>
						</div>
					</div>





					<div class="row">

						<!--  <div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Bar chart</h4>
                    <canvas id="barChart" style="height: 224px; display: block; width: 449px;" width="622" height="310" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div> -->

						<div class="col-lg-9 grid-margin stretch-card">
							<div class="col-lg-12 card">
								<div class="col-lg-12 card-body">
									<!-- Bar Chart -->
									<div class="chartjs-size-monitor">
										<!--   -->
										<div class="chartjs-size-monitor-expand">
											<!--  -->
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<!--  -->
											<div class=""></div>
										</div>
									</div>
									<!-- Bar Chart -->
									<!-- <h4 class="card-title">Bar chart</h4>
									<canvas id="barChart"
										style="height: 224px; display: block; width: 449px;"
										width="622" height="310" ></canvas> -->
									<!-- class="chartjs-render-monitor" -->

									<%
									List<ChartExpenseBean> chartData = (List<ChartExpenseBean>) request.getAttribute("chartData");
									List<ChartExpenseBean> incoList = (List<ChartExpenseBean>) request.getAttribute("incoList");
									%>

									<h4 class="card-title">Every Month Expenses / Income</h4>
									<div>
										<canvas id="barChart" class="chartjs-render-monitor"></canvas>
									</div>

											<script>
												const ctx = document.getElementById('barChart').getContext('2d');
												const doubleBarChart = new Chart(ctx, {
													type: 'bar',
													data: {
			/* X-axis Name */						labels: [<%for (ChartExpenseBean cb : chartData) {%>
														'<%=cb.getMonth()%>', 
														<%}%>],
														datasets: [{
															label: ' Expense Ammount',
															data: [<%for (ChartExpenseBean cb : chartData) {%>
															'<%=cb.getExpenseAmmount()%>',
															<%}%>],
															backgroundColor: 'rgba(255, 99, 132, 0.2)',
															borderColor: 'rgba(255, 99, 132, 1)',
															borderWidth: 1
														}, {
															label: 'Income Ammount',
															data: [<%for (ChartExpenseBean il : incoList) {%>
															'<%=il.getIncomeAmount()%>',
															<%}%>],
															backgroundColor: 'rgba(54, 162, 235, 0.2)',
															borderColor: 'rgba(54, 162, 235, 1)',
															borderWidth: 1
														}]
													},
													options : {
														scales : {
													    	  x: {
														          ticks: {
														            color: 'white'
														          },
														          grid: {
														        	  color: 'rgba(255, 255, 255, 0.1)'
														          }
														        },
													    	    y: {
															          ticks: {
															            color: 'white'
															          },
															          grid: {
															        	  color: 'rgba(255, 255, 255, 0.1)'
															          }
															        }
													    	  }
													}
												});
									</script>
								</div>
							</div>
						</div>
						<!-- End of chart -->


<!-- Second Chart -->




</div>

						<div class="row">
							<div class="col-lg-6 grid-margin stretch-card">
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
										<h4 class="card-title">Category chart</h4>
										<div>
<!-- 										<canvas id="Horizontal" class="chartjs-render-monitor"></canvas>
									<script type="text/javascript">	
									var ctx4 = document.getElementById('Horizontal').getContext('2d');

									var chart = new Chart(ctx, {
									    type: 'bar',
									    data: {
									        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
									        datasets: [{
									            label: '# of Votes',
									            data: [12, 19, 3, 5, 2, 3, 7],
									            backgroundColor: 'rgba(54, 162, 235, 0.2)',
									            borderColor: 'rgba(54, 162, 235, 1)',
									            borderWidth: 1
									        }]
									    },
									    options: {
									        scales: {
									            x: {
									                ticks: {
									                    beginAtZero: true
									                }
									            }
									        }
									    }
									}); -->
<!-- 									<canvas id="horizontalChart" class="chartjs-render-monitor"></canvas>
<script type="text/javascript">    
    var ctx4 = document.getElementById('horizontalChart').getContext('2d');

    if (window.myChart) {
        window.myChart.destroy();
    }

    var chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3, 7],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                x: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        }
    });
</script> -->
<%	List<ChartExpenseBean> categData = (List<ChartExpenseBean>) request.getAttribute("categData");
%>

<canvas id="horizontalChart" class="chartjs-render-monitor"></canvas>
<script type="text/javascript">    
    var ctx4 = document.getElementById('horizontalChart').getContext('2d');

    if (window.myChart) {
        window.myChart.destroy();
    }

    var chart = new Chart(ctx4, { // Use ctx4 instead of ctx
        type: 'bar',
        data: {
            labels: [<%for (ChartExpenseBean cd : categData) {%>
			'<%=cd.getCategoryName()%>', 
			<%}%>],
            datasets: [{
                label: '# of Votes',
                data: [<%for (ChartExpenseBean cd : categData) {%>
    			'<%=cd.getTransaction()%>', 
    			<%}%>],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                x: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        }
    });
</script>
								
										
										
									</div>
									</div>
								</div>
							</div>

						</div>






						<div class="row">
							<div class="col-lg-6 grid-margin stretch-card">
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
										<h4 class="card-title">Area chart</h4>
										<canvas id="areaChart"
											style="height: 224px; display: block; width: 449px;"
											width="622" height="310" class="chartjs-render-monitor"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-6 grid-margin stretch-card">
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
										<h4 class="card-title">Doughnut chart</h4>
										<canvas id="doughnutChart"
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
		<!-- <script src="../../assets/js/chart.js"></script> -->
		<!-- End custom js for this page -->
	

	<script type="text/javascript">
		$(document).ready(function() {
			$('#lists').DataTable();
		});
		
		                 // For Id
/* 		const statusElement = document.getElementById('status');
		const statusElementValue = statusElement.textContent;

		if (statusElementValue === 'paid') {
		  statusElement.classList.add('badge-success');
		} else if (statusElementValue === 'partial paid') {
		  statusElement.classList.add('badge-warning');
		} else if (statusElementValue === 'unpaid') {
		  statusElement.classList.add('badge-danger');
		} else {
		  statusElement.classList.add('badge-info');
		} */
		
		// Ratio Data Class
		
/* 		 		const ratioElements = document.querySelectorAll('.ratio');
				
				ratioElements.forEach(ratioElement) => {
					
					const ratioElementValue = ratioElement.textContent;
					
					if (ratioElementValue < 0) {
					    ratioElement.classList.add('text-success','icon-box-success');
					    else{
					    	 ratioElement.classList.add('text-danger','icon-box-danger');
					    	}
					    }
					
				} */
				
				const ratioElements = document.querySelectorAll('.ratio');
				
				ratioElements.forEach((ratioElement) => {
				    const ratioElementValue = ratioElement.textContent;
				    if (ratioElementValue > 0) {
				        ratioElement.classList.add('text-success');
				    } else {
				        ratioElement.classList.add('text-danger');
				    }
				});
		                  // For Class
		const statusElements = document.querySelectorAll('.status');

		statusElements.forEach((statusElement) => {
		  const statusElementValue = statusElement.textContent;

		  if (statusElementValue === 'paid') {
		    statusElement.classList.add('badge-success');
		  } else if (statusElementValue === 'partial paid') {
		    statusElement.classList.add('badge-warning');
		  } else if (statusElementValue === 'unpaid') {
		    statusElement.classList.add('badge-danger');
		  } else {
		    statusElement.classList.add('badge-info');
		  }
		});
	</script>
</body>
</html>

<!-- Different Colours For Graph
										  BGcolorArray= [
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
									        'rgba(48, 30, 38, 0.2)',
									        'rgba(201, 203, 207, 0.2)'
									      ]
									  
									  bordderArray = [
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
									        'rgba(48, 30, 38, 0.2)',
									        'rgba(201, 203, 207, 1)'
									        ]
									
									bgColor = [];
									borderColor = [];
									
								<%-- 	<% for(int i = 0; i<chartData.size(); i++){%>
										bgColor.push(BGcolorArray[<%=i%>]);
									<%}%>
									
									<% for(int i=0; i<chartData.size(); i++){ %>
										borderColor.push(bordderArray[<%=i%>]);
									<%}%> --%>
 -->

<!-- <h1>Home</h1>

<a href = "newincome">Add your Income here</a><br><br>

<a href = "newexpense">Add your Expenses here</a><br><br>

<a href = "logout"> Log Out </a><br> -->

<!--  For Future  -->
<%--  <div class="col-lg-4 grid-margin stretch-card">
              
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
								<!-- 	<h4 class="card-title">Transaction History</h4>
									<canvas id="transaction-history"
										class="transaction-chart chartjs-render-monitor"
										style="display: block; height: 134px; width: 268px;"
										width="371" height="185"></canvas> -->
<%List<ChartExpenseBean> pieStatus = (List<ChartExpenseBean>)request.getAttribute("pieStatus"); %>										
										
										<h4 class="card-title" >Transaction Status</h4>
								<div>
									<canvas id="pieChart" class="chartjs-render-monitor"></canvas>
								</div>
							<script type="text/javascript">
							 
							 BGcolorArray= [
								  'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<% for(int i = 0; i<pieStatus.size(); i++){%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<% for(int i=0; i<pieStatus.size(); i++){ %>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx3 = document.getElementById('pieChart');
							
							 new Chart(ctx3, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for(ChartExpenseBean db : pieStatus){%>
							       '<%=db.getStatus()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Transaction Status',
							       data: [ <%for(ChartExpenseBean db : pieStatus){%>
							         <%=db.getTransaction()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Donut Chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script>
										
								</div>
							</div>
              
              
            			</div> --%>


