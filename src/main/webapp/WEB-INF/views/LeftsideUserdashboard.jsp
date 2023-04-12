<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <p class="sidebar-brand brand-logo" style="color : white">Expense</p>
          <p class="sidebar-brand brand-logo-mini" style="color : white" >E</p>
        </div>
        <ul class="nav">
          <li class="nav-item profile">
            <div class="profile-desc">
              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="${user.imageUrl}" alt="">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal">${user.firstName}</h5>
                </div>
              </div>
             
            </div>
          </li>
          
          <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
          </li>
          
          <li class="nav-item menu-items active">
            <a class="nav-link" href="home">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">User Dashboard</span>
            </a>
          </li>
       
          <li class="nav-item menu-items">
            <a class="nav-link" href="newexpense">
              <span class="menu-icon">
                <i class="mdi mdi-currency-inr"></i>
              </span>
              <span class="menu-title">Add Expenses</span>
            </a>
          </li>
          
          <li class="nav-item menu-items">
            <a class="nav-link" href="newincome">
              <span class="menu-icon">
                <i class="mdi mdi-table-large"></i>
              </span>
              <span class="menu-title">Add Your Income</span>
            </a>
          </li>
          
        
          
      <li class="nav-item menu-items">
            <a class="nav-link" href="listexpense">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title">Your Expenses</span>
            </a>
          </li> 
          
           <li class="nav-item menu-items">
            <a class="nav-link" href="listincome">
              <span class="menu-icon">
                <i class="mdi mdi-wallet-travel"></i>
              </span>
              <span class="menu-title">Your Income</span>
            </a>
          </li>
        
          
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <span class="menu-icon">
                <i class="mdi mdi-security"></i>
              </span>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
              <!--   <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li> -->
                <li class="nav-item"> <a class="nav-link" href="logout"> Log Out </a></li>
                <li class="nav-item"> <a class="nav-link" href="signup"> SignUp </a></li>
                
                
              </ul>
            </div>
          </li>
          
        </ul>
      </nav>