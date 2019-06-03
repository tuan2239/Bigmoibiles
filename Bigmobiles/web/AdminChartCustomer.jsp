




























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
            <title>Chart Customer</title>
            <script src="js/char1.js"></script>
            <script type="text/javascript" src="js/jsapi.js"></script>
            <script type="text/javascript">
                //load the Google Visualization API and the chart
                google.load('visualization', '1', {'packages': ['columnchart']});

                //set callback
                google.setOnLoadCallback(createChart);

                //callback function
                function createChart() {

                    //create data table object
                    var dataTable = new google.visualization.DataTable();

                    //define columns
                    dataTable.addColumn('string', 'Quarters 2009');
                    dataTable.addColumn('number', 'Income');


                    //define rows of data
                    dataTable.addRows([<c:forEach items="${list}" var="data"> ['${data.name}',${data.income} ], </c:forEach>]);

                    //instantiate our chart object
                    var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));

                    //define options for visualization
                    var options = {width: 520, height: 300, is3D: true, title: 'Customer Income'};

                    //draw our chart
                    chart1.draw(dataTable, options);

                }
            </script>
            <style>
                .content-wrapper{
                    background: #fff!important; 
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
                            Top 3 Customer Order
                        </h1>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                        <div class="box-body">
                                            <table border="1" id="tabless" class="table table-bordered table-striped">
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Email</th>
                                                    <th>Name</th>
                                                    <th>Income</th>
                                                </tr>
                                            <c:forEach var="data" items="${list}" varStatus="index" >
                                                <tr>
                                                    <td>${index.index + 1}</td>
                                                    <td>${data.email}</td>
                                                    <td>${data.name}</td>
                                                    <td>${data.income}</td>
                                                </tr>  
                                            </c:forEach>
                                        </table>
                                    </div>

                                    <div>
                                        <input type="hidden" id="numOfBrands" value="${num}"/>
                                        <c:forEach items="${list}" var="data" varStatus="index">
                                            <input type="hidden" id="brand${index.index + 1}" value="${data.income}" name="${data.name}"/>
                                        </c:forEach>
                                    </div>
                         
                                
                            </div><!-- /.box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                    <!-- Your Page Content Here -->
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <script type="text/javascript">
            $(function() {
                $('#tabless').DataTable({
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