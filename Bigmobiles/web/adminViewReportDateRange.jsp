<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <head>
        <jsp:include page="admin-main-layout.jsp"></jsp:include>
        <title>REPORT (${dateRange})</title>

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
                            <li><a href="#"><i class="fa fa-bar-chart"></i> Report</a></li>
                            <li class="active">View</li>
                        </ol>
                    </section>





                    <section class="invoice">
                        <!-- title row -->
                        <div class="row">
                            <div class="col-xs-12">
                                <h2 class="page-header">
                                    <i class="fa fa-globe"></i> ElectronicsShop
                                    <small class="pull-right">Date: <fmt:formatDate value="<%= new java.util.Date()%>" pattern="dd/MM/yyyy"/></small>
                            </h2>
                        </div><!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="box-header">
                            <h3 class="box-title">DATE RANGE REPORT (${dateRange})</h3>
                        </div><!-- /.box-header --> 
                        <div class="col-sm-4 invoice-col">
                            <address>
                                <strong>ElectronicsShop</strong><br>
                                590 CMT8 Road, District 3, Ho Chi Minh City<br>
                                <b>Phone:</b> (098) 765-4321<br/>
                                <b>Email:</b> electronicsShop@email.com
                            </address>
                        </div><!-- /.col -->
                    </div>
                    <!-- Table row -->
                    <div class="row">
                        <div id="example1" class="col-xs-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Sale No.</th>
                                        <th>Customer Name</th>
                                        <th>Order Date</th>
                                        <th>Receiver</th>
                                        <th>Phone of Receiver</th>
                                        <!--<th>Status</th>-->
                                        <th>Profit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="e" items="${reportList}">
                                        <tr>
                                            <td>${e.orderID}</a></td>
                                            <td>${e.customerID.firstName} ${e.customerID.lastName}</td>
                                            <td><fmt:formatDate value="${e.orderDate}" pattern="dd-MM-yyyy" /></td>
                                            <td>${e.shipName}</td>
                                            <td>${e.shipPhone}</td>
<!--                                            <td>                                                       
                                                <c:if test="${e.processStatus eq 'Completed'}">
                                                    <span class="label label-success">${e.processStatus}</span>
                                                </c:if>
                                                <c:if test="${e.processStatus eq 'Shipping'}">
                                                    <span class="label label-info">${e.processStatus}</span>
                                                </c:if>
                                                <c:if test="${e.processStatus eq 'Pending'}">
                                                    <span class="label label-warning">${e.processStatus}</span>
                                                </c:if>
                                                <c:if test="${e.processStatus eq 'Canceled'}">
                                                    <span class="label label-danger">${e.processStatus}</span>
                                                </c:if>
                                            </td>-->
                                            <td>
                                                <c:choose>
                                                    <c:when test = "${e.processStatus eq 'Canceled'}">
                                                        $0
                                                    </c:when>
                                                    <c:otherwise>
                                                        $${e.total}
                                                    </c:otherwise>
                                                </c:choose>    
                                            </td>  
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div><!-- /.row -->

                    <div class="row">
                        <div class="col-xs-6">
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                    <h4 style="color: red"><b>Total Profit:</b> <span>$<fmt:formatNumber value="${totalProfit}" maxFractionDigits="0"/></span></h4>
                                    </tr>
                                </table>
                            </div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                        <div class="col-xs-12">
                            <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                        </div>
                    </div>
                </section>




                <!-- Main content -->
<!--                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">REPORT (${dateRange})</h3>
                                </div> /.box-header 
                                <div class="box-body">
                                    <div class="row invoice-info">
                                        <div class="col-sm-4 invoice-col">


                                        </div> /.col 
                                        <div class="col-sm-4 invoice-col">


                                        </div> /.col 
                                        <div class="col-sm-4 invoice-col">
                                            <h1 style="color: red">Total Profit : <span>$<fmt:formatNumber value="${totalProfit}" maxFractionDigits="0"/></span></h1>
                                        </div> /.col 
                                    </div> /.row 
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Sale No.</th>
                                                <th>Customer Name</th>
                                                <th>Order Date</th>
                                                <th>Receiver</th>
                                                <th>Phone of Receiver</th>
                                                <th>Status</th>
                                                <th>Profit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="e" items="${reportList}">
                                                <tr>
                                                    <td><a href="adminViewOrderDetails?orderid=${e.orderID}">${e.orderID}</a></td>
                                                    <td>${e.customerID.firstName} ${e.customerID.lastName}</td>
                                                    <td><fmt:formatDate value="${e.orderDate}" pattern="dd-MM-yyyy" /></td>
                                                    <td>${e.shipName}</td>
                                                    <td>${e.shipPhone}</td>
                                                    <td>                                                       
                                                        <c:if test="${e.processStatus eq 'Completed'}">
                                                            <span class="label label-success">${e.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${e.processStatus eq 'Shipping'}">
                                                            <span class="label label-info">${e.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${e.processStatus eq 'Pending'}">
                                                            <span class="label label-warning">${e.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${e.processStatus eq 'Canceled'}">
                                                            <span class="label label-danger">${e.processStatus}</span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test = "${e.processStatus eq 'Canceled'}">
                                                                $0
                                                            </c:when>
                                                            <c:otherwise>
                                                                $${e.total}
                                                            </c:otherwise>
                                                        </c:choose>    
                                                    </td>  
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <h2 class="page-header">
                                                        <i class="fa fa-globe"></i> ElectronicsShop
                                                        <small class="pull-right">Date: <fmt:formatDate value="<%= new java.util.Date()%>" pattern="dd/MM/yyyy"/></small>
                                                    </h2>
                                                    <h4 style="color: red">Total Profit : <span>$<fmt:formatNumber value="${totalProfit}" maxFractionDigits="0"/></span></h4>
                                                </td>   
                                            </tr>
                                        </tbody>
                                    </table>
                                </div> /.box-body 
                            </div> /.box 
                        </div> /.col 
                    </div> /.row 
                     Your Page Content Here 

                </section> /.content -->
            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script type="text/javascript">
            $(function () {
                $('#example1').DataTable({
                    "order": [[0, "desc"]],
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'excel', 'pdf', 'print'
                    ]
                });
            });
        </script>

    </body>
</html>
