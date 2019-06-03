<%-- 
    Document   : showbrand
    Created on : May 26, 2019, 3:46:32 PM
    Author     : An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<jsp:include page="2.jsp"></jsp:include>


<div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title">Danh sách quản lý</h1>
                <a href="insertbrand.jsp" >Tạo Thương Hiệu</a>
                <table class="table table-striped">
                    <tr>
                        <th> Tên Thương Hiệu</th>
                        <th> Hình  </th>
                        
                        
                        
                    </tr>
                    <c:forEach items="${listb}" var="s">
                    <tr>
                        <td>${s.brandName}</td>
                        <td><img src="uploadDir/${s.brandImages}" width="150px" height="150px"></td>
                        
                        <td><c:choose>
                        <c:when test="${s.brandState!=true}">
                            <span style="display:none">${s.brandID}</span>
                            <button type="button" class="btn btn-outline-success">enable</button>
                        </c:when>
                        <c:otherwise>
                            <span style="display:none">${s.brandID}</span>
                            <button type="button" class="btn btn-outline-warning">disable</button>
                        </c:otherwise>
                    </c:choose></td>
                        
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>


<jsp:include page="1.jsp"></jsp:include>


    



