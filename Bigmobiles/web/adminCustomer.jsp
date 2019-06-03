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
                            Customer Manager
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-users"></i> Customer Account</a></li>
                            <li class="active">View</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Customer List</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Avatar</th>
                                                    <th>Full Name</th>
                                                    <th>Email</th>
                                                    <th>Gender</th>                                                   
                                                    <th>Phone</th>
                                                    <th>Status</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${user}" var="c" varStatus="index">
                                                <tr>
                                                    <td> ${index.index +1}</td>
                                                    <td class="py-2">
                                                        <img src="uploadDir/${c.avatar}" height="50px" /> 
                                                    </td>
                                                    <td>${c.fullName} </td>
                                                    <td>${c.email} </td>

                                                    <td><c:if test="${c.gender ==true}" >
                                                            Female
                                                        </c:if>
                                                        <c:if test="${c.gender ==false}" >
                                                            Male
                                                        </c:if>
                                                    </td>
                                                    <td>${c.phone} </td>
                                                    <td><c:choose>
                                                            <c:when test="${c.customerState!=true}">
                                                                <span style="display:none">${c.customerID}</span>
                                                                <button type="button" class="btn btn-outline-success">enable</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="display:none">${c.customerID}</span>
                                                                <button type="button" class="btn btn-outline-warning">disable</button>
                                                            </c:otherwise>
                                                        </c:choose></td>
                                                    <td> <a  class=" btn-outline-info">Detail</a></td>
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
        <!-- Optionally, you can add Slimscroll and FastClick plugins.
              Both of these plugins are recommended to enhance the
              user experience. Slimscroll is required when using the
              fixed layout. -->
    </body>
</html>
