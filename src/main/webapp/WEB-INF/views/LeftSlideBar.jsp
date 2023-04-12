<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo" style="color : white">Expense</a>
          <a class="sidebar-brand brand-logo-mini" style="color : white" >E</a>
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
            <a class="nav-link" href="admindashboard">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">Admin Dashboard</span>
            </a>
          </li>
          
          <li class="nav-item menu-items ">
            <a class="nav-link" href="listusers">
              <span class="menu-icon">
                <i class="mdi mdi-account-multiple"></i>
              </span>
              <span class="menu-title">Total Users</span>
            </a>
          </li>
          
          
       
          <li class="nav-item menu-items">
            <a class="nav-link" href="listcategories">
              <span class="menu-icon">
                <i class="mdi mdi-format-list-bulleted"></i>
              </span>
              <span class="menu-title">Category</span>
            </a>
          </li>
          
          <li class="nav-item menu-items">
            <a class="nav-link" href="listsubcategories">
              <span class="menu-icon">
                <i class="mdi mdi-file-tree"></i>
              </span>
              <span class="menu-title">Sub Category</span>
            </a>
          </li>
          
           <li class="nav-item menu-items">
            <a class="nav-link" href="listvendor">
              <span class="menu-icon">
                <i class="mdi mdi-account-network"></i>
              </span>
              <span class="menu-title">Vendor</span>
            </a>
          
          <li class="nav-item menu-items">
            <a class="nav-link" href="liststatus">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title">Status</span>
            </a>
          </li>
          
          <li class="nav-item menu-items">
            <a class="nav-link"  href="listaccount">
              <span class="menu-icon">
                <i class="mdi mdi-cash-usd"></i>
              </span>
              <span class="menu-title">Account</span>
            </a>
          </li>
          
          <li class="nav-item menu-items">
            <a class="nav-link"  href="allexpenses">
              <span class="menu-icon">
                <i class="mdi mdi-database"></i>
              </span>
              <span class="menu-title">Users Expenses</span>
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