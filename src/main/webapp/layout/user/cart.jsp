<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common.jsp"/>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="../../template/style/user/cart.css">
    <jsp:include page="../public/library.jsp"/>
</head>
<body>
<jsp:include page="../public/header.jsp"/>
<div class="container">
    <div class="row mt-4 mb-4">
        <div class="col-8 cart">
            <div class="h3 pt-4 text-center">Giỏ hàng</div>
            <div class="row cart-title px-4">
                <div class="col-3 form-check">
                    <input class="form-check-input" type="checkbox" id="checkAll">
                    <label class="form-check-label" for="checkAll">
                        Chọn tất cả
                    </label>
                </div>
                <div class="col-3 text-center">Sản phẩm</div>
                <div class="col-3 text-center">Số lượng</div>
                <div class="col-2">Giá tiền</div>
            </div>
            <hr/>
            <c:if test="${empty cart.products}">
                <h4>Chưa có sản phẩm</h4>
            </c:if>
            <div class="cart-item-list" id="cart-container">
                <c:forEach items="${cart.products}" var="entry">
                    <div class=" row py-3 cart-item" data-width="${entry.value.price.width}"
                         data-height="${entry.value.price.height}" data-id="${entry.value.id}">
                        <div class="col-1 text-center">
                            <div class="row pb-4"></div>
                            <div class="row ps-4">
                                <div class="form-check">
                                    <input value="${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}"
                                           class="product-checkbox form-check-input" type="checkbox"
                                           onclick="updateTotalPrice()">
                                </div>
                            </div>
                        </div>
                        <img class="col-2" src="<c:url value="${entry.value.thumbnailUrl}"/>">
                        <div class="col-3 ps-5 pe-0">
                            <div class="row">${entry.value.title}</div>
                            <div class="row pb-2"></div>
                            <div class="row price-selected">
                                <label class="col-3 p-0 me-2 price-label">Loại: </label>
                                <select class=" col-7 row select-area rounded" name="select"
                                        id="size_${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}"
                                        onchange="updateProductBySize(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                    <c:forEach var="price" items="${entry.value.prices}">
                                        <c:if test="${price.width == entry.value.price.width && price.height == entry.value.price.height}">
                                            <option class="text-center me-2 rounded select-option"
                                                    data-width="${price.width}" data-height="${price.height}" selected>
                                                    ${price.width} x ${price.height}
                                            </option>
                                        </c:if>
                                        <c:if test="${price.width != entry.value.price.width && price.height!=entry.value.price.height}">
                                            <option class="text-center me-2 rounded select-option"
                                                    data-width="${price.width}" data-height="${price.height}">
                                                    ${price.width} x ${price.height}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-3 text-center">
                            <div class="row pb-4"></div>
                            <div class="row">
                                <div class="row">
                                    <div class="col-4 text-center">
                                        <button class="rounded" id="product-detail__remove-amount"
                                                onclick="updateSubByQuantity(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                            <i class="fa-solid fa-minus"></i>
                                        </button>
                                    </div>
                                    <div class="col-4 text-center product-quantity"
                                         id="quantity_${entry.value.id}_${entry.value.price.width}_${entry.value.price.height}">
                                            ${entry.value.quantity}
                                    </div>
                                    <div class="col-4 text-center">
                                        <button class="rounded" id="product-detail__add-amount"
                                                onclick="updatePlusByQuantity(${entry.value.id},${entry.value.price.width},${entry.value.price.height})">
                                            <i class="fa-solid fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col p-0">
                            <div class="row pb-4 "></div>
                            <div class="row ps-3" id="product-detail__price">${entry.value.price.price}</div>
                        </div>
                        <div class="col-1 p-0">
                            <div class="row pb-4"></div>
                            <i class="bi bi-trash"></i>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-1"></div>
        <div class="col-3 ms-0 discount_pay">
            <div class="row discount_area p-3 py-4">
                <div class="row">
                    <div class="col-8 h5">
                        <i class="bi bi-ticket-perforated me-1"></i>
                        <span>Khuyến mãi</span>
                    </div>
                    <div class="col"></div>
                    <div class="col-2 row">
                        <i class="bi bi-arrow-right-short discount-more h4 my-0"></i>
                    </div>
                </div>
                <hr>
                <div class="discounts-list">
                    <div class="row ps-3 py-2 discount-item">
                        <div class="row discount-title h6">Mã giảm giá 10K - Áp dụng cho toàn sàn</div>
                        <div class="row p-0">
                            <div class=" col-8 discount-description">Đơn từ 10.000.000.</div>
                            <div class="col-4 discount-detail">Chi tiết</div>
                        </div>
                        <div class="row mt-2">
                            <button class="apply_discount">Áp dụng</button>
                        </div>
                    </div>
                    <div class="row ps-3 py-2 discount-item">
                        <div class="row discount-title h6">Mã giảm giá 10K - Áp dụng cho toàn sàn</div>
                        <div class="row p-0">
                            <div class=" col-8 discount-description">Đơn từ 10.000.000.</div>
                            <div class="col-4 discount-detail">Chi tiết</div>
                        </div>
                        <div class="row mt-2">
                            <button class="apply_discount">Áp dụng</button>
                        </div>
                    </div>
                    <div class="row ps-3 py-2 discount-item">
                        <div class="row discount-title h6">Mã giảm giá 10K - Áp dụng cho toàn sàn</div>
                        <div class="row p-0">
                            <div class=" col-8 discount-description">Đơn từ 10.000.000.</div>
                            <div class="col-4 discount-detail">Chi tiết</div>
                        </div>
                        <div class="row mt-2">
                            <button class="apply_discount">Áp dụng</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row py-2"></div>
            <div class="row pay_area p-3">
                <div class="row pt-2">
                    <div class="col-10 h5"><i class="bi bi-cash-stack me-2"></i><span>Thành tiền</span></div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-8 h6">Tổng số tiền (đã tính VAT):</div>
                    <div class="col-4" id="total-price"></div>
                </div>
                <div class="row ps-5 py-4 ">
                    <button class="payable rounded" onclick="sendSelectedProduct()">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../public/footer.jsp"/>
<script src="../../template/script/header.js"></script>
<script src="../../template/script/cart.js"></script>
<script>
    const priceProduct = formatter.format($("#product-detail__price").prop("innerText"))
    $("#product-detail__price").text(priceProduct + "")

    // chuyển đơn vị tiền qua số
    function parseCurrencyToFloat(currency) {
        // Loại bỏ các ký tự không phải số hoặc dấu thập phân
        const cleanedString = currency.replace(/[^\d,-]/g, '').replace(',', '.');
        return parseFloat(cleanedString);
    }

    // tính tổng tiền dựa vào checkbox
    function updateTotalPrice() {
        let total = 0.0;
        let checkboxes = document.querySelectorAll(".product-checkbox:checked")
        checkboxes.forEach(function (checkbox) {
            let row = checkbox.closest('div.cart-item');  // Tìm dòng chứa checkbox
            let price = parseCurrencyToFloat(row.querySelector('#product-detail__price').textContent);  // Lấy giá sản phẩm
            console.log(price)
            let quantity = Number.parseInt(row.querySelector('div.product-quantity').textContent);  // Lấy số lượng
            console.log(quantity)
            total += price * quantity;  // Cộng tổng tiền
        });
        console.log(total)
        document.getElementById('total-price').textContent = total
        const totalPrice = formatter.format($("#total-price").prop("innerText"))
        $("#total-price").text(totalPrice + "")
    }

    // gửi sản phẩm đã chọn qua trang thanh toán (Xử lý trong thanh toán)
    function sendSelectedProduct() {
        let selectedProductId = [];
        let checkboxes = document.querySelectorAll('.product-checkbox:checked');

        checkboxes.forEach(function (checkbox) {
            selectedProductId.push(checkbox.value);
        });
        if (selectedProductId.length > 0) {
            $.ajax({
                url: "/user/purchase?selectedItems=" + selectedProductId,
                type: "GET",
                success: function () {

                },
                error: function () {

                }
            })
        }
    }

    //Servlet
    function updatePlusByQuantity(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        let quantityInput = $("div#quantity_" + productCode);
        let cartItem = quantityInput.closest(".cart-item")
        let newQuantity = Number.parseInt(quantityInput.text(), 10) + 1
        if (newQuantity === 5) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
            cartItem.find("button#product-detail__add-amount").attr("disabled", true)
        } else if (newQuantity === 1) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
        } else {
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
        }
        $.ajax({
            url: "/update-product?productCode=" + productCode + "&quantity=" + newQuantity,
            type: "POST",
            success: function () {
                quantityInput.text(newQuantity)
                console.log(newQuantity)
            },
            error: function () {

            }
        })
    }

    function updateSubByQuantity(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        let quantityInput = $("div#quantity_" + productCode);
        let cartItem = quantityInput.closest(".cart-item")
        let newQuantity = Number.parseInt(quantityInput.text(), 10) - 1
        if (newQuantity === 5) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
            cartItem.find("button#product-detail__add-amount").attr("disabled", true)
        } else if (newQuantity === 1) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
        } else {
            cartItem.find("button#product-detail__add-amount").attr("disabled", false)
            cartItem.find("button#product-detail__remove-amount").attr("disabled", false)
        }
        $.ajax({
            url: "/update-product?productCode=" + productCode + "&quantity=" + newQuantity,
            type: "POST",
            success: function () {
                quantityInput.text(newQuantity)
                console.log(newQuantity)
                window.location.reload()
            },
            error: function () {

            }
        })
    }

    function updateProductBySize(productId, width, height) {
        productCode = productId + '_' + width + '_' + height
        const sizeInput = document.querySelector("select#size_" + productCode)
        const selectedOption = sizeInput.querySelector("option:checked");
        let newWidth = selectedOption.getAttribute("data-width")
        let newHeight = selectedOption.getAttribute("data-height")
        console.log(newWidth)
        console.log(newHeight)
        $.ajax({
            url: "/update-price?productCode=" + productCode + "&width=" + newWidth + "&height=" + newHeight,
            type: "POST",
            success: function () {
                window.location.reload()
            },
            error: function () {

            }
        })
    }

    function removeProduct(element) {
        let productId = element.attr("data-id")
        let width = element.attr("data-width")
        let height = element.attr("data-height")
        productCode = productId + '_' + width + '_' + height;
        $.ajax({
            url: "/remove-product?productCode=" + productCode,
            type: "POST",
            success: function (data) {
                element.remove()
                window.location.reload()
                data = $.parseJSON(data)
                if (data.result) {
                    console.log(data)
                    const badge = $("#cart-badge")
                    const currentCartLength = data.currentCartLength
                        badge.removeClass("d-none")
                        badge.text(currentCartLength)
                    // xử lý trong controller = JsonObject
                    if ($(".cart-item").length === 0) {
                        $("#cart-badge").addClass("d-none")
                        $("#cart-container").innerHTML(`<div class="h3 ms-4">Chưa có sản phẩm</div>`)
                    }
                } else {
                    alert("Có lỗi khi xóa sản phẩm khỏi giỏ hàng")
                }
            },
            error: function () {

            }
        })
    }

    // xem lại hàm tính tổng tiền
    const price = formatter.format($("#total-price").prop("innerText"))
    $("#total-price").text(price + "")
</script>
<script>
    function update(productId, width, height) {
        let quantityInput;
        let cartItem;
        let quantity;
        quantityInput = $("div#quantity_" + productId + '_' + width + '_' + height)
        cartItem = quantityInput.closest(".cart-item")
        quantity = Number.parseInt(quantityInput.text(), 10)
        if (quantity === 5) {
            cartItem.find("button#product-detail__add-amount").attr("disabled", true)
            console.log("Full")
        } else if (quantity === 1) {
            cartItem.find("button#product-detail__remove-amount").attr("disabled", true)
            console.log("empty")
        }
    }

    <c:forEach var="entry" items="${cart.products}">
    update(${entry.value.id}, ${entry.value.price.width}, ${entry.value.price.height})
    </c:forEach>
</script>
</body>
</html>
