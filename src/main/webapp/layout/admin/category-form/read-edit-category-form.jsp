<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xem và Sửa thông tin danh mục</title>
    <%@include file="../../public/library.jsp"%>
    <!-- css property -->
    <link rel="stylesheet" href="../../../template/style/admin/style-form/general-form.css">
    <link rel="stylesheet" href="../../../template/style/admin/style-form/style-read-edit-category-form.css">

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- enter code -->
    <form class="form-container">
        <div class="row pt-3">
            <div class="col"><h2 class="style-big-title" id="title">Xem danh mục</h2></div>
        </div>
        <!-- tên danh mục -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Tên danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="text" class="w-100 style-input" id="nameCategory" placeholder="Nhập tên danh mục" value="Tranh thêu phong cảnh" required disabled>
            </div>
        </div>
        <!-- ds sản phẩm thuộc danh mục -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Sản phẩm thuộc danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <table id="myCategoryEditTable" class="w-100">
                    <thead>
                    <tr>
                        <th class="text-center">STT</th>
                        <th class="text-center">Mã sản phẩm</th>
                        <th class="text-center">Tên sản phẩm</th>
                        <th class="text-center">Ngày thêm</th>
                        <th class="text-center d-none edit-hidden">Xóa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>SP01</td>
                        <td>Tranh thêu sông nước</td>
                        <td>1/2/2024</td>
                        <td class="d-none edit-hidden">
                            <input type="checkbox" style="width: 15px; height: 15px">
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>SP02</td>
                        <td>Tranh thêu sông nước</td>
                        <td>1/2/2024</td>
                        <td class="d-none edit-hidden">
                            <input type="checkbox" style="width: 15px; height: 15px">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- thêm sp vào danh mục -->
        <div class="row pt-3 d-none add-product edit-hidden">
            <div class="col"><span class="style-title">Thêm sản phẩm thuộc danh mục (Chọn nhiều)</span></div>
        </div>
        <div class="row pt-2 d-none add-product edit-hidden">
            <div class="col p-0">
                <select class="style-select-many" id='addProduct' name="products" multiple>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                    <option>Tranh thêu phong cảnh</option>
                </select>
            </div>
        </div>
        <!-- trạng thái -->
        <div class="row pt-2">
            <div class="col"><span class="style-title">Trạng thái</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0">
                <select class="style-select status-category" required disabled>
                    <option selected>Đang hoạt động</option>
                    <option>Vô hiệu hóa</option>
                </select>
            </div>
        </div>
        <!-- ngày tạo -->
        <div class="row pt-3">
            <div class="col"><span class="style-title">Ngày tạo danh mục</span></div>
        </div>
        <div class="row pt-2">
            <div class="col p-0"><input type="date" class="w-100 style-input" value="2024-10-30" required disabled></div>
        </div>

        <div class="row pt-4 pb-4">
            <div class="col" id="containerCancelBtn">
                <button type="button" id="cancelBtn" class="style-cancel-btn">Hủy</button>
            </div>
            <div class="col" id="containerEditBtn">
                <button type="button" class="style-button" id="editBtn">Chỉnh sửa</button>
            </div>
        </div>
    </form>

    <!-- khi bấm nút chỉnh sửa thì hiện ra 2 select gồm select chứa sản phẩm thuộc danh mục
 và select còn lại chứa các sản phẩm không thuôc danh mục đó (có thể thêm sp vào danh mục) -->

</div>

<script src="../../../template/script/admin/category-form/read-edit-category-form.js"></script>
</body>
</html>
