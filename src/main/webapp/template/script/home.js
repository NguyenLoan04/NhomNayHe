let offset = 1
let amount = 5
let limitProduct

function getOneProductsRow(listProducts) {
    let productHtml = `<div class='row'>`
    for (let product of listProducts) {
        productHtml += `
            <div style="width: 20%">
                <div onclick="window.location='/product?id=${product.id}'" class="card p-2" style="cursor: pointer">
                    <img src="${product.thumbnail}" class="card-img" alt="">
                    <div class="card-body px-1">
                        <h5 class="card-title text-truncate text-center pb-2 fw-semibold" title="${product.title}">
                            ${product.title}
                        </h5>
                        <p class="card-text text-center my-1 text-truncate" 
                            title="${product.providerName}">
                            Nhà cung cấp: từ ${product.providerName}
                        </p>
                        <p class="card-text text-center text-truncate my-1"
                           title="Nguyên liệu: ${product.materials}">
                            Nguyên liệu: ${product.materials}
                        </p>
                        <p class="card-text text-center mt-1">
                            Kích thước: ${product.size}</p>
                        <p class="card-text text-center fw-semibold h4 mt-2" style="color: var(--main-cta-button)">${product.price}</p>
                    </div>
                </div>
            </div>
        `
    }
    productHtml += `</div>`
    $("#full-product__product-list").append(productHtml)
}

function sendProductRequest() {
    $.ajax({
        url: '/get-product-row',
        method: 'GET',
        data: {
            offset: offset,
            limit: limitProduct
            // amount: amount
        },
        success: function(response) {
            response = $.parseJSON(response)
            if (response.result) {
                limitProduct = response.limit ? response.limit : limitProduct
                let countProduct = response.listProducts.length
                getOneProductsRow(response.listProducts)
                //Còn cần sửa thêm
                offset = response.currentOffset
            }
            else {
                offset = -1
            }
            //Tạm
            if (offset >= limitProduct) {
                const btn = $("#full-product-button")
                btn.addClass("d-none")
                btn.attr("disabled", true)
            }
        },
        error: function(response) {

        }
    })
}

$("#full-product-button").click(function () {
    // if ($(window).scrollTop + $(window).offsetHeight + 100 > $(this).offsetHeight && offset !== -1) {
    if (offset !== -1) sendProductRequest()
})

sendProductRequest()