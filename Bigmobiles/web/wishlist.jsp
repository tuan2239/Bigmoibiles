<%-- 
    Document   : wishlist
    Created on : May 30, 2019, 11:46:58 PM
    Author     : congm
--%>

<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="linkcss.jsp"></jsp:include>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
   
    </head>
    <body>
        <%Cart cart = (Cart) session.getAttribute("cart");
           if(cart == null){
               cart = new Cart();
               session.setAttribute("cart", cart);
           }%>
       <jsp:include page="header.jsp"></jsp:include>
        <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="active">Wishlist</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Wishlist Area Strat-->
            <div class="wishlist-area pt-60 pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <form action="#">
                                <div class="table-content table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="li-product-remove">remove</th>
                                                <th class="li-product-thumbnail">images</th>
                                                <th class="cart-product-name">Product</th>
                                                <th class="li-product-price">Unit Price</th>
                                             
                                                <th class="li-product-add-cart">add to cart</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${wishlist}" var="c">
                                            <tr>
                                                <td class="li-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                                <td class="li-product-thumbnail"><a href="#"><img src="uploadDir/${c.productID}" alt=""></a></td>
                                                <td class="li-product-name"><a href="#">${c.productID}</a></td>
                                                <td class="li-product-price"><span class="amount">${c.productID}</span></td>
                                                <td class="li-product-add-cart"><a href="#">add to cart</a></td>
                                            </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
           <jsp:include page="linkscript.jsp"></jsp:include>
    </body>
</html>
