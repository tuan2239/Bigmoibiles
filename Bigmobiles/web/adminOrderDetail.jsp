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
            <title>Order Detail REPORT</title>

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
                                    <i class="fa fa-globe"></i> Order Information
                                    <small class="pull-right">Date: <fmt:formatDate value="<%= new java.util.Date()%>" pattern="dd/MM/yyyy"/></small>
                            </h2>
                        </div><!-- /.col -->
                    </div>
                    <!-- info row -->

                    <div class="row invoice-info">
                        <div  class="box-header">
                         
                            <h4 class="box-title " style="color: red"> <b>Order# &nbsp;&nbsp; ${odd.orderID}</b></h4>
                        </div><!-- /.box-header -->
                       
                        <div class="col-sm-4 invoice-col">
                            <address>
                                <strong>Full Name :&nbsp;&nbsp;${odd.customerID.fullName}</strong><br><br>
                                <b>Create Date :&nbsp;&nbsp; ${odd.createdDate}</b><br><br>
                                <b>Process Status :&nbsp;&nbsp; ${odd.processStatus}</b> <br/><br>
                                <b>Total :&nbsp;&nbsp; ${odd.total}</b><br>
                            </address>
                        </div><!-- /.col -->
                       <div class="col-sm-1 invoice-col"></div>
                        <div class="col-sm-4 invoice-col">
                            <address>                      
                                <strong>Recipient's Name :&nbsp;&nbsp; ${odd.shipName}</strong><br><br>
                                <b>Recipient's Phone :&nbsp;&nbsp;${odd.shipPhone}</b><br/><br>
                                <b>Recipient's Address :&nbsp;&nbsp; ${odd.shipAddress}</b><br/><br>
                                <b>Delivery Date :&nbsp;&nbsp; ${odd.shipDate}</b><br/><br>
                            </address>
                        </div> 
                        <div class="col-sm-1 invoice-col"></div>
                    </div>

                    <hr>
                    <!-- Table row -->
                    <div class="row">
                        <div id="example1" class="col-xs-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>                                                                         
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="c" items="${odddetail}" varStatus="index">
                                        <tr>
                                            <td>${index.index+1}</a></td>
                                            <td>${c.productID.productName}</a></td>
                                            <td>${c.productID.price}</td>
                                            <td>${c.quantity}</td>
                                            <td>${c.total}</td>                                          
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div><!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                        <div class="col-xs-12">
                            <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                        </div>
                    </div>
                </section><!-- /.content -->

            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script type="text/javascript">
            $(function() {
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
