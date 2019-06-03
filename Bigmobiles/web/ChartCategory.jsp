<%-- 
    Document   : ChartCategory
    Created on : May 31, 2019, 6:45:57 PM
    Author     : congm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <body>

        <jsp:include page="2.jsp"></jsp:include>
            <div class="wrapper wrapper-content">
                <div class="col-md-6 grid-margin stretch-card">

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
                        
                        <br>
                        <div class="row">
                             <div class="col-sm-7"></div>
                            <div class="col-sm-5">
                                Total Income: <%=request.getAttribute("total")%>
                                </div>
                            </div>
                      
                   

                </div>

                <div class="col-lg-9 animated fadeInDown">
                    <div id="chart"></div>
                </div>

                <div>
                    <input type="hidden" id="numOfBrands" value="${num}"/>
                    <c:forEach items="${list}" var="data" varStatus="index">
                        <input type="hidden" id="brand${index.index + 1}" value="${data.income}" name="${data.category}"/>
                    </c:forEach>
                </div>
            </div>
        </div>

        <jsp:include page="1.jsp"></jsp:include>
    </body>
</html>
