<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="main-header">

    <!-- Logo -->
    <a href="adminViewDashBoard" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>Big Mobiles</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Big Mobiles</b>Shop</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">             
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="adminViewDashBoard" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="${sessionScope.LOGIN_ADMIN.avatar}" class="user-image"/>
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">${sessionScope.LOGIN_ADMIN.fullname}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="uploadDir/${sessionScope.LOGIN_ADMIN.avatar}" class="img-circle"/>
                            <p>
                                ${sessionScope.LOGIN_ADMIN.fullname} - Administrator
                                <small>Member since : ${sessionScope.LOGIN_ADMIN.createdDate}</small>
                            </p>
                        </li>                       
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="adminChangeProfile.jsp" class="btn btn-default btn-flat">Edit Your Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="logoutServlet" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>           
            </ul>
        </div>
    </nav>
</header>