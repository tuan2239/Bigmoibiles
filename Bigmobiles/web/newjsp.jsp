<%-- 
    Document   : newjsp
    Created on : Jun 2, 2019, 4:29:08 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body class="skin-blue sidebar-mini">
        <div class="wrapper">

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
                                    <i class="fa fa-globe"></i> Big Mobiles
                                    <small class="pull-right">Date: <fmt:formatDate value="<%= new java.util.Date()%>" pattern="dd/MM/yyyy"/></small>
                            </h2>
                        </div><!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="box-header">
                            <h3 class="box-title">Thang Steve REPORT (${dateRange})</h3>
                        </div><!-- /.box-header -->
                        <div class="col-sm-4 invoice-col">
                            <address>
                                <strong>Big Mobiles Shop</strong><br>
                                590 CMT8 Road, District 3, Ho Chi Minh City<br>
                                <b>Phone:</b> (098) 765-4321<br/>
                                <b>Email:</b> Bigmobile@email.com
                            </address>
                        </div><!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            <address>                      
                                <b>Account:</b> ${cus.email}<br/>
                                <b>Name:</b> ${cus.firstName} ${cus.lastName}<br/>
                                <b>ID:</b> ${cus.customerID}<br/>
                                <b>Phone:</b> ${cus.phone}<br/>
                                <b>Address:</b> ${cus.address}<br/>
                            </address>
                        </div> 
<!--                        <div class="col-sm-4 invoice-col">
                            <address>
                                <img src="${cus.avatar}" class="img-circle pull-right" width="100px" height="100px"/>
                            </address>
                        </div> -->
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
<!--                                        <th>Status</th>-->
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
                                    <h3 style="color: red"><b>Total Profit:</b> <span>$<fmt:formatNumber value="${totalProfit}" maxFractionDigits="0"/></span></h3>
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
                </section><!-- /.content -->

            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
       

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
