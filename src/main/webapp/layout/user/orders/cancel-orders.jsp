<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>

<!--Canceled Orders-->
<div id="canceledlist" class="order-details">
    <c:choose>
        <c:when test="${empty listOrder}">
            <div class="mt-5 h4 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
                Không có sản phẩm
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Thông tin sản phẩm</th>
                    <th>Kích thước</th>
                    <th>Giá tiền</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="order" items="${listOrder}">
                    <c:forEach var="product" items="${order.products}">
                        <tr>
                            <th style="width: 20%">
                                <img src="${product.thumbnail}" class="my-3 resized-image">
                            </th>
                            <th class="p-3">
                                <p class="title h5 main-color">${product.title}</p>
                                <p class="p-0">Số lượng: <span class="fw-semibold">${product.quantity}</span></p>
                            </th>
                            <th class="p-3">
                                <p>${product.width} x ${product.height} cm</p>
                            </th>
                            <th class="p-3">
                                <div class="product-price">${product.price}</div>
                            </th>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th>ID đơn hàng: <span class="fw-semibold">${order.id}</span></th>
                        <th>Trạng thái đơn hàng: <span class="fw-semibold">${order.getStatusDetail()}</span></th>
                        <th></th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th class="py-3 text-center">Thành tiền:</th>
                        <th class="py-3">
                            <span class="total-price h5 fw-semibold">${order.totalPrice}</span>
                        </th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="rounded p-2 sub-cta-button"
                                        onclick="getCancelForm(${order.id})">
                                    Hủy hàng
                                </button>
                            </div>

                        </th>
                        <th>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="rounded p-2 main-cta-button" onclick="getDetailsForm(${order.id})">
                                    Chi tiết
                                </button>
                            </div>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>
<script>
    $(document).ready(function () {
        $(".product-price").each(function (index) {
            formatPrice($(this))
        })
        $(".total-price").each(function (index) {
            formatPrice($(this))
        })
    })


    <%--<c:forEach var="order" items="${listOrder}">--%>
    <%--    formatPrice($("div#" +${order.id}).find(".total").find(".totalPrice"))--%>
    <%--    <c:forEach var="orderProduct" items="${order.products}">--%>
    <%--        formatPrice($("div#product_" +${orderProduct.id}).find(".productPrice"))--%>
    <%--    </c:forEach>--%>
    <%--</c:forEach>--%>
</script>

<%--<div id="canceledlist" class="order-details">--%>
<%--    <c:if test="${empty cancel}">--%>
<%--        <div class="h3 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">--%>
<%--            Trống--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <!-- Card-->--%>
<%--    <c:if test="${not empty cancel}">--%>
<%--        <c:forEach var="order" items="${cancel}">--%>
<%--            <div id="${order.id}" class="card container">--%>
<%--                <!--NSX-->--%>
<%--                <div class="row">--%>
<%--                    <div class="col-9"></div>--%>
<%--                    <div class="col-3">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${order.status == 1}">Chờ xác nhận</c:when>--%>
<%--                            <c:when test="${order.status == 2}">Chờ lấy hàng </c:when>--%>
<%--                            <c:when test="${order.status == 3}">Chờ giao hàng</c:when>--%>
<%--                            <c:when test="${order.status == 4}">Đã giao hàng</c:when>--%>
<%--                            <c:when test="${order.status == 5}">Đã nhận được hàng</c:when>--%>
<%--                            <c:when test="${order.status == 6}">Yêu cầu hoàn đơn - đổi trả</c:when>--%>
<%--                            <c:when test="${order.status == 0}">Đã hủy</c:when>--%>
<%--                            <c:otherwise> Trạng thái không xác định</c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--                <!--Danh sach sp trong 1 orrder-->--%>
<%--                <div class="row py-4 list-products">--%>
<%--                    <c:forEach var="orderProduct" items="${order.products}">--%>
<%--                        <div id="product_${orderProduct.id}" class="row py-3">--%>
<%--                            <img src="${orderProduct.thumbnail}"--%>
<%--                                 class="resized-image col-3">--%>
<%--                            <div class="col text-st">--%>
<%--                                <div class="title h5 main-color">${orderProduct.title}</div>--%>
<%--                                <div class="p-0">Số lượng: <span class="fw-semibold">${orderProduct.quantity}</span> </div>--%>
<%--                            </div>--%>
<%--                            <div id="productPrice" class="col-3 p-4">${orderProduct.price}</div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--                <!-- Tổng tiền-->--%>
<%--                <div class="total row py-3">--%>
<%--                    <div class="col"></div>--%>
<%--                    <div class="col-3 title">--%>
<%--                        Thành tiền:--%>
<%--                    </div>--%>
<%--                    <div id="totalPrice" class="col-3">--%>
<%--                            ${order.totalPrice}--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!--Hủy hàng + Liên hệ chi tiết-->--%>
<%--                <div class="row py-2">--%>
<%--                    <div class="col-5"></div>--%>
<%--                    <button type="button" class="rebuy_btn col-3 me-2" onclick="rebuyOrder(${order.id})">Mua lại</button>--%>
<%--                    <button class="col-3 details-btn" onclick="getDetailsForm(${order.id})">Chi tiết</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="p-2"></div>--%>
<%--        </c:forEach>--%>
<%--    </c:if>--%>
<%--</div>--%>
<%--<script>--%>
<%--    <c:forEach var="order" items="${cancel}">--%>
<%--    formatPrice($("div#" +${order.id}).find(".total").find("#totalPrice"))--%>
<%--    <c:forEach var="orderProduct" items="${order.products}">--%>
<%--    formatPrice($("div#product_" +${orderProduct.id}).find("#productPrice"))--%>
<%--    </c:forEach>--%>
<%--    </c:forEach>--%>
<%--</script>--%>
</body>
</html>
