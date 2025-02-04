
// Xem từng mục đơn hàng
$(".order-item").click(function () {
    // $(".order-item").removeClass("on");
    // $(this).addClass("on");
    // //Get content each item
    // var orders = $(this).data('target');
    // $(".order-details").hide()
    // return $("#" + orders).show();
    let url = $(this).attr("data-url")
    $(".order-item").removeClass("on");
    $(this).addClass("on");
    $.ajax({
        url: url,
        type:"GET",
        success: function (data){
            $("#orderContent").html(data)
        },
        error:function (){
            alert("Không thể tải trang")
        }
    })

})


// Chi tiết hủy hàng
function getCancelForm(orderId){
    $("#user-ordered-list").addClass("d-none")
    $("#cancel-form").removeClass("d-none")
    $.ajax({
        url:"/user/get-cancel-form",
        type: "GET",
        data:{
            "orderId": orderId
        },
        success: function (data){
            $("#cancel-form").html(data)
        },
        error: function (){
            alert("Không tìm thấy order")
        }
    })
}

// Chi tiết đơn hàng
function getDetailsForm(orderId,canceled){
    $("#user-ordered-list").addClass("d-none")
    $("#order-detail").removeClass("d-none")
    $.ajax({
        url:"/user/get-order-detail",
        type:"GET",
        data:{
            "orderId": orderId
        },
        success: function (data){
            $("#order-detail").html(data)
        },
        error: function () {
            alert("Không tìm thấy chi tiết đơn hàng")
        }

    })
}
