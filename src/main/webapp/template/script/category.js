let pathName = window.location.href.split("/")
let patternName = pathName[pathName.length - 1] //Lấy pattern name ra. Nếu không có phần này thì servlet bắt lỗi
let currentPage = 1 //Trang hiện tại
let maxPage
const amount = 15 //Số lượng sp/trang cần display
let isFilterUsed = false

$("#remove-filter").click(function () {
    $("input[type=text]").val("");
    $("input[type=radio]").prop('checked', false);
    $("input[type=checkbox]").prop('checked', false);
    $("#provider-filter").prop('selectedIndex',0);
})

$("#filter-btn").click(() => {
    if (!isFilterUsed) {
        currentPage = 1
        isFilterUsed = true
    }
    filterProduct(currentPage)
})

//Sẽ gộp
function filterProduct(page) {
    $.ajax({
        url: '/category-filter',
        method: 'GET',
        data: {
            patternName: patternName,
            listTopic: getListChoosenTopic(),
            rating: getChoosenRating(),
            fromPrice: $("#filter-price-from").val(),
            toPrice: $("#filter-price-to").val(),
            amount: amount,
            page: page,
            maxPage: maxPage,
            providerName: $("#provider-filter").val()
        },
        success: function (response) {
            response = $.parseJSON(response)
            if (response.result) {
                maxPage = response.maxPage
                //Thêm product vào category
                getOneProductsRow(response.listProducts)
                currentPage = response.currentPage

                $("#current-page").text((currentPage) + "")
                //Disable và enable các button chuyển trang
                if (currentPage === 1) {
                    $("#prev-page").addClass("disabled")
                    $("#next-page").removeClass("disabled")
                }
                if (currentPage === maxPage && maxPage !== 1) {
                    $("#next-page").addClass("disabled")
                    $("#prev-page").removeClass("disabled")
                }
                if (maxPage === 1) {
                    $("#next-page").addClass("disabled")
                    $("#prev-page").addClass("disabled")
                }
                //Set active cho button category đang chọn
                $(".category-element").each(function () {
                    if ($(this).data("categoryName") === patternName) {
                        $(this).addClass("active")
                    }
                })
            } else {
                $("#category-displayed-product").html(`<p class="d-flex justify-content-center align-items-center">${response.notice}</p>`)
            }
        },
        error: function (response) {

        }
    })
}

function getListChoosenTopic() {
    const listTopic = $("input[type=checkbox][name=topic-filter]:checked")
    if (listTopic.length === 0) return ''
    const result = []
    listTopic.each(function() {
        result.push(parseInt($(this).val()))
    })
    return result + ""

}

function getChoosenRating() {
    return $("input[type=radio][name=rating-star]:checked").first().val()
}

function getOneProductsRow(listProducts) {
    let productHtml = `<div class='row'>`
    for (let product of listProducts) {
        productHtml += `
            <div style="width: calc(100%/3)" class="mb-3">
                <div onclick="window.location='/product?id=${product.id}'" class="card p-2" style="cursor: pointer">
                    <img src="${product.thumbnail}" class="card-img" alt="">
                    <div class="card-body px-1">
                        <h5 class="card-title text-truncate text-center pb-2 fw-semibold" title="${product.title}">
                            ${product.title}
                        </h5>
                        <p class="card-text text-center my-1 text-truncate" 
                            title="${product.providerName}">
                            Nhà cung cấp: <span class="fw-semibold">${product.providerName}</span>
                        </p>
                        <p class="card-text text-center text-truncate my-1"
                           title="Nguyên liệu: ${product.materials}">
                            Nguyên liệu: <span class="fw-semibold">${product.materials}</span>
                        </p>
                        <p class="card-text text-center mt-1">
                            Kích thước: từ <span class="fw-semibold">${product.size}</span>
                        </p>
                        <p class="card-text text-center text-truncate fw-semibold h4 mt-2" style="color: var(--main-cta-button)">${product.price}</p>
                    </div>
                </div>
            </div>
        `
    }
    productHtml += `</div>`
    $("#category-displayed-product").html(productHtml)
}


$("#prev-page").click(function () {
    filterProduct(--currentPage)
})

$("#next-page").click(function () {
    filterProduct(++currentPage)
})

filterProduct(currentPage)

function changeCategoryName(pattern) {
    let url = window.location.href
    url = url.substring(0, url.lastIndexOf("/") + 1) + pattern
    if (patternName !== pattern) {
        window.history.pushState({}, '', url)
        patternName = pattern
        currentPage = 1
        maxPage = null
        filterProduct(currentPage)
    }
}

$(".category-element").click(function () {
    $(".category-element").removeClass("category-active");
    $(this).addClass("category-active");
    $("#category-title").text($(this).text());
    $("#breadcrumb-current").text($(this).text())
    document.title = $(this).text() + " - Nét Việt"
    changeCategoryName($(this).attr("data-categoryName"))
})