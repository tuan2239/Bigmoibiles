<%-- 
    Document   : index
    Created on : May 24, 2019, 9:23:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <title>Home</title>
        <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="contact-main-page mt-60 mb-40 mb-md-40 mb-sm-40 mb-xs-40">
                <div class="container mb-60">
                    <div id="google-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.3253162668498!2d106.66410831474906!3d10.786376992314777!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ed23c80767d%3A0x5a981a5efee9fd7d!2zNTkwIEPDoWNoIE3huqFuZyBUaMOhbmcgOCwgUGjGsOG7nW5nIDExLCBRdeG6rW4gMywgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1558868705698!5m2!1svi!2s" width="1200" height="280" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 offset-lg-1 col-md-12 order-1 order-lg-2">
                            <div class="contact-page-side-content">
                                <h3 class="contact-page-title">Contact Us</h3>
                                <p class="contact-page-message mb-25"></p>
                                <div class="single-contact-block">
                                    <h4><i class="fa fa-fax"></i> Address</h4>
                                    <p>590 Cách mạng tháng 8, Quận 3,TP Hồ Chí Minh--Việt Nam</p>
                                </div>
                                <div class="single-contact-block">
                                    <h4><i class="fa fa-phone"></i> Phone</h4>
                                    <p>Mobile: (08) 123 456 789</p>
                                    <p>Hot Line: 1009 678 456</p>
                                </div>
                                <div class="single-contact-block last-child">
                                    <h4><i class="fa fa-envelope-o"></i> Email</h4>
                                    <p>yourmail@domain.com</p>
                                    <p>support@hastech.company</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 order-2 order-lg-1">
                            <div class="contact-form-content pt-sm-55 pt-xs-55">

                                <h3 class="contact-page-title">Tell Us Your Message</h3>
                                <div class="contact-form">
                                    <form method="post">
                                        <div class="form-group">
                                            <label>Your Name <span class="required">*</span></label>
                                            <input id="fb-name" type="text" name="name" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email <span class="required">*</span></label>
                                            <input id="fb-email" type="email" name="email" required>
                                        </div>

                                        <div class="form-group mb-30">
                                            <label>Your Message</label>
                                            <textarea id="fb-content" name="content"  ></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="submit-feedback" value="submit" >Send</button>
                                        </div>
                                    </form>
                                </div>
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
               $("#submit-feedback").click(function(){
                   event.preventDefault();
                   var email = $("#fb-email").val();
                   var content = $("#fb-content").val();
                   var name = $("#fb-name").val();
                   if(validateEmail(email) && validateName(name) && validateContent(content)){
                      $("#fb-content").next("span").remove();
                           $.ajax({
                               url: "http://localhost:8080/Bigmobiles/FeedbackServlet",
                               method: 'POST',
                               data: {"email":email,"name":name,"content":content},
                               success: function(data){
                                    alert(data);
                                      email = $("#fb-email").val("");
                                     content = $("#fb-content").val("");
                                     name = $("#fb-name").val("");
                                     $("html, body").animate({ scrollTop: 0 }, "slow");
                                }
                           });
                    }
                           
               });
               
               function checkEmail(email) {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
              }
              function validateEmail(email){
                  var error = 0;
                  if(email != ""){
                    if(checkEmail(email)){
                        return true;
                    }else{
                        error = 2;
                    }
                  }else{
                      error = 1;
                  }
                  if (error == 1){
                      $("#fb-content").next("span").remove();
                      $("#fb-content").after("<span class=\"text-danger\">khong bo trong email</span>");
                        return false;
                  } else if(error == 2){
                      $("#fb-content").next("span").remove();
                      $("#fb-content").after("<span class=\"text-danger\">Email sai dinh dang</span>");
                        return false;
                  }
              }
              function validateName(name){
                  if(name == ""){
                      $("#fb-content").next("span").remove();
                      $("#fb-content").after("<span class=\"text-danger\">khong bo trong ten</span>");
                      return false;
                  }
                  return true;
              }
              function validateContent(cn){
                  if(cn == ""){
                      $("#fb-content").next("span").remove();
                      $("#fb-content").after("<span class=\"text-danger\">khong bo trong noidung</span>");
                      return false;
                  }
                  return true;
              }
               
            </script>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>

    </body>
</html>
