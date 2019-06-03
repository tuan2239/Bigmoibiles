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
            <title>Reply FeedBack</title>

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
                <div class="content-wrapper" style="background-color: gainsboro">
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
                            <div class="col-xs-5">
                                <h2 class="page-header">
                                    <i class="fa fa-globe"></i> Information

                                </h2>
                            </div><!-- /.col -->
                            <div class="col-xs-7">
                                <h2 class="page-header">
                                    <i class="fa fa-globe"></i> Customer Message
                                    <small class="pull-right">Date: <fmt:formatDate value="<%= new java.util.Date()%>" pattern="dd/MM/yyyy"/></small>
                            </h2>
                        </div>
                    </div>
                    <!-- info row -->

                    <div class="row invoice-info">

                        <div class="col-sm-4 invoice-col">
                            <address>
                                <b>ID# :&nbsp;&nbsp; ${contac.contactID}</b><br><br>
                                <strong>Customer Name :&nbsp;&nbsp;${contac.name}</strong><br><br>
                                <b>Email :&nbsp;&nbsp; ${contac.email}</b><br><br>
                                <b>Created :&nbsp;&nbsp; ${contac.createDate}</b> <br/><br>

                            </address>
                        </div><!-- /.col -->

                        <div class="col-sm-1 invoice-col"></div>

                        <div class="col-sm-7 invoice-col">

                            <address>
                                ${contac.content}


                            </address>

                        </div> 

                    </div>

                    <hr>
 
                </section>
                                <section  class="invoice">
                                <div class="row" style="background-color: white">
                    <div class="col-md-1 "></div>
                    <div class="col-md-11 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h3><b>Reply Feedback</b></h3>
                                <hr>
                                <div class="col-12 grid-margin">
                                    <div class="card">
                                        <div class="card-body">

                                            <form class="form-sample" action="AdminReplyServlet" method="post" >
                                                <p style="color: red" class="m-b-20">${mess}</p>
                                                <p class="card-description"> </p>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">To</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" name="to" value="${contac.email}" readonly="readonly" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Subject</label>
                                                            <div class="col-sm-9">
                                                                <input type="text"  value="Feedback From BigMobile" name="subject" class="form-control" required/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label">Message</label>
                                                            <div class="col-sm-9">
                                                                <textarea class="form-control" style="border-radius: 10px" rows="15" name="message" required></textarea>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                            <div class="row-10">
                                                                <div class="col-md-5"></div>
                                                                <input  type="submit" value="Send" class="btn btn-success mr-2"/></div>
                                                           
                                               

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</section>
            </div>  


            <jsp:include page="admin-main-footer.jsp"></jsp:include>

        </div>



    </body>
</html>
