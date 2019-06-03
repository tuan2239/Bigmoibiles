<%-- 
    Document   : logreg
    Created on : May 24, 2019, 9:49:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <title>Login like Facebook</title>
    <head>
        <link type="text/css" rel="stylesheet" href="fb.css" />
        <meta name="Description" content="Facebook Style Homepage Design with Login Form registration for using html and CSS"/>

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body>


        <div id="navwrapper">
            <div id="navbar">   
                <form action="CheckoutServlet" method="post">
                    <table class="tablewrapper">
                        <tr>
                            <td class="row1">Thư điện tử</td>
                            <td class="row1">Mật khẩu</td>
                        </tr>
                        <tr>
                            <td><input type="email" name="email" class="inputtext">
                            </td>
                            <td><input type="password" name="password" class="inputtext">
                            </td>
                            <td><input type="submit" value="Đăng Nhập" ></td>

                        </tr>

                        <tr>
                            <td class="row2 h">Forgot your password?</td></tr>
                    </table>
                </form>
                <h1 class="logowrapper">Big Mobiles</h1>

            </div>
        </div>

        <div id="contentwrapper">
            <div id="content">

                <div id="leftbod">

                    <div class="connect bolder">Vui lòng đăng nhập để mua hàng.
                        
                    </div>
                    <div class="connect bolder">
                        ${error}
                    ${me}
                    ${mes}</div>
                </div>
                <div id="rightbod">


                    <div class="signup bolder">Đăng ký</div>
                    <div class="free bolder">It's free and always will be</div>

                    <div class="formbox">
                        <form action="createCUSTOMERServlet" method="post" enctype="multipart/form-data">
                            <input type="text" required="" name="fullname" class="inputbody in2" placeholder="Tên đầy đủ">
                            <input type="number" required="" name="phone" class="inputbody in2" placeholder="Số điện thoại">
                            <input type="email" required="" name="email" class="inputbody in2" placeholder="Thư điện tử">
                            <input type="password" name="password" class="inputbody in2" placeholder="Mật khẩu">
                            <input type="file" name="avatar" class="inputbody in2" placeholder="Hình đại diện">
                            <span data-type="radio" class="spanpad">
                                <input type="radio" name="gender" id="fem" class="m0">
                                <label for="fem" class="gender">Nam
                                </label>
                                <input type="radio" name="gender" id="male" class="m0">
                                <label for="male" class="gender">Nữ
                                </label>
                            </span>
                            <button type="submit" class="signbut bolder">Đăng ký</button>
                        </form>
                        <div class="formbox">
                            <div class="agree">
                                bằng cách nhấp vào Đăng ký, bạn đồng ý với Điều khoản của chúng tôi và bạn đã đọc Chính sách sử dụng dữ liệu của chúng tôi, bao gồm cả việc sử dụng cookie của chúng tôi.

                            </div>  
                        </div>

                        <div class="formbox">
                            <div class="create"><div class="link h">Create a Page</div> for a celebrity, band or business.</div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>


    </body>
</html>