<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:include page="../common.jsp"/>--%>
<html>
<head>
<%--    <title>Lịch sử xem</title>--%>
<%--    <%@include file="../public/library.jsp" %>--%>
    <!-- css property -->
<%--    <link rel="stylesheet" href="../../template/style/user/account-page.css">--%>
    <link rel="stylesheet" href="../../template/style/user/style-forms/viewed-info.css">
</head>
<body>
<div id="user-viewed-info" class="content-details col">
    <div class="h3 fw-semibold p-3">Lịch sử sản phẩm đã xem</div>
    <hr>
    <div class="container p-3">
    <c:if test="${empty viewedHistory.viewedProducts}">
        <div class="h3 main-color opacity-50 d-flex justify-content-center align-items-center fw-semibold text-center">
            Bạn chưa xem sản phẩm nào
        </div>
    </c:if>
    <c:if test="${not empty viewedHistory.viewedProducts}">
            <button class="addAll-btn" onclick="addAllToCart()">Thêm tất cả vào giỏ hàng</button>
            <!--Từng sản phẩm-->
            <c:forEach var="product" items="${viewedHistory.viewedProducts}">
                <div id="${product.id}" class="row product-item p-2"
                     data-id="${product.id}"
                     data-width="${product.getMinPrice().width}" data-height="${product.getMinPrice().height}">
                    <!--Hình tỉ lệ 4:1-->
                    <img src="<c:url value="${product.getThumbnail()}"/>" alt="Artwork"
                                            class="resized-image col-3">
                    <div class="col-4 container">
                        <div class="row product_title">${product.title}</div>
                        <div class="row pt-4" id="minPrice">${product.getMinPrice().price}</div>
                    </div>
                    <div class="col-2">
                        <button class="add-to-cart"><i class="bi bi-cart-plus"></i></button>
                    </div>
                    <div class="col-2">
                        <button class="delete-btn"><i class="bi bi-trash"></i></button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>
<div id="popup" class="p-3">
    <div class="row  text-center fw-bold h5 border-bottom">
        <div class="col-11 h4 text-center">Lỗi</div>
        <i class="col-1 p-2 text-center bi bi-x-lg" onclick="closeError()"></i>
    </div>
    <div class="row mt-2 ms-2 text-center">Số lượng sản phẩm vượt mức quy định.</div>
</div>
<script src="template/script/header.js"></script>
<script>
    function formatPriceViewed(productId){
        let card;
        let product_price;
        let priceFormat;
        card= $("div#"+ productId)
        product_price= card.find("#minPrice")
        priceFormat= formatter.format(product_price.prop("innerText"))
        product_price.text(priceFormat.replaceAll("₫", "VNĐ") + "")
    }
    <c:forEach var="product" items="${viewedHistory.viewedProducts}">
    formatPriceViewed(${product.id})
    </c:forEach>

    function addToCart(element){
        let id= element.attr("data-id");
        let width = element.attr("data-width")
        let height = element.attr('data-height')
        let quantity=1
        let accountId = '${sessionScope.accountId}'
        if (accountId !== '' || accountId !== null) {
            const totalQuantity = parseInt($("#cart-badge").text())
            if (totalQuantity + 1 <= 10) {
                $.ajax({
                    url: "/user/history/add-to-cart?id=" +id+ '&width=' + width + '&height=' + height + '&quantity=' +quantity,
                    type:"POST",
                    success: function (data) {
                        data = $.parseJSON(data)
                        if (data.result) {
                            console.log(data)
                            element.remove()
                            const badge = $("#cart-badge")
                            const currentCartLength = data.currentCartLength
                            badge.removeClass("d-none")
                            badge.text(currentCartLength)
                        } else alert("Có lỗi khi thêm sản phẩm vào giỏ hàng")
                    },
                    error: function () {

                    }
                })
            }
            //Viết 1 đoạn html ở đây (popup)
            else {
                document.getElementById("popup").style.display="block";
                document.getElementById("popup-overlay").style.display = "block";
            }
        }
    }
    function addAllToCart(){
        $.ajax({
            url: "user/history/add-all-to-cart",
            type: "POST",
            success: function (){
                Array.from(document.getElementsByClassName("product-item")).forEach(element => { element.remove()});
            },
            error: function (){

            }
        })
    }
    function removeHistory(element){
        let id= element.attr("data-id");
        let accountId = '${sessionScope.accountId}'
        if (accountId !== '' || accountId !== null) {
            $.ajax({
                url:"user/history/removal-history?id=" +id,
                type:"POST",
                success: function (){
                    element.remove()
                },
                error: function (){

                }
            })
        }
    }
</script>
<script src="../../template/script/account/user-history.js"></script>
</body>
</html>
