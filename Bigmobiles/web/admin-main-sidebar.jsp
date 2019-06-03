<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="uploadDir/${sessionScope.LOGIN_ADMIN.avatar}" class="img-circle"/>               
            </div>
            <div class="pull-left info">
                <p>${sessionScope.LOGIN_ADMIN.fullname}</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <!-- Optionally, you can add icons to the links -->
            <li><a href="adminViewDashBoard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>         
            <li><a href="listAdminServlet"><i class="fa fa-dashboard"></i><span></span>List Admin</a></li>
            <li><a href="listCustomerServlet"><i class="fa fa-dashboard"></i> <span>Manage Customers</span></a></li> 
            <li><a href="AdminManageOrderServlet"><i class="fa fa-dashboard"></i> <span>Manage Order</span></a></li>

            <li><a href="AdminFeedbackServlet"><i class="fa fa-dashboard"></i> <span>Manage Feedback</span></a></li>
            <li>
                <a href="#"><i class="fa fa-bar-chart"></i> <span>Chart</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="ChartCategoryServlet"><i class="fa fa-dashboard"></i> <span>Chart Category</span></a></li>
                    <li><a href="CharBrandServlet"><i class="fa fa-dashboard"></i> <span>Chart Brand</span></a></li>
                    <li><a href="ChartCustomerServlet"><i class="fa fa-dashboard"></i> <span>Chart Customer</span></a></li>
                </ul>
            </li>
                 <li>
                <a href="#"><i class="fa fa-archive"></i> <span>Category</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="AdminShowCategory"><i class="fa fa-circle-o"></i>View</a></li>
                    <li><a href="adminAddCategory.jsp"><i class="fa fa-circle-o"></i>Create</a></li>
                </ul>
            </li>
                 <li>
                <a href="#"><i class="fa fa-archive"></i> <span>Brand</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="AdminShowBrand"><i class="fa fa-circle-o"></i>View</a></li>
                    <li><a href="adminAddBrand.jsp"><i class="fa fa-circle-o"></i>Create</a></li>
                </ul>
            </li>
              <li>
                <a href="#"><i class="fa fa-archive"></i> <span>Products</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="AdminShowProduct"><i class="fa fa-circle-o"></i>View</a></li>
                    <li><a href="AdminShowCombo"><i class="fa fa-circle-o"></i>Create</a></li>
                </ul>
            </li>
            <li><a href="adminReportCustomer"><i class="fa fa-dashboard"></i> <span>aaaaaaaaaa</span></a></li>
            <li class="header">RETURN</li>
            <li><a href="ProductServlet"><i class="fa fa-circle-o text-blue"></i> <span>Big Mobiles</span></a></li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>