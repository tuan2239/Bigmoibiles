<%-- 
    Document   : insertbrand
    Created on : May 26, 2019, 2:15:02 PM
    Author     : An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="2.jsp"></jsp:include>
<div class="white-box">
            <form class="form-horizontal" action="InsertBrand" method="post" enctype="multipart/form-data" >
                <div class="form-group">
                    <label class="col-md-12">Brand ID</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="id"> </div>
                </div> 
                <div class="form-group">
                    <label class="col-md-12">Brand Name</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="name"> </div>
                </div>             
                <div class="form-group row">
                    <label class="control-label col-md-3">Image Product</label>
                    <div class="col-md-8">
                        <input class="form-control" type="file" name="file1" accept=".png,.jpg,.bmp">
                    </div>
                </div><br/>
              
               
                <div class="form-group">
                    <div class="col-sm-12">
                        <button class="btn btn-success">Insert</button>&emsp;
                        <button class="btn btn-danger">Reset</button>
                    </div>
                </div> 
            </form>
        </div>




<jsp:include page="1.jsp"></jsp:include>
