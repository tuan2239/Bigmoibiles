<%-- 
    Document   : index
    Created on : May 24, 2019, 9:23:51 PM
    Author     : ASUS
--%>

<%@page import="model.Cart"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div class="slider-with-banner">
            <div class="container">
                <div class="row">
                    <!-- Begin Category Menu Area -->

                    <!-- Category Menu Area End Here -->
                    <!-- Begin Slider Area -->
                    <div class="col-lg-12">
                        <div class="slider-area pt-sm-30 pt-xs-30">
                            <div class="slider-active owl-carousel">
                                <!-- Begin Single Slide Area -->
                                <div class="single-slide align-center-left animation-style-02 bg-4">
                                    <div class="slider-progress"></div>
                                    <div class="slider-content">
                                        <h5>Sale Offer <span>-20% Off</span> This Week</h5>
                                        <h2>Chamcham Galaxy S9 | S9+</h2>
                                        <h3>Starting at <span>$589.00</span></h3>
                                        <div class="default-btn slide-btn">
                                            <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Slide Area End Here -->
                                <!-- Begin Single Slide Area -->
                                <div class="single-slide align-center-left animation-style-01 bg-5">
                                    <div class="slider-progress"></div>
                                    <div class="slider-content">
                                        <h5>Sale Offer <span>Black Friday</span> This Week</h5>
                                        <h2>Work Desk Surface Studio 2018</h2>
                                        <h3>Starting at <span>$1599.00</span></h3>
                                        <div class="default-btn slide-btn">
                                            <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Slide Area End Here -->
                                <!-- Begin Single Slide Area -->
                                <div class="single-slide align-center-left animation-style-02 bg-6">
                                    <div class="slider-progress"></div>
                                    <div class="slider-content">
                                        <h5>Sale Offer <span>-10% Off</span> This Week</h5>
                                        <h2>Phantom 4 Pro+ Obsidian</h2>
                                        <h3>Starting at <span>$809.00</span></h3>
                                        <div class="default-btn slide-btn">
                                            <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Slide Area End Here -->
                            </div>
                        </div>
                    </div>
                    <!-- Slider Area End Here -->
                </div>
            </div>
        </div>
        <section class="product-area li-laptop-product li-laptop-product-2 pb-45">
            <div class="container">
                <div class="row">
                    <!-- Begin Li's Section Area -->
                    <div class="col-lg-12">
                        <div class="li-section-title">
                            <h2>
                                <br>

                                <span>Sản Phẩm Mới</span>
                            </h2>
                            <ul class="li-sub-category-list">
                            </ul>
                        </div>

                        <div class="row">
                            <div class="product-active owl-carousel">
                                <c:forEach items="${ProNewList}" var="c">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="ProductDetailsServlet?id=${c.productID}">
                                                    <img src="uploadDir/${c.image1}" alt="Li's Product Image">
                                                </a>
                                                <span class="sticker">${c.feature}</span>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">

                                                        <div class="rating-box" style="margin-right: 30%" >
                                                            <c:choose>
                                                                <c:when test="${rating != null}">

                                                                    <c:forEach begin="1" end="${rating}">
                                                                        <i class="fa fa-star"></i>
                                                                    </c:forEach>
                                                                    <c:forEach begin="1" end="${5-rating}">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="ProductDetailsServlet?id=${c.productID}">${c.productName}</a></h4>
                                                    <div class="price-box">
                                                        <span class="new-price">$${c.price}</span>
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a href="" onclick='addProductToCart("${c.productID}")'>Add to cart</a></li>
                                                        <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                    <!-- Li's Section Area End Here -->
                </div>
            </div>
        </section>
        <!-- Li's Special Product Area End Here -->
        <!-- Begin Li's Laptops Product | Home V2 Area -->
        <section class="product-area li-laptop-product li-laptop-product-2 pb-45">
            <div class="container">
                <div class="row">
                    <!-- Begin Li's Section Area -->
                    <div class="col-lg-12">
                        <div class="li-section-title">
                            <h2>
                                <span>Sản Phẩm Nổi Bật</span>
                            </h2>
                            <ul class="li-sub-category-list">
                            </ul>
                        </div>
                        <div class="li-banner-2 pt-15">
                            <div class="row">
                                <!-- Begin Single Banner Area -->
                                <div class="col-lg-6 col-md-6">
                                    <div class="single-banner">
                                        <a href="#">
                                            <img src="images/banner/2_1.jpg" alt="Li's Static Banner">
                                        </a>
                                    </div>
                                </div>
                                <!-- Single Banner Area End Here -->
                                <!-- Begin Single Banner Area -->
                                <div class="col-lg-6 col-md-6">
                                    <div class="single-banner pt-xs-30">
                                        <a href="#">
                                            <img src="images/banner/2_2.jpg" alt="Li's Static Banner">
                                        </a>
                                    </div>
                                </div>
                                <!-- Single Banner Area End Here -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="product-active owl-carousel">
                                <c:forEach items="${ProHotList}" var="c">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="ProductDetailsServlet?id=${c.productID}">
                                                    <img src="uploadDir/${c.image1}" alt="Li's Product Image">
                                                </a>
                                                <span class="sticker">${c.feature}</span>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">

                                                        <div class="rating-box"style="margin-right: 30%">
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="ProductDetailsServlet?id=${c.productID}">${c.productName}</a></h4>
                                                    <div class="price-box">
                                                        <span class="new-price">$${c.price}</span>
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a onclick='addProductToCart("${c.productID}")' href="">Add to cart</a></li>
                                                            <c:choose>
                                                                <c:when test="${sessionScope.LOGIN_CUSTOMER eq null}">
                                                                <li><a class="links-details" onclick='location.href = "logreg.jsp"'><i class="fa fa-heart-o"></i></a></li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:choose>
                                                                            <c:when test="${sessionScope.wishlist.contains(c) eq true}">
                                                                        <button class="add-to-wishlist" onclick='removeProductWishlist("${c.productID}", "${sessionScope.LOGIN_CUSTOMER.customerID}")'><i class="fa fa-heart" style="color: red"></i><span class="tooltipp">remove from wishlist</span></button>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                        <button class="add-to-wishlist" onclick='addProductWishlist("${c.productID}", "${sessionScope.LOGIN_CUSTOMER.customerID}")'><i class="fa fa-heart-o" ></i><span class="tooltipp">add to wishlist</span></button>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                    <!-- Li's Section Area End Here -->
                </div>
            </div>
        </section>
        <script type="text/javascript">
            function addProductToCart(productid)
            {
                $.ajax({
                    url: "CartServlet?command=plus&productID=" + productid,
                    type: "POST",
                    //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                    success: function()
                    {
                        location.reload();
                    }
                });
            }

            function edit_posale(productid)
            {
                var qt1 = $('#qt' + productid).val();
                if (qt1 > 99) {
                    swal("Quantity isn't more than 99");
                } else
                {
                    $.ajax({
                        url: "EditCartServlet?productID=" + productid + "&quantity=" + qt1,
                        type: "POST",
                        success: function()
                        {
                            location.reload();
                        },
                        error: function(jqXHR, textStatus, errorThrown)
                        {
                            alert(orderid + "\n" + qt1 + "\n" + productid);
                        }
                    });

                }

            }

        </script>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>
    </body>
</html>
