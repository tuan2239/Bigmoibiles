<%-- 
    Document   : search
    Created on : May 31, 2019, 11:00:00 AM
    Author     : congm
--%>

<%@page import="model.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product By Brand</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="js/price1.js"></script>
        <script src="js/price2.js"></script>
        <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
        <%

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="ProductServlet">Home</a></li>
                            <li class="active">search</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60 pt-sm-30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 order-2 order-lg-1">
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                                <div class="sidebar-title">
                                    <h2>Laptop</h2>
                                </div>
                                <!-- category-sub-menu start -->
                                <div class="category-sub-menu">
                                    <ul>
                                        <li class="has-sub"><a href="# ">Prime Video</a>
                                            <ul>
                                                <li><a href="#">All Videos</a></li>
                                                <li><a href="#">Blouses</a></li>
                                                <li><a href="#">Evening Dresses</a></li>
                                                <li><a href="#">Summer Dresses</a></li>
                                                <li><a href="#">T-Rent or Buy</a></li>
                                                <li><a href="#">Your Watchlist</a></li>
                                                <li><a href="#">Watch Anywhere</a></li>
                                                <li><a href="#">Getting Started</a></li>  
                                            </ul>
                                        </li>
                                        <li class="has-sub"><a href="#">Computer</a>
                                            <ul>
                                                <li><a href="#">TV & Video</a></li>
                                                <li><a href="#">Audio & Theater</a></li>
                                                <li><a href="#">Camera, Photo</a></li>
                                                <li><a href="#">Cell Phones</a></li>
                                                <li><a href="#">Headphones</a></li>
                                                <li><a href="#">Video Games</a></li>
                                                <li><a href="#">Wireless Speakers</a></li> 
                                            </ul>
                                        </li>
                                        <li class="has-sub"><a href="#">Electronics</a>
                                            <ul>
                                                <li><a href="#">Amazon Home</a></li>
                                                <li><a href="#">Kitchen & Dining</a></li>
                                                <li><a href="#">Bed & Bath</a></li>
                                                <li><a href="#">Appliances</a></li>    
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box">
                                <div class="sidebar-title">
                                    <h2>Filter By</h2>
                                </div>
                                <div></div>
                                <!-- btn-clear-all start -->
                                <div id="slidergia"></div>
                                <span id="infrom">${currfrom}</span> - <span id="into">${currto}</span>
                            <form action="SearchServlet?action=searchprice" method="post">
                                <input type="hidden" name="from" value="${currfrom}" id="sofrom">
                                <input type="hidden" name="to" value="${currto}" id="soto">
                                <button type="submit" id="btn-filter">filter</button>
                            </form>
                            <!-- filter-sub-area end -->
                        </div>
                        <!--sidebar-categores-box end  -->
                        <!-- category-sub-menu start -->

                    </div>
                    <div class="col-lg-9 order-1 order-lg-2">
                        <!-- Begin Li's Banner Area -->
                        <div class="single-banner shop-page-banner">
                            <a href="#">
                                <img src="images/bg-banner/2.jpg" alt="Li's Static Banner">
                            </a>
                        </div>
                        <!-- Li's Banner Area End Here -->
                        <!-- shop-top-bar start -->
                        <div class="shop-top-bar mt-30">
                            <div class="shop-bar-inner">
                                <div class="product-view-mode">
                                    <!-- shop-item-filter-list start -->
                                    <ul class="nav shop-item-filter-list" role="tablist">
                                        <li class="active" role="presentation"><a aria-selected="true" class="active show" data-toggle="tab" role="tab" aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a></li>
                                        <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="list-view" href="#list-view"><i class="fa fa-th-list"></i></a></li>
                                    </ul>
                                    <!-- shop-item-filter-list end -->
                                </div>
                                <div class="toolbar-amount">
                                    <span>Showing 1 to 9 of 15</span>
                                </div>
                            </div>
                            <!-- product-select-box start -->
                            <div class="product-select-box">
                                <div class="product-short">
                                    <p>Sort By:</p>
                                    <select class="nice-select">
                                        <option value="trending">Relevance</option>
                                        <option value="sales">Name (A - Z)</option>
                                        <option value="sales">Name (Z - A)</option>
                                        <option value="rating">Price (Low &gt; High)</option>
                                        <option value="date">Rating (Lowest)</option>
                                        <option value="price-asc">Model (A - Z)</option>
                                        <option value="price-asc">Model (Z - A)</option>
                                    </select>
                                </div>
                            </div>
                            <!-- product-select-box end -->
                        </div>
                        <!-- shop-top-bar end -->
                        <!-- shop-products-wrapper start -->
                        <div class="shop-products-wrapper">
                            <div class="tab-content">
                                <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                    <div class="product-area shop-product-area">
                                        <div class="row">
                                            <c:forEach var="c" items="${listP}">

                                                <div class="col-lg-4 col-md-4 col-sm-6 mt-40 contentPage">
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

                                                                    <div class="rating-box" style="margin-right: 30%">
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
                                                                    <li class="add-cart active"><a href="" onclick='addProductToCart("${c.productID}")'>Add to cart</a></li>
                                                                    <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
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
                                <div id="list-view" class="tab-pane fade product-list-view" role="tabpanel">
                                    <div class="row">

                                        <div class="col">
                                            <c:forEach var="c" items="${listP}">
                                                <div class="row product-layout-list">
                                                    <div class="col-lg-3 col-md-5 ">
                                                        <div class="product-image">
                                                            <a href="ProductDetailsServlet?id=${c.productID}">
                                                                <img src="uploadDir/${c.image1}" alt="Li's Product Image">
                                                            </a>
                                                            <span class="sticker">${c.feature}</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-5 col-md-7">
                                                        <div class="product_desc">
                                                            <div class="product_desc_info">
                                                                <div class="product-review">

                                                                    <div class="rating-box" style="margin-right: 30%">
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
                                                                <p>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant 360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With Exquisite Sound via Ring Radiator Technology. Stream And Control R3 Speakers Wirelessly With Your Smartphone. Sophisticated, Modern Desig</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <div class="shop-add-action mb-xs-30">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart"><a href="" onclick='addProductToCart("${c.productID}")'>Add to cart</a></li>
                                                                <li class="wishlist"><a href="wishlist.html"><i class="fa fa-heart-o"></i>Add to wishlist</a></li>
                                                                <li><a class="quick-view" data-toggle="modal" data-target="#exampleModalCenter" href="#"><i class="fa fa-eye"></i>Quick view</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="paginatoin-area">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 pt-xs-15">

                                        </div>
                                        <div class="col-lg-6 col-md-6">

                                            <ul  class="pagination-box pt-xs-20 pb-xs-15">




                                                <li id="pagination"></li>


                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- shop-products-wrapper end -->
                    </div>

                </div>
            </div>
        </div>
        <!-- Content Wraper Area End Here -->

        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>
            <script src="js/jquery.twbsPagination.js"></script>
            <span id="totalrow" class="hide">${productListCountBrand}</span>
    </body>
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
    <script type="text/javascript">
        $(function() {
            var pageSize = 9; // Hiển thị 6 sản phẩm trên 1 trang
            showPage = function(page) {
                $(".contentPage").hide();
                $(".contentPage").each(function(n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = $("#totalrow").text(); // Tổng số sản phẩm hiển thị
            var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
            var iTotalPages = Math.ceil(totalRows / pageSize);

            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function(event, page) {
                    /* console.info(page); */
                    showPage(page);
                }
            });
            /*console.info(obj.data());*/
        });
    </script>

    <script>
        var min = 0;
        $("#slidergia").slider({
            range: true,
            min: min,
            max: ${maxPr},
            values: [${currfrom}, ${currto}],
            slide: function(event, ui) {
                $("#sofrom").val(ui.values[ 0 ]);
                $("#soto").val(ui.values[ 1 ]);

                $("#infrom").text(ui.values[ 0 ]);
                $("#into").text(ui.values[ 1 ]);
            }
        });
    </script>
</html>
