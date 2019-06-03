
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.Customers"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<% Customers custom = (Customers) session.getAttribute("LOGIN_CUSTOMER");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>   
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
 String checkout = "";
            Customers cus = (Customers) session.getAttribute("LOGIN_CUSTOMER");
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
      if (cus == null) {
                checkout = "loginCheckout.jsp";
            } else {
                checkout = "checkout.jsp";
            }
%>

<header>

    <!-- Begin Header Top Area -->
    <div class="header-top">
        <div class="container">
            <div class="row">
                <!-- Begin Header Top Left Area -->
                <div class="col-lg-3 col-md-4">
                    <div class="header-top-left">
                        <ul class="phone-wrap">
                            <li><span>Hot line:</span><a href="#">(+123) 123 321 345</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Header Top Left Area End Here -->
                <!-- Begin Header Top Right Area -->
                <div class="col-lg-9 col-md-8">
                    <div class="header-top-right">
                        <ul class="ht-menu">
  <%
                                if (custom == null) {
                            %>   
                            <li>
                                <a href="logreg.jsp">Sign in|| Sign up</a>
                            </li>
                            <%  } else {%> 
                        <li><a href="#"><%=custom.getFullName()%></a></li>
                            <li><a href="logoutServlet">Logout</a></li>
                                <%       }%>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
        <div class="container">
            <div class="row">
                <!-- Begin Header Logo Area -->
                <div class="col-lg-2">
                    <div class="logo pb-sm-30 pb-xs-30">
                        <a href="ProductServlet">
                            <img src="images/menu/logo/1.jpg" alt="">
                        </a>
                    </div>
                </div>
                <!-- Header Logo Area End Here -->
                <!-- Begin Header Middle Right Area -->
                <div class="col-lg-10">
                    <!-- Begin Header Middle Searchbox Area -->
                    <form action="SearchServlet?action=searchname" method="post" class="hm-searchbox">

                        <input type="text" name="searchName" placeholder="Search product">
                        <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    <!-- Header Middle Searchbox Area End Here -->
                    <!-- Begin Header Middle Right Area -->
                    <div class="header-middle-right">
                        <ul class="hm-menu">
                            <!-- Begin Header Middle Wishlist Area -->
                            <li class="hm-wishlist">
                                <a href="wishlist.jsp">
                                    <span class="cart-item-count wishlist-item-count">${countWishlist}</span>
                                    <i class="fa fa-heart-o"></i>
                                </a>

                            </li>
                            <li class="hm-wishlist">
                                <a href="comparejsp">
                                    <span class="cart-item-count wishlist-item-count"></span>
                                    <i class="fa fa-exchange"></i>
                                </a>

                            </li>

                            <!-- Header Middle Wishlist Area End Here -->
                            <!-- Begin Header Mini Cart Area -->
                            <li class="hm-minicart">
                                <div class="hm-minicart-trigger">
                                    <span class="item-icon"></span>
                                    <span class="item-text">$<%=cart.totalCart()%>
                                        <span class="cart-item-count"><%=cart.countItem()%></span>
                                    </span>
                                </div>
                                <span></span>
                                <div class="minicart">
                                    <ul class="minicart-product-list">
                                        <%for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {%>
                                        <li>
                                            <a href="single-product.html" class="minicart-product-image">
                                                <img src="uploadDir/<%=list.getValue().getProduct().getImage1()%>"/>  
                                            </a>
                                            <div class="minicart-product-details">
                                                <h6><a href="single-product.html"><%=list.getValue().getProduct().getProductName()%></a></h6>
                                                <span><%=list.getValue().getProduct().getPrice()%> x <%=list.getValue().getQuantity()%></span>
                                            </div>
                                            <button onclick='RemoveCart("<%=list.getValue().getProduct().getProductID()%>")' class="close">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </li>
                                        <%}%>

                                    </ul>
                                    <p class="minicart-total">SUBTOTAL: <span>$<%=cart.totalCart()%></span></p>
                                    <div class="minicart-button">
                                        <a href="cart.jsp" class="li-button li-button-dark li-button-fullwidth li-button-sm">
                                            <span>View Full Cart</span>
                                        </a>
                                        <a href="<%=checkout%>" class="li-button li-button-fullwidth li-button-sm">
                                            <span>Checkout</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <!-- Header Mini Cart Area End Here -->
                        </ul>
                    </div>
                    <!-- Header Middle Right Area End Here -->
                </div>
                <!-- Header Middle Right Area End Here -->
            </div>
        </div>
    </div>
    <!-- Header Middle Area End Here -->
    <!-- Begin Header Bottom Area -->
    <div class="header-bottom header-sticky stick d-none d-lg-block d-xl-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Begin Header Bottom Menu Area -->
                    <div class="hb-menu hb-menu-2">
                        <nav>
                            <ul><li></li>
                                <li><a href="ProductServlet">Home</a></li>
                                <li class="dropdown-holder"><a href="">Categories</a>
                                    <ul class="hb-dropdown">
                                        <c:forEach var="c" items="${catelist}">        
                                            <li class="" style="margin-left: 50px"><a href="AllProductByCategoryServlet?Categoryid=${c.categoryID}"><b>${c.categoryName}</b></a>
                                                    </c:forEach>
                                        </li>
                                    </ul>
                                </li>
                                <li class="megamenu-static-holder"><a href="">Brand</a>
                                    <ul class="megamenu hb-megamenu" >
                                        <c:forEach var="c" items="${brandList}">
                                            <ul>
                                                <li><a href="AllProductByBrandsServlet?Brandid=${c.brandID}"><img  src="uploadDir/${c.brandImages}" height="30px"/></a></li>
                                            </ul>
                                        </c:forEach>
                                    </ul>
                                </li>

                                <li><a href="">News</a></li>
                                <li><a href="FeedbackServlet">Contacts</a></li>
                                <li><a href="AboutusServlet">About Us</a></li>
                                <li class="hb-info f-right p-0 d-sm-none d-lg-block">
                                    <span>590 Cách mạng tháng 8,Quận 3,TP.Hồ Chí Minh</span>
                                </li>
                                <!-- Header Bottom Menu Information Area End Here -->
                            </ul>
                        </nav>
                    </div>
                    <!-- Header Bottom Menu Area End Here -->
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        function RemoveCart(productid)
        {
            $.ajax({
                url: "CartServlet?command=remove&productID=" + productid,
                type: "POST",
                //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                success: function()
                {

                    location.reload();
                },
                error: function(jqXHR, textStatus, errorThrown)
                {
                    alert("error");
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
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function() {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/5cd7e3222846b90c57ae156e/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->
</header>