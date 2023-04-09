<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>expense Manager | Edit Profile</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

<!-- 	<h2>Edit Profile</h2> -->
	
		<div class="container-scroller">
		<!-- Slidebar -->
		<%--  <jsp:include page="LeftSlideBar.jsp"></jsp:include>  --%>
		<!-- navbar -->
		<div class="container-fluid page-body-wrapper">

			<jsp:include page="Navbar.jsp"></jsp:include>
			<!-- maincontent -->

			<div class="main-panel">
				<div class="content-wrapper">
	

 <!-- Header Page -->
<div class="page-header">
              <h3 class="page-title"> Profile </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
<!-- Very HelpFull --><li class="breadcrumb-item"><a href="${pageContext.request.getHeader('referer')}">Your Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Profile</li>
                </ol>
              </nav>
            </div>
 <!-- Header Page End -->

<!-- Row Start -->
<div class="row">

<div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="border-bottom text-center pb-4">
                          <img src="${user.imageUrl}" alt="profile" class="img-lg rounded-circle mb-3">
                         <!--  <p> </p> -->
                          <div class="d-flex justify-content-between">
                            
                         <!--    <button class="btn btn-success">Follow</button> -->
                          </div>
                        </div>
                        
                        
                        <div class="py-4">
                          <p class="clearfix">
                            <span class="float-left"> Status </span>
                            <span class="float-right text-muted"> Active </span>
                          </p>
                          <p class="clearfix">
                            <span class="float-left"> Phone </span>
                            <span class="float-right text-muted"> ${user.contactNum} </span>
                          </p>
                          <p class="clearfix">
                            <span class="float-left"> Mail </span>
                            <span class="float-right text-muted"> ${user.email} </span>
                          </p>
                          <p class="clearfix">
                            <span class="float-left"> Date of Birth </span>
                            <span class="float-right text-muted">
                              ${user.dob}
                            </span>
                          </p>
                          <p class="clearfix">
                            <span class="float-left"> gender </span>
                            <span class="float-right text-muted">
                              <span>${user.gender}</span>
                            </span>
                          </p>
                            <div class="mt-4 py-2 border-top border-bottom">
                          <ul class="nav profile-navbar">
                            <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="mdi mdi-account-outline"></i> Info </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link active" href="#">
                                <i class="mdi mdi-newspaper"></i> Feed </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="mdi mdi-calendar"></i> Agenda </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">
                                <i class="mdi mdi-attachment"></i> Resume </a>
                            </li>
                          </ul>
                        </div>
                        </div>
                        <!-- <button class="btn btn-primary btn-block">Preview</button> -->
                      </div>
                      
                      <div class="col-lg-8">
                        <div class="d-flex justify-content-between">
                          <div>
                            <h3>${user.firstName}  </h3>
                            <div class="d-flex align-items-center">
                              <h5 class="mb-0 me-2 text-muted">Role: ${user.role == 1 ? "Admin" : "User"}</h5>
                              <!-- <div class="br-wrapper br-theme-css-stars"><select id="profile-rating" name="rating" autocomplete="off" style="display: none;">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                              </select><div class="br-widget"><a href="#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"></a><a href="#" data-rating-value="2" data-rating-text="2" class=""></a><a href="#" data-rating-value="3" data-rating-text="3" class=""></a><a href="#" data-rating-value="4" data-rating-text="4" class=""></a><a href="#" data-rating-value="5" data-rating-text="5" class=""></a></div></div> -->
                            </div>
                          </div>
                          
                        </div>
                      
                        <div class="border-bottom text-center pb-4"></div>
                        <div class = "profile-feed"><br>
                        <form action="saveprofilepic" method = "post" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="${user.userId}" >
                        	
                        	<!--  uplode Profile Pic:<input type="file" name = "profileImg" class="form-control"> 
                        	<br> -->
                        	
                         	<div class="input-group col-xs-8">
                          <input type="file" class="form-control file-upload-info" name = "profileImg"  placeholder="Upload Image">
                          <span class="input-group-append">
                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                          </span>
                        </div><br>
                        
                        <div class="input-group col-xs-8">
									<label>First Name *</label> <input type="text"
										class="form-control p_input" value="${user.firstName}" name="firstName" id="firstName">
									<span id="firstNameError" class="error"></span>
								</div> <br>
                        
                        <div class="input-group col-xs-8">
									<label>Last Name *</label> <input type="text"
										class="form-control p_input" value="${user.lastName }" name="lastName" id="firstName">
									<span id="firstNameError" class="error"></span>
								</div><br>
                         
                                 <div class="input-group col-xs-8">
									<label>Email *</label> <input type="text"
										class="form-control p_input" value="${user.email }" name="email" id="email">
									<span id="firstNameError" class="error"></span>
								</div><br>
								
								<div class="input-group col-xs-8">
									<label>Dob *</label> <input type="date"
										class="form-control p_input" value="${user.dob }" name="dob" id="email">
									<span id="firstNameError" class="error"></span>
								</div><br>
								
								<div class="input-group col-xs-8">
									<label>Contact Num *</label> <input type="text"
										class="form-control p_input" value="${user.contactNum }" name="contactNum" id="email">
									<span id="firstNameError" class="error"></span>
								</div><br>
                         
                        	<div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                    
                    
                    
                    
                        </form>
                        
                        </div>
                        
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>

</div> <!-- Row End -->
</div>
<footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2023 <a href="https://wordpress-923989-3206731.cloudwaysapps.com/" target="_blank"> Vaibhav Adesara</a>. All rights reserved.</span>
              <span class="text-muted float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
            </div>
          </footer>
          
          </div>
          </div>
          </div>


<jsp:include page="AllJavascript.jsp"></jsp:include>

</body>
</html>