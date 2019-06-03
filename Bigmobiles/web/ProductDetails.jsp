<%-- 
    Document   : ProductDetails
    Created on : May 30, 2019, 9:12:16 AM
    Author     : congm
--%>

<%@page import="model.Customers"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.3"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/ajaxcart.js"></script>
        <link type="text/css" rel="stylesheet" href="css/rating.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">      
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
        <div class="breadcrumb-area">
            <div class="container">
                <div class="breadcrumb-content">
                    <ul>
                        <li><a href="ProductServlet">Home</a></li>
                        <li class="active">${product.productName}</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Li's Breadcrumb Area End Here -->
        <!-- content-wraper start -->
        <div class="content-wraper">
            <div class="container">
                <div class="row single-product-area">
                    <div class="col-lg-5 col-md-6">
                        <!-- Product Details Left -->
                        <div class="product-details-left">
                            <div class="product-details-images slider-navigation-1">
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image1}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image1}" alt="product image">
                                    </a>
                                </div>
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image2}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image2}" alt="product image">
                                    </a>
                                </div>

                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image3}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image3}" alt="product image">
                                    </a>
                                </div>
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image4}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image4}" alt="product image">
                                    </a>
                                </div>
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image1}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image1}" alt="product image">
                                    </a>
                                </div>
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image2}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image2}" alt="product image">
                                    </a>
                                </div>                                       
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image3}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image3}" alt="product image">
                                    </a>
                                </div>
                                <div class="lg-image">
                                    <a class="popup-img venobox vbox-item" href="uploadDir/${product.image4}" data-gall="myGallery">
                                        <img src="uploadDir/${product.image4}" alt="product image">
                                    </a>
                                </div>                                  
                            </div>
                            <div class="product-details-thumbs slider-thumbs-1">     

                                <div class="sm-image"><img src="uploadDir/${product.image1}" alt="product image thumb"></div>                                   
                                <div class="sm-image"><img src="uploadDir/${product.image2}" alt="product image thumb"></div>
                                <div class="sm-image"><img src="uploadDir/${product.image3}" alt="product image thumb"></div>
                                <div class="sm-image"><img src="uploadDir/${product.image4}" alt="product image thumb"></div>
                                <div class="sm-image"><img src="uploadDir/${product.image1}" alt="product image thumb"></div>                                   
                                <div class="sm-image"><img src="uploadDir/${product.image2}" alt="product image thumb"></div>
                                <div class="sm-image"><img src="uploadDir/${product.image3}" alt="product image thumb"></div>
                                <div class="sm-image"><img src="uploadDir/${product.image4}" alt="product image thumb"></div>



                            </div>
                        </div>
                        <!--// Product Details Left -->
                    </div>

                    <div class="col-lg-7 col-md-6">
                        <div class="product-details-view-content pt-60">
                            <div class="product-info">
                                <h2>${product.productName}</h2>
                                <span class="product-details-ref">${product.createdDate}</span>
                                <br> <br>                           
                                <form action="ratingServlet" method="post" id="form1">
                                    <div>
                                        <span class="star-rating star-3" data-toggle="modal" data-target="#myModal">                      
                                            <input type="radio" name="start" checked="true">

                                            <i style="width:${(rating/5*100)}%"></i>
                                        </span>

                                    </div>
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <c:if test="${cusID == null}">
                                                    <div class="well">                               
                                                        <h4 class="text-warning">Please <a href="logreg.jsp">Login</a> to make your rating.</h4>
                                                    </div>
                                                </c:if>
                                                <c:if test="${cusID ne null}">
                                                    <div class="modal-body" style="text-align: center" >
                                                        <script>
                                                            function mOver1(obj) {
                                                                document.getElementById("demo").innerHTML = "Very Bad"
                                                            }
                                                            function mOver2(obj) {
                                                                document.getElementById("demo").innerHTML = "Bad"
                                                            }
                                                            function mOver3(obj) {
                                                                document.getElementById("demo").innerHTML = "Not Bad"
                                                            }
                                                            function mOver4(obj) {
                                                                document.getElementById("demo").innerHTML = "Good"
                                                            }
                                                            function mOver5(obj) {
                                                                document.getElementById("demo").innerHTML = "Very Good"
                                                            }
                                                            function mOut1(obj) {
                                                                document.getElementById("demo").innerHTML = ""
                                                            }
                                                        </script>
                                                        <h2>Add you review in here!</h2>

                                                        <br><br>
                                                        <span class="star-rating star-5" >                                                              
                                                            <input required="please choose one" type="radio" name="rating" onmouseover="mOver1(this)" onmouseout="mOut1(this)" value="1" <c:if test="${sao==1}">checked="true"</c:if>/><i ></i>                                                                                
                                                            <input type="radio" name="rating" onmouseover="mOver2(this)" onmouseout="mOut1(this)" value="2" <c:if test="${sao==2}">checked="true"</c:if>/><i></i>                                                                                                           
                                                            <input type="radio" name="rating" onmouseover="mOver3(this)" onmouseout="mOut1(this)" value="3" <c:if test="${sao==3}">checked="true"</c:if>/><i></i>                                                                                                
                                                            <input type="radio" name="rating" onmouseover="mOver4(this)" onmouseout="mOut1(this)" value="4" <c:if test="${sao==4}">checked="true"</c:if>/><i></i>                                                                                        
                                                            <input type="radio" name="rating" onmouseover="mOver5(this)" onmouseout="mOut1(this)" value="5" <c:if test="${sao==5}">checked="true"</c:if>/><i></i>


                                                            </span>   
                                                            <br/>
                                                            <p id="demo"></p>
                                                        <c:if test="${sao != 0}">
                                                            <input type="hidden" name="ratingid" value="${ratings}"/>
                                                            <input type="hidden" name="productID" value="${product.productID}"/>
                                                            <input type="hidden" name="cusId" value="${cusID}"/>


                                                        </c:if>
                                                        <c:if test="${sao == 0}">
                                                            <input type="hidden" name="ratingid" value="${ratings}"/>
                                                            <input type="hidden" name="productID" value="${product.productID}"/>
                                                            <input type="hidden" name="cusId" value="${cusID}"/>
                                                        </c:if>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <c:if test="${sao == 0}"><input type="submit" class="primary-btn" name="action" value="Rate"></c:if>      
                                                        <c:if test="${sao != 0}"><input type="submit" class="primary-btn" name="action" value="Update"></c:if>  

                                                        </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="price-box pt-20">
                                    <span class="new-price new-price-2">$${rating}</span>
                                </div>
                                <div class="product-desc">
                                    <p>
                                        <span>100% cotton double printed dress. Black and white striped top and orange high waisted skater skirt bottom. Lorem ipsum dolor sit amet, consectetur adipisicing elit. quibusdam corporis, earum facilis et nostrum dolorum accusamus similique eveniet quia pariatur.
                                        </span>
                                    </p>
                                </div>

                                <div class="single-add-to-cart">
                                    <form action="#" class="cart-quantity">

                                        <button class="add-to-cart" onclick='addProductToCart("${product.productID}")' type="submit">Add to cart</button>
                                    </form>
                                </div>
                                <div class="product-additional-info pt-25">
                                    <a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Add to wishlist</a>
                                    &nbsp;&nbsp; &nbsp;&nbsp;
                                    <a class="wishlist-btn" onclick="myFunction()" href="CompareServlet?action=Add&Product_id=${product.productID}"><i class="fa fa-exchange"></i>Add to Compare</a>

                                    <div class="product-social-sharing pt-25">
                                        <ul>
                                            <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                            <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                            <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google +</a></li>
                                            <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="block-reassurance">
                                    <ul>
                                        <li>
                                            <div class="reassurance-item">
                                                <div class="reassurance-icon">
                                                    <i class="fa fa-check-square-o"></i>
                                                </div>
                                                <p>Security policy (edit with Customer reassurance module)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="reassurance-item">
                                                <div class="reassurance-icon">
                                                    <i class="fa fa-truck"></i>
                                                </div>
                                                <p>Delivery policy (edit with Customer reassurance module)</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="reassurance-item">
                                                <div class="reassurance-icon">
                                                    <i class="fa fa-exchange"></i>
                                                </div>
                                                <p> Return policy (edit with Customer reassurance module)</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <!-- content-wraper end -->
        <!-- Begin Product Area -->
        <div class="product-area pt-35">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="li-product-tab">
                            <ul class="nav li-product-menu">
                                <li><a class="active" data-toggle="tab" href="#description"><span>Description</span></a></li>
                                <li><a data-toggle="tab" href="#product-details"><span>Comment</span></a></li>
                                <li><a data-toggle="tab" href="#reviews"><span>Totals Reviews</span></a></li>
                            </ul>               
                        </div>
                        <!-- Begin Li's Tab Menu Content Area -->
                    </div>
                </div>
                <div class="tab-content">
                    <div id="description" class="tab-pane active show" role="tabpanel">
                        <div class="product-description">
                            <span>The best is yet to come! Give your walls a voice with a framed poster. This aesthethic, optimistic poster will look great in your desk or in an open-space office. Painted wooden frame with passe-partout for more depth.</span>
                        </div>
                    </div>
                    <div id="product-details" class="tab-pane" role="tabpanel">
                        <div class="product-details-manufacturer">
                            <div id="fb-root"></div>

                            <div class="fb-comments" data-href="http://trancongminh.com/${product.productID}" data-width="" data-numposts="5"></div>
                        </div>
                    </div>
                    <div id="reviews" class="tab-pane" role="tabpanel">
                        <div class="product-reviews">
                            <div class="product-details-comment-block">


                                <div id="rating" >
                                    <div >
                                        <span class="sum">Total vote ${total}</span>
                                    </div>
                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <span class="sum">${star5}</span>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: ${star5/total*100}%;"></div>
                                            </div>
                                        </li>
                                    </ul>

                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-0"></i>
                                                <span class="sum">${star4}</span>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: ${star4/total*100}%;"></div>
                                            </div>
                                        </li>
                                    </ul>

                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <span class="sum">${star3}</span>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: ${star3/total*100}%;"></div>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <span class="sum">${star2}</span>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: ${star2/total*100}%;"></div>
                                            </div>
                                        </li>
                                    </ul>

                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <i class="fa fa-star-0"></i>
                                                <span class="sum">${star1}</span>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: ${star1/total*100}%;"></div>
                                            </div>
                                        </li>
                                    </ul>

                                </div>
                            </div>   


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product Area End Here -->
    <!-- Begin Li's Laptop Product Area -->
    <section class="product-area li-laptop-product pt-30 pb-50">
        <div class="container">
            <div class="row">
                <!-- Begin Li's Section Area -->
                <div class="col-lg-12">
                    <div class="li-section-title">
                        <h2>
                            <span>15 other products in the same category:</span>
                        </h2>
                    </div>
                    <div class="row">
                        <div class="product-active owl-carousel">
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/1.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Graphic Corner</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Accusantium dolorem1</a></h4>
                                            <div class="price-box">
                                                <span class="new-price">$46.80</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/2.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Studio Design</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Mug Today is a good day</a></h4>
                                            <div class="price-box">
                                                <span class="new-price new-price-2">$71.80</span>
                                                <span class="old-price">$77.22</span>
                                                <span class="discount-percentage">-7%</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/3.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Graphic Corner</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Accusantium dolorem1</a></h4>
                                            <div class="price-box">
                                                <span class="new-price">$46.80</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/4.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Studio Design</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Mug Today is a good day</a></h4>
                                            <div class="price-box">
                                                <span class="new-price new-price-2">$71.80</span>
                                                <span class="old-price">$77.22</span>
                                                <span class="discount-percentage">-7%</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/5.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Graphic Corner</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Accusantium dolorem1</a></h4>
                                            <div class="price-box">
                                                <span class="new-price">$46.80</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
                            <div class="col-lg-12">
                                <!-- single-product-wrap start -->
                                <div class="single-product-wrap">
                                    <div class="product-image">
                                        <a href="single-product.html">
                                            <img src="images/product/large-size/6.jpg" alt="Li's Product Image">
                                        </a>
                                        <span class="sticker">New</span>
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_info">
                                            <div class="product-review">
                                                <h5 class="manufacturer">
                                                    <a href="product-details.html">Studio Design</a>
                                                </h5>
                                                <div class="rating-box">
                                                    <ul class="rating">
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4><a class="product_name" href="single-product.html">Mug Today is a good day</a></h4>
                                            <div class="price-box">
                                                <span class="new-price new-price-2">$71.80</span>
                                                <span class="old-price">$77.22</span>
                                                <span class="discount-percentage">-7%</span>
                                            </div>
                                        </div>
                                        <div class="add-actions">
                                            <ul class="add-actions-link">
                                                <li class="add-cart active"><a href="#">Add to cart</a></li>
                                                <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-wrap end -->
                            </div>
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
    <c:if test="${note != null}">
        <script>
            function myFunction() {
                alert("${note}");
            }
        </script>
    </c:if>

    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="linkscript.jsp"></jsp:include>
</body>
</html>
