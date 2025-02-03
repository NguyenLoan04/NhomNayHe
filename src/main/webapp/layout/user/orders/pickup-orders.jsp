<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>

<!--Pickup Orders (PAID)-->
<div id="pickedlist" class="order-details">
    <c:if test="${empty pickup}">
        <div class="h3 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
            Trống
        </div>
    </c:if>
    <c:if test="${not empty pickup}">
        <c:forEach var="order" items="${pickup}">
            <!-- Card-->
            <div class="card border container">
                <!--NSX-->
                <div class="row">
                    <div class="col-9"></div>
                    <div class="col-3">
                        <c:choose>
                            <c:when test="${order.status == 1}">Chờ xác nhận</c:when>
                            <c:when test="${order.status == 2}">Chờ lấy hàng </c:when>
                            <c:when test="${order.status == 3}">Chờ giao hàng</c:when>
                            <c:when test="${order.status == 4}">Đã giao hàng</c:when>
                            <c:when test="${order.status == 5}">Đã nhận được hàng</c:when>
                            <c:when test="${order.status == 6}">Yêu cầu hoàn đơn - đổi trả</c:when>
                            <c:when test="${order.status == 0}">Đã hủy</c:when>
                            <c:otherwise> Trạng thái không xác định</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <hr>
                <div class="row py-4 list-products">
                    <c:forEach var="orderProduct" items="${order.products}">
                    <div class="container">
                        <!-- Sản phẩm 1-->
                        <div class="row py-3">
                            <img src="${orderProduct.thumbnail}"
                                 class="resized-image col-3">
                            <div class="col container">
                                <div class="row title">${orderProduct.title}</div>
                                <div class="row">${orderProduct.quantity}</div>
                            </div>
                            <div class="col-3 p-4">${orderProduct.price}</div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <hr>
                <!-- Tổng tiền-->
                <div class="row py-3">
                    <div class="col"></div>
                    <div class="col-3 title">
                        Thành tiền:
                    </div>
                    <div class="col-3">
                            ${order.totalPrice}
                    </div>
                </div>
                <!--Hủy hàng + Liên hệ chi tiết-->
                <div class="row py-2">
                    <div class="col"></div>
                    <div class="col-3">
                        <button type="button" class="cancel-btn">Hủy hàng</button>
                    </div>
                    <div class="col-3">
                        <button type="button" class="contact-btn">Liên hệ</button>
                    </div>
                </div>
            </div>
            <div class="p-2"></div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>
