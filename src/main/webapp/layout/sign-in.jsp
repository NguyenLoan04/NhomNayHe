<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 1/11/2025
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Nét Việt</title>
    <%@include file="public/library.jsp" %>
    <link rel="stylesheet" href="../template/style/user/sign-in.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
<div class="container px-5">
    <form>
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title">Đăng nhập</h2></div>
        </div>
        <div class="row">
            <div class="col">
                <span class="style-caption">Đăng nhập để có thể mua tranh và nhiều hơn thế nữa...</span>
            </div>
        </div>
        <div class="row pt-4">
            <div class="col">
                <span class="style-title">Tên đăng nhập:<span class="text-danger"> * </span></span>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-user"></i></div>
            </div>
            <div class="col-11 p-0"><input type="text" class="w-100 style-input" placeholder="Nhập tên đăng nhập">
            </div>
        </div>
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mật khẩu:<span class="text-danger"> * </span></span></div>
        </div>
        <div class="row pt-2">
            <div class="col-1 text-center p-0">
                <div class="icon-container"><i class="fa-solid fa-lock icon-input"></i></div>
            </div>
            <div class="col-11 p-0"><input type="password" class="w-100 style-input" placeholder="Nhập mật khẩu"></div>
        </div>
        <div class="row pt-3">
            <div class="col text-end"><a href="forget-password.html">Quên mật khẩu?</a></div>
        </div>
        <div class="row pt-3">
            <div class="col text-center">
                <button class="style-button">Đăng nhập</button>
            </div>
        </div>
        <div class="row pt-4">
            <div class="col text-center"><span class="style-label">------Hoặc-----</span></div>
        </div>
        <div class="row text-center px-5 pt-3">
            <div class="col-2"></div>
            <div class="col-3 icon-social p-0">
                <h5><i class="fa-brands fa-facebook"></i></h5>
            </div>
            <div class="col-2 icon-social p-0"><h5><i class="fa-brands fa-google"></i></h5></div>
            <div class="col-3 icon-social p-0"><h5><i class="fa-brands fa-x-twitter"></i></h5></div>
            <div class="col-2"></div>
        </div>
        <div class="row mt-4_5 pb-4">
            <div class="col text-center">
                <span>Không có tài khoản?</span>
                <a href="sign-up.html">Tạo tài khoản mới</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
