<%-- 
    Document   : details
    Created on : May 26, 2019, 3:33:43 PM
    Author     : An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="2.jsp"></jsp:include>

 <table>
            <tr>
                <td>Name</td>
                <td>${product.productName}</td>
                <td>Compare</td>
            </tr>
            <tr>
                <td>Img</td>
                <td><img src="uploadDir/${product.image1}" width="100px" height="100px"></td>
                <td><a href="CompareServlet?Action=Add&Product_id=${product.productID}">Compare</a></td>
            </tr>

        </table>
        <!-- rating-->
        <form action="ratingServlet" method="post" id="form1">
            <div>

                <span class="star-rating star-3" data-toggle="modal" data-target="#myModal">                      
                    <input type="radio" name="start" checked="true">
                    <i style="width:${(rating/5*100)}%"></i>
                </span>
                <p style="font-weight: bold; font-size: 25px">${rating}<p>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <c:if test="${cusId == null}">
                            <div class="well">                               
                                <h4 class="text-warning">Please <a href="login.jsp">Login</a> to make your rating.</h4>
                            </div>
                        </c:if>
                        <c:if test="${cusId ne null}">
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
                                    <c:if test="${sao != 0}"><input type="hidden" name="ratingid" value="${ratings}"/></c:if>
                                    
                                <input type="hidden" name="productID" value="${product.productID}"/>

                                <input type="hidden" name="cusId" value="${cusId}"/>

                            </div>
                            <div class="modal-footer">
                                <c:if test="${sao == 0}"><input type="submit" class="primary-btn" name="action" value="Rate"></c:if>      
                                <c:if test="${sao != 0}"><input type="submit" class="primary-btn" name="action" value="Update"></c:if>  

                                </div>
                        </c:if>

                    </div>
                </div>
            </div>


            <div>
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
                            </div>
                            <div class="rating-progress">
                                <div style="width: ${star5/total*100}%;"></div>
                            </div>

                            <span class="sum">${star5}</span>
                        </li>
                        <li>
                            <div class="rating-stars">

                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                                <div style="width: ${star4/total*100}%;"></div>
                            </div>
                            <span class="sum">${star4}</span>
                        </li>
                        <li>
                            <div class="rating-stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                                <div style="width: ${star3/total*100}%;"></div>
                            </div>
                            <span class="sum">${star3}</span>
                        </li>
                        <li>
                            <div class="rating-stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                                <div style="width: ${star2/total*100}%;"></div>
                            </div>
                            <span class="sum">${star2}</span>
                        </li>
                        <li>
                            <div class="rating-stars">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <div class="rating-progress">
                                <div style="width: ${star1/total*100}%;"></div>
                            </div>
                            <span class="sum">${star1}</span>
                        </li>
                    </ul>
                </div>
            </div>           
        </form>



<jsp:include page="1.jsp"></jsp:include>
