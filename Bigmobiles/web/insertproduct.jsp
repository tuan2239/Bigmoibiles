<%-- 
    Document   : insertproduct
    Created on : May 26, 2019, 1:44:19 PM
    Author     : An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="2.jsp"></jsp:include>

<div class="white-box">
            <form action="InsertProducts" method="post" enctype="multipart/form-data">
                 <div class="form-group">
                    <label class="col-md-12">Product ID</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="id"> </div>
                </div> 
                <div class="form-group">
                    <label class="col-md-12">Category</label>
                    <div class="col-md-12">
                        <select name="cboCategoryName" class="form-control">
                            <option>Select Category</option>
                            <c:forEach var="c" items="${listCat}">
                                <option value="${c.categoryID}">${c.categoryName}</option>
                            </c:forEach>
                        </select> </div>
                </div>
                <div class="form-group">
                    <label class="col-md-12">Brand</label>
                    <div class="col-md-12">
                        <select name="cboBrandName" class="form-control">
                            <option>Select Brand</option>
                            <c:forEach var="c" items="${listBrand}">
                                <option value="${c.brandID}">${c.brandName}</option>
                            </c:forEach>
                        </select> </div>
                </div>
                 <div class="form-group">
                    <label class="col-md-12">Brand Name</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="name"> </div>
                </div> 
                <div class="form-group row">
                    <label class="control-label col-md-3">Image Product 1</label>
                    <div class="col-md-8">
                        <input class="form-control" type="file" name="file" accept=".png,.jpg,.bmp">
                    </div>
                </div><br/>
                <div class="form-group row">
                    <label class="control-label col-md-3">Image Product 2</label>
                    <div class="col-md-8">
                        <input class="form-control" type="file" name="file1" accept=".png,.jpg,.bmp">
                    </div>
                </div><br/>
                <div class="form-group row">
                    <label class="control-label col-md-3">Image Product 3</label>
                    <div class="col-md-8">
                        <input class="form-control" type="file" name="file2" accept=".png,.jpg,.bmp">
                    </div>
                </div><br/>
                <div class="form-group row">
                    <label class="control-label col-md-3">Image Product 4</label>
                    <div class="col-md-8">
                        <input class="form-control" type="file" name="file3" accept=".png,.jpg,.bmp">
                    </div>
                </div><br/>
                <div class="form-group">
                    <label class="col-md-12">Price</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="price"> </div>
                </div> 
                <div class="form-group">
                    <label class="col-md-12">Drescription</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="des"> </div>
                </div>   
                <div class="form-group">
                    <label class="col-md-12">Drescription2</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="des1"> </div>
                </div> 
                <div class="form-group">
                    <label class="control-label col-md-3">Date Release </label>
                    <div class="col-md-8">
                        <input class="form-control" type="text" name="date1" id="date1" placeholder="Enter product DateRelease">
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-md-12">Feature</label>
                    <div class="col-md-12">
                        <input type="text" class="form-control form-control-line" name="feature"> </div>
                </div> 
                 <div class="form-group">
                    <label class="col-md-12">Status</label>
                    <div class="col-md-12">
                        <td>Mo:<input type="radio" name="status" value="mo" />

                            Khoa: <input type="radio" name="status" value="khoa" />
                        </td></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button class="btn btn-success">Insert</button>&emsp;
                        <button class="btn btn-danger">Reset</button>
                    </div>
                </div> 
            </form>
        </div>



<jsp:include page="1.jsp"></jsp:include>