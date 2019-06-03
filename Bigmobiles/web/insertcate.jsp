<%-- 
    Document   : insertcate
    Created on : May 26, 2019, 2:15:55 PM
    Author     : An
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="2.jsp"></jsp:include>

<div class="white-box">
            <form action="InsertCategory" method="post"  enctype="multipart/form-data" >
               <div class="form-group">
                    <label class="col-md-12">Category Id</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="id"> </div>
                </div> 
                <div class="form-group">
                    <label class="col-md-12">Category Name</label>
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
                        <input type="submit" class="btn btn-success" value="Tao"/>&emsp;
                        <button class="btn btn-danger">Reset</button>
                    </div>
                </div>
            </form>
        </div>



<jsp:include page="1.jsp"></jsp:include>
