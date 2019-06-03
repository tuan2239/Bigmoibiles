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

        </head>

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
                            List Admin
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
                                    
                                    <div class="box-header">
                                          <a href="createAdmin.jsp" class="btn-default">Add New Admin</a>
                                    </div><!-- /.box-header -->
                                   
                                    <div class="box-body">
                                       
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Avatar</th>
                                                    <th>Full Name</th>
                                                    <th>Email</th>
                                                    <th>Create Date</th>                                                                                                     
                                                    <th>Status</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${staff}" var="c" varStatus="index">
                                                <tr>
                                                      <td> ${index.index +1}</td>
                                                    <td class="py-2">
                                                        <img src="uploadDir/${c.avatar}" height="50px"/> </td>
                                                    <td>${c.fullname} </td>
                                                    <td>${c.email} </td>
                                                    <td>${c.createdDate} </td>
                                                    <td><c:choose>
                                                            <c:when test="${c.adminState!=true}">
                                                                <span style="display:none">${c.adminID}</span>
                                                                <button type="button" class="btn btn-outline-success">Enable</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="display:none">${c.adminID}</span>
                                                                <button type="button" class="btn btn-outline-warning">Disable</button>
                                                            </c:otherwise>
                                                        </c:choose></td>
                                                    <td> <a href="%">Details</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
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
                $('#example1').DataTable({
                    "order": [[0, "desc"]],
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'excel', 'pdf', 'print'
                    ]
                });
            });
        </script>
        <script>
            $(document).ready(function() {

                $(".btn").click(function() {
                    var id = $(this).parent().find("span").text();
                    var text = $(this).text();
                    if (text == "enable") {
                        $(this).text("disable");
                        $(this).removeClass("btn-outline-success");
                        $(this).addClass("btn-outline-warning");
                        $.ajax({
                            method: "GET",
                            url: "/Bigmobiles/ShowAdminServlet",
                            dataType: 'json',
                            contentType: 'application/json',
                            data: {"id": id, "method": "enable"}
                        }).done(function() {
                            alert("ok");
                        });
                    } else {
                        $(this).text("enable");
                        $(this).removeClass("btn-outline-warning");
                        $(this).addClass("btn-outline-success");
                        $.ajax({
                            method: "GET",
                            url: "/Bigmobiles/ShowAdminServlet",
                            dataType: 'json',
                            contentType: 'application/json',
                            data: {"id": id, "method": "disable"}
                        }).done(function() {
                            alert("ok");
                        });
                    }
                });
            });
        </script>

    </body>
</html>


