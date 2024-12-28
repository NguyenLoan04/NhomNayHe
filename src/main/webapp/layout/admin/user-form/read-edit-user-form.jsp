<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin người dùng</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../template/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../template/style/admin/style-form/style-read-edit-user-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem người dùng</h2></div>
        </div>
        <!-- tên đăng nhập -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên đăng nhập</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" placeholder="Nhập tên đăng nhập"
                                        value="tho123" required disabled>
            </div>
        </div>
        <!-- mật khẩu -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mật khẩu</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="password" id="password" class="w-100 style-input" placeholder="Nhập mật khẩu"
                                        value="1234" required disabled>
            </div>
        </div>
        <!-- họ và tên -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Họ và tên</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="name" placeholder="Nhập họ và tên"
                                        value="Nguyễn Văn Thọ" required disabled>
            </div>
        </div>
        <!-- avatar -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ảnh đại diện</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <div class="img-container">
                    <img src="../../../template/asset/image/avt-admin.png" id="avatarImage">
                </div>
            </div>
            <div class="col-1 d-none edit-hidden">
                <i class="fa-solid fa-pen-to-square icon-edit-avt" id="editAvatar"></i>
                <input type="file" value="../../../template/asset/image/avt-admin.png" accept="image/*" class="d-none"
                       id="fileInput">
            </div>
        </div>
        <!-- email -->
        <div class="row">
            <div class="col"><span class="style-title">Email</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="email" class="w-100 style-input" id="email" placeholder="Nhập email"
                                        value="tho123@gmail.com" disabled>
            </div>
        </div>
        <!-- sdt -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Số điện thoại</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="tel" class="w-100 style-input" id="phone" placeholder="Nhập số điện thoại"
                                        value="0123456789" disabled>
            </div>
        </div>
        <!-- giới tính -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Giới tính</span></div>
        </div>
        <div class="row pt-2">
            <div class="col text-end">
                <label>Nam</label>
                <input type="radio" class="gender" name="gender" value="man" checked required disabled>
            </div>
            <div class="col">
                <label>Nữ</label>
                <input type="radio" class="gender" name="gender" value="woman" required disabled>
            </div>
        </div>
        <!-- mô tả -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Mô tả</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><textarea class="w-100 style-area" id="description" placeholder="Nhập mô tả người dùng" disabled>Mô tả người dùng này</textarea>
            </div>
        </div>

        <!-- địa chỉ -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Địa chỉ<i class="fas fa-plus-circle ms-2 style-add-btn d-none edit-hidden" onclick="addAddress()"></i></span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <div id="addresses">
                    <div class="row form-group address-row mb-2">
                        <div class="row ps-5 pb-2">
                            <span class="style-label">Địa chỉ 1</span>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col"><select class="style-select" disabled>
                                    <option selected>Việt Nam</option>
                                </select></div>
                                <div class="col">
                                    <select class="style-select location" disabled>
                                        <option disabled>--Chọn thành phố--</option>
                                        <option selected>Tp. Hồ Chí Minh</option>
                                        <option>Tp 2</option>
                                        <option>Tp 3</option>
                                        <option>Tp 4</option>
                                        <option>Tp 5</option>
                                        <option>Tp 6</option>
                                        <option>Tp 7</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row pt-2">
                                <div class="col">
                                    <select class="style-select location" disabled>
                                        <option disabled>--Chọn quận/huyện--</option>
                                        <option selected>Tp. Thủ Đức</option>
                                        <option>Quận Bình Thạnh</option>
                                        <option>Quận 1</option>
                                        <option>Quận 3</option>
                                        <option>Quận 4</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <select class="style-select location" disabled>
                                        <option disabled>--Chọn xã/phường--</option>
                                        <option selected>Phường Linh Trung</option>
                                        <option>Phường 2</option>
                                        <option>Phường 3</option>
                                        <option>Phường 4</option>
                                        <option>Phường 5</option>
                                        <option>Phường 6</option>
                                        <option>Phường 7</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row pt-2" style="padding-left: 12px; padding-right: 12px">
                                <input type="text" class="style-input location" placeholder="Nhập tên đường, tòa nhà, số nhà,..."
                                       value="Khu phố 6" disabled>
                            </div>
                        </div>
                        <div class="col-1 d-none edit-hidden">
                            <i class="fa-solid fa-trash icon-del" onclick="removeAddress(this)"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ds sản phẩm yêu thích -->
        <div class="row pt-3">
            <div class="col"><span class="style-title" id="titleFavourProduct">Danh sách sản phẩm yêu thích</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select-many" id="favourProduct" multiple disabled>
                    <option>SP01 - Sản phẩm 1 - 1/1/2024</option>
                    <option>SP02 - Sản phẩm 2 - 1/1/2024</option>
                    <option>SP03 - Sản phẩm 3 - 1/1/2024</option>
                    <option>SP04 - Sản phẩm 4 - 1/1/2024</option>
                    <option>SP05 - Sản phẩm 5 - 1/1/2024</option>
                </select>
            </div>
        </div>

        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select" id="status" required disabled>
                    <option selected>Đang hoạt động</option>
                    <option>Vô hiệu hóa</option>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo tài khoản</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="2024-10-01" required disabled></div>
        </div>
        <!-- ngày cập nhật -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày cập nhật tài khoản</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="2024-10-01" disabled></div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col" id="containerCancelBtn">
                <button type="button" id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col" id="containerEditBtn">
                <button type="button" class="style-button" type="button" id="editBtn">Chỉnh sửa</button>
            </div>
        </div>
    </form>
</div>

<script src="../../../template/script/admin/user-form/read-edit-user-form.js"></script>
</body>
</html>
