<%--
  Created by IntelliJ IDEA.
  User: loan
  Date: 20/01/2025
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common.jsp"/>
<html>
<head>
    <title>${account.username}</title>
    <link rel="stylesheet" href="../../template/style/user/account-page.css">
    <jsp:include page="../public/library.jsp"/>
</head>
<body>
<jsp:include page="../public/header.jsp"/>
<div class="container p-0 ms-6 mt-4">
    <div class="content row">
        <div class="user-props-list col-4 me-4">
            <div class="user-img-frame">
                <img src="${account.avatarUrl}" style="width: 100px;height: 100px;margin-top: 30px">
                <p id="nickname" class="p-4 title">${account.username} </p>
            </div>
            <div class="list-group list_props">
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-info">
                    <i class="bi bi-person"></i>
                    Thông tin người dùng
                </a>
                <a class="list-group-item list-group-item-action _info" href="${pageContext.request.contextPath}/user/user-addresses">
                    <i class="bi bi-geo-alt"></i>
                    Sổ địa chỉ
                </a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-viewed-history">
                    <i class="bi bi-eye"></i>
                    Lịch sử đã xem
                </a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-wishlist">
                    <i class="bi bi-heart"></i>
                    Danh sách yêu thích
                </a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-orders">
                    <i class="bi bi-box-seam"></i>
                    Đơn hàng của tôi
                </a>
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-feedbacks">
                    <i class="bi bi-pencil"></i>
                    Lịch sử đánh giá
                </a>
            </div>
            <hr>
            <div class="list-group user_setting_help">
                <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/user/user-setting">
                    <i class="bi bi-gear"></i>
                    Cài đặt
                </a>
                <a class="list-group-item list-group-item-action" href="/layout/user/user-help.jsp">
                    <i class="bi bi-question-circle"></i>
                    Hỗ trợ
                </a>
            </div>
            <hr>
            <div class="list-group user-logout">
                <a class="list-group-item list-group-item-action logout-btn">
                    <i class="bi bi-box-arrow-left"></i>
                    Đăng xuất
                </a>
            </div>
        </div>
        <!--User's property Page-->
        <!--Empty prop-->
        <div id="content" class="user_page_each_prop empty-prop content-details col">
            <div class="w-100 opacity-50 d-flex justify-content-center align-items-center" style="height: 100%">
                <h2 class="main-color text-center fw-semibold">Vui lòng chọn một mục</h2>
            </div>
        </div>
    </div>
</div>
<div id="logout_alert" class="m-10 container">
    <div class="row ps-2"><p>Bạn chắc chắn muốn đăng xuất?</p></div>
    <div class="row pt-5 ps-4 text-center">
        <button id="yesBtn" class="col-5 text-center">Có</button>
        <div class="col-2"></div>
        <button id="noBtn" class="col-5 text-center">Không</button>
    </div>
</div>
<div class="p-4"></div>
<%--<div id="custom-popup-overlay" class="d-none"></div>--%>
<%--<div id="custom-popup" class="d-none">--%>
<%--    <div class="popup-content">--%>
<%--        <p id="message"></p>--%>
<%--        <button class="popup-close">Đóng</button>--%>
<%--    </div>--%>
<%--</div>--%>
<jsp:include page="../public/footer.jsp"/>
<script src="template/script/header.js"></script>
<script src="template/script/account.js"></script>
</body>
</html>
