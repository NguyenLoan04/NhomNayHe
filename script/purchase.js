const replacePriceRegex = /[.(VNĐ)\s]/g

$("#close-popup").click(function () {
    $("#popup").css("display", "none");
})

$("#payment-button").click(function () {
    if ($("input[type='radio'][name='paymentMethod']:checked").val() === 'bank') {
        $("#popup ").css("display", "block");
    }
})

$(".delete-product").click(function () {
    $(this).parent().parent().remove();
    let newPrice = 0;
    const remainProduct = $("section .product-price")
    remainProduct.each(function () {
        newPrice += parseInt($(this).text().replace(replacePriceRegex, ""))
    })
    const shipPrice = parseInt($("#ship-price").text().replace(replacePriceRegex, ""))
    const totalPrice = newPrice + shipPrice
    $("#remain-item").text(`(${remainProduct.length} sản phẩm)`)
    $("#product-sum-price").text(modifyPriceValue(newPrice))
    $("#total-price").text((newPrice !== 0) ? modifyPriceValue(totalPrice) : "0 VNĐ")
    if (remainProduct.length === 0) {
        $("#ship-price").text("0 VNĐ")
    }
})

function modifyPriceValue(price) {
    const priceString = price + ""
    let result = ""
    if (price < 1000) return priceString + " VNĐ"
    else {
        let cursor = priceString.length
        while (Math.trunc(price / 1000) > 0) {
            result = "." + priceString.substring(cursor-3, cursor) + result
            cursor -= 3
            price /= 1000
        }
        result = priceString.substring(cursor-3, cursor) + result
        return result + " VNĐ"
    }
}

