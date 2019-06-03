

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="2.jsp"></jsp:include>
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title">Danh sách quản lý</h1>
                <button data-toggle="modal" data-target="#myModal">Tạo sản phẩm</button>
                <a href="ShowCbbServlet" >Tạo San Pham</a>
                <table class="table table-striped">
                    <tr>
                        <th> Tên Sản Phẩm</th>
                        <th> Hình  </th>
                        <th> Giá </th>
                        <th> Mô Tả </th>
                        <th>Thông Số Kỹ Thuật</th>
                    </tr>
                <c:forEach items="${listp}" var="s">
                    <tr>
                        <td>${s.productName}</td>
                        <td><img src="uploadDir/${s.image2}" width="150px" height="150px"></td>
                        <td>${s.price} </td>
                        <td>${s.description} </td>
                        <td><c:choose>
                                <c:when test="${s.productState!=true}">
                                    <span style="display:none">${s.productID}</span>
                                    <button type="button" class="btn btn-outline-success">enable</button>
                                </c:when>
                                <c:otherwise>
                                    <span style="display:none">${s.productID}</span>
                                    <button type="button" class="btn btn-outline-warning">disable</button>
                                </c:otherwise>
                            </c:choose></td>
                        <td><a href="DetailProductsServlet?productID=${s.productID} class="btn btn-outline-info">Sửa</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>
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
                    url: "/Bigmobiles/ShowProductsServlet",
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
                    url: "/Bigmobiles/ShowProductsServlet",
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
<jsp:include page="1.jsp"></jsp:include>