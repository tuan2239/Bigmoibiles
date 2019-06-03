<%-- 
    Document   : cart
    Created on : May 29, 2019, 11:39:48 AM
    Author     : congm
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <jsp:include page="linkcss.jsp"></jsp:include>
          <script src="js/ajaxcart.js"></script>
    </head>
    <body>
           <%
            String checkout = "";
            Customers cus = (Customers) session.getAttribute("LOGIN_CUSTOMER");
           Cart cart = (Cart) session.getAttribute("cart");
           if(cart == null){
               cart = new Cart();
               session.setAttribute("cart", cart);
           }
                if (cus == null) {
                checkout = "loginCheckout.jsp";
            } else {
                checkout = "checkout.jsp";
            }
       %>
        <jsp:include page="header.jsp"></jsp:include>
         <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="ProductServlet">Home</a></li>
                            <li class="active">Shopping Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Shopping Cart Area Strat-->
            <div class="Shopping-cart-area pt-60 pb-60">
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
                                                <th class="li-product-quantity">Quantity</th>
                                                <th class="li-product-subtotal">Total</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody>
                                              <%for(Map.Entry<String, Item> list : cart.getCartItems().entrySet()){%>
                                            <tr>
                                                <td class="li-product-remove"><a onclick='RemoveCart("<%=list.getValue().getProduct().getProductID()%>")'><i class="fa fa-times"></i></a></td>
                                                               
                                <td class="li-product-thumbnail"><a href="#"><img src="uploadDir/<%=list.getValue().getProduct().getImage1()%> " alt="Li's Product Image" height="30px"/></a></td>
                                                <td class="li-product-name"><a href="#"><%=list.getValue().getProduct().getProductName()%></a></td>
                                                <td class="li-product-price"><span class="amount"><%=list.getValue().getProduct().getPrice()%> </span></td>
                                                <td class="quantity">
                                                    <label>Quantity</label>
                                                    <div >
                                                        <input min="1" max="99" class="cart-plus-minus-box" id="qt<%=list.getValue().getProduct().getProductID()%>" onchange='edit_posale("<%=list.getValue().getProduct().getProductID()%>")'  value="<%=list.getValue().getQuantity()%>" name="quantity" type="number">
                           
                                                    </div>
                                                </td>
                                                
                                                <td class="product-subtotal"><span class="amount">$<%=list.getValue().getItemtotal() %></span></td>
                                               
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="coupon-all">
                                            <div class="coupon">
                                               
                                            </div>
                                         
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                       <div class="col-md-8">
                                        <div class="coupon-all">
                                            <div class="coupon">
                                               
                                            </div>
                                         
                                        </div>
                                    </div>
                                    <div class="col-md-4 ml-auto">
                                        <div class="cart-page-total">
                                            <h2>Cart totals</h2>
                                            <ul>
                                                <li>Subtotal <span>$<%=cart.totalCart()%>   </span></li>
                                              
                                            </ul>
                                            <a href="<%=checkout%>">Proceed to checkout</a>          
                                                
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
       
           <jsp:include page="footer.jsp"></jsp:include>
           <jsp:include page="linkscript.jsp"></jsp:include>
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
                var qt1 = $('#qt' +  productid).val();
                if (qt1 > 99) {
                    swal("Quantity isn't more than 99");
                } else
                {
                    $.ajax({
                        url: "EditCartServlet?productID="+productid+"&quantity="+qt1,
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
    </body>
</html>
