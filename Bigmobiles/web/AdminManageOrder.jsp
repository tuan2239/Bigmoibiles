<%-- 
    Document   : AdminManageOrder
    Created on : May 31, 2019, 8:06:23 PM
    Author     : congm
--%>


<%-- 
    Document   : listADMIN
    Created on : May 26, 2019, 12:31:06 PM
    Author     : An
--%>

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
            <title>Customer Account</title>
            <style>
                .not-active {
                    pointer-events: none;
                    cursor: default;
                    text-decoration: none;
                    color: black;
                }
                .button {
                    background-color: #4CAF50; /* Green */
                    border-radius: 30%;
                    color: white;
                    padding: 5px 5px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 12px;
                    margin: 4px 2px;
                    -webkit-transition-duration: 0.4s; /* Safari */
                    transition-duration: 0.4s;
                    cursor: pointer;
                }

                .button1 {
                    background-color: white; 
                    color: green; 
                    border: 2px solid #4CAF50;
                }

                .button1:hover {
                    background-color: #4CAF50;
                    color: white;
                }

                .button2 {
                    background-color: white; 
                    color: black; 
                    border: 2px solid #008CBA;
                }

                .button2:hover {
                    background-color: #008CBA;
                    color: white;
                }

                .button3 {
                    background-color: white; 
                    color: red; 
                    border: 2px solid #f44336;
                }

                .button3:hover {
                    background-color: #f44336;
                    color: white;
                }

                .button4 {
                    background-color: white;
                    color: orange;
                    border: 2px solid orange;
                }

                .button4:hover {background-color: orange;}

                .button5 {
                    background-color: white;
                    color: black;
                    border: 2px solid #555555;
                }

                .button5:hover {
                    background-color: #555555;
                    color: white;
                }
            </style>
        </head>

        <body class="skin-blue sidebar-mini">
            <div class="wrapper">

                <!-- Main Header -->
            <jsp:include page="admin-main-header.jsp"></jsp:include>

            <jsp:include page="admin-main-sidebar.jsp"></jsp:include>
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            List oder
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-users"></i> List Admin</a></li>
                            <li class="active">View</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box-body">
                                        <table id="example" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Customer</th>
                                                    <th>Create Date</th>
                                                    <th>Total</th>
                                                    <th>Ship Phone</th>                                                                                                     
                                                    <th>Process Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="c" items="${listorder}" varStatus="index">
                                                <tr class="contentPage">
                                                    <td>${index.index+1}</td>
                                                    <td>${c.customerID.fullName}</td>
                                                    <td>${c.createdDate}</td>
                                                    <td>${c.total}</td>
                                                    <td>${c.shipPhone}</td>
                                                    <td>                                                       
                                                        <c:if test="${c.processStatus eq 'Completed'}">
                                                            <span class="badge badge-success">${c.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${c.processStatus eq 'Shipping'}">
                                                            <span class="badge badge-warning">${c.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${c.processStatus eq 'Pending'}">
                                                            <span class="badge badge-info">${c.processStatus}</span>
                                                        </c:if>
                                                        <c:if test="${c.processStatus eq 'Canceled'}">
                                                            <span class="badge badge-danger">${c.processStatus}</span>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <c:if test="${c.processStatus eq 'Completed'}">
                                                                <a href="adminViewOrderDetails?oderID=${c.orderID}" class="button button1">Details</a>
                                                            </c:if>
                                                            <c:if test="${c.processStatus eq 'Shipping'}">                                                                                                                                                                              
                                                                <a class="button button2" href="AdminEditProccessStatusServlet?orderid=${c.orderID}&pstatus=Completed">Completed</a>
                                                                <a href="adminViewOrderDetails?oderID=${c.orderID}" class="button button1">Details</a>
                                                                <a class="button button3"  href="AdminEditProccessStatusServlet?orderid=${c.orderID}&pstatus=Canceled">Canceled</a>
                                                            </c:if>
                                                            <c:if test="${c.processStatus eq 'Pending'}">
                                                                <a class="button button4" href="AdminEditProccessStatusServlet?orderid=${c.orderID}&pstatus=Shipping">Shipping</a>
                                                                <a href="adminViewOrderDetails?oderID=${c.orderID}" class="button button1">Details</a>
                                                                <a class="button button3" href="AdminEditProccessStatusServlet?orderid=${c.orderID}&pstatus=Canceled"><span style="color: red">Canceled</a>

                                                            </c:if>
                                                            <c:if test="${c.processStatus eq 'Canceled'}">
                                                                <a href="adminViewOrderDetails?oderID=${c.orderID}" class="button button1">Details</a>
                                                            </c:if>
                                                        </div>     
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div><!-- /.col -->
                    </div>
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script type="text/javascript">
            $(function() {
                $('#example').DataTable({
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
