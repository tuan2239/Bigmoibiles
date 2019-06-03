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
            <title>Chart Category</title>
            <script src="js/char1.js"></script>
            <script type="text/javascript" src="js/jsapi.js"></script>
            <script type="text/javascript">
                // Load the Visualization API and the piechart package.
                google.load('visualization', '1', {'packages': ['columnchart']});

                // Set a callback to run when the Google Visualization API is loaded.
                google.setOnLoadCallback(drawChart);

                // Callback that creates and populates a data table,
                // instantiates the pie chart, passes in the data and
                // draws it.
                function drawChart() {

                    // Create the data table.    
                    var data = google.visualization.arrayToDataTable([
                        ['Country', 'Area(square km)'],
            <c:forEach items="${list}" var="data"> ['${data.category}',${data.income} ], </c:forEach>
                    ]);
                    // Set chart options
                    var options = {
                        'title': 'Report Category',
                        is3D: true,
                        pieSliceText: 'label',
                        tooltip: {showColorCode: true},
                        'width': 500,
                        'height': 350

                    };

                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart'));
                    chart.draw(data, options);
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
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="admin-main-sidebar.jsp"></jsp:include>
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>

                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-users"></i></a></li>
                            <li class="active"></li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="">
                                    <div class="col-md-6">

                                        <div class="col-lg-12 animated fadeInRightBig">  
                                            <div class="col-md-10"><h3 class="text-center">Income report by Category</h3></div>
                                            <br>
                                            <table border="1" id="reportData" class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Category</th>
                                                    <th>Income</th>
                                                </tr>                                
                                            <c:forEach var="data" items="${list}" varStatus="index" >
                                                <tr>
                                                    <td>${index.index + 1}</td>
                                                    <td>${data.category}</td>
                                                    <td>${data.income}</td>
                                                </tr>  
                                            </c:forEach>              
                                        </table>
                                        <div class="row no-print">
                                            <div class="col-xs-12">
                                                <a href="#" target="_blank" onclick="window.print();" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-7"></div>
                                            <div class="col-sm-5">
                                                <b>  Total Income: <%=request.getAttribute("total")%></b>
                                            </div>
                                        </div>



                                    </div>

                                    <div>
                                        <input type="hidden" id="numOfBrands" value="${num}"/>
                                        <c:forEach items="${list}" var="data" varStatus="index">
                                            <input type="hidden" id="brand${index.index + 1}" value="${data.income}" name="${data.category}"/>
                                        </c:forEach>
                                    </div>
                                </div>

                                <div class="col-md-6 animated fadeInDown">
                                    <div id="chart"></div>
                                </div>

                            </div>

                        </div><!-- /.col -->

                    </div><!-- /.row -->

                    <!-- Your Page Content Here -->

                </section><!-- /.content -->

            </div><!-- /.content-wrapper -->

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
        <!-- Optionally, you can add Slimscroll and FastClick plugins.
              Both of these plugins are recommended to enhance the
              user experience. Slimscroll is required when using the
              fixed layout. -->
    </body>
</html>
