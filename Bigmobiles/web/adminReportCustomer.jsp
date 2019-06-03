<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <head>
        <jsp:include page="admin-main-layout.jsp"></jsp:include>
            <title>Report</title>



        </head>
        <!--
        BODY TAG OPTIONS:
        =================
        Apply one or more of the following classes to get the
        desired effect
        |---------------------------------------------------------|
        | SKINS         | skin-blue                               |
        |               | skin-black                              |
        |               | skin-purple                             |
        |               | skin-yellow                             |
        |               | skin-red                                |
        |               | skin-green                              |
        |---------------------------------------------------------|
        |LAYOUT OPTIONS | fixed                                   |
        |               | layout-boxed                            |
        |               | layout-top-nav                          |
        |               | sidebar-collapse                        |
        |               | sidebar-mini                            |
        |---------------------------------------------------------|
        -->
        <body class="skin-blue sidebar-mini">
      
        <div class="wrapper">

            <!-- Main Header -->
            <jsp:include page="admin-main-header.jsp"></jsp:include>
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="admin-main-sidebar.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Report                        
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-bar-chart"></i>Report</a></li>
                            <li class="active">Create</li>
                        </ol>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="example-modal">
                            <div class="modal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="adminReportCustomer" method="post">
                                            <div class="modal-header">                                           
                                                <h4 class="modal-title">Customer Report</h4>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Date range -->
                                             
                                                <div class="form-group">
                                                    <label>Choose a Customer</label>
                                                    <select class="form-control" name="customerID" required="true">
                                                        <c:forEach var="b" items="${cusList}">
                                                        <option value="${b.customerID}">${b.fullName}/${b.email}</option>
                                                    </c:forEach>                                                                                    
                                                </select>
                                            </div>                                                   
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Get Report</button>
                                        </div>
                                    </form>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </div><!-- /.example-modal -->
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div><!-- ./wrapper -->   

    
    </body>
</html>

