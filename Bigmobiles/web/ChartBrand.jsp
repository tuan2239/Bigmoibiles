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
                dataTable.addRows([<c:forEach items="${list}" var="data"> ['${data.brand}',${data.income} ], </c:forEach>]);

                //instantiate our chart object
                var chart1 = new google.visualization.ColumnChart(document.getElementById('chart1'));

                //define options for visualization
                var options = {
                    width: 580,
                    height: 420,
                    is3D: true,
                  
                    title: 'Brands Income'};

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
        <body>

        <jsp:include page="2.jsp"></jsp:include>
            <div class="wrapper wrapper-content">
                <div class="col-md-6 grid-margin stretch-card">

                 <div class="col-lg-12 animated fadeInRightBig">  
                                    <div class="col-md-10"><h1 class="text-center">Income report by Brands</h1></div>
                                    <table border="1" id="reportData" class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <th>No.</th>
                                            <th>Brand</th>
                                            <th>Income</th>
                                        </tr>                                
                                    <c:forEach var="data" items="${list}" varStatus="index" >
                                        <tr>
                                            <td>${index.index + 1}</td>
                                            <td>${data.brand}</td>
                                            <td>${data.income}</td>
                                        </tr>  
                                    </c:forEach>              
                                </table>
                                    
                                <div>Total Income: <%=request.getAttribute("total")%></div>
                                
                            </div>

                <div class="col-lg-9 animated fadeInDown">
                    <div id="chart1"></div>
                </div>

                <div>
                    <input type="hidden" id="numOfBrands" value="${num}"/>
                    <c:forEach items="${list}" var="data" varStatus="index">
                        <input type="hidden" id="brand${index.index + 1}" value="${data.income}" name="${data.brand}"/>
                    </c:forEach>
                </div>
            </div>
        </div>

        <jsp:include page="1.jsp"></jsp:include>
    </body>
</html>
