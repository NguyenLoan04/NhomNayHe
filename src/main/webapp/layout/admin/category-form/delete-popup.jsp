<%--
  Created by IntelliJ IDEA.
  User: MINH THU
  Date: 12/23/2024
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xóa danh mục</title>
    <%@include file="../../public/library.jsp"%>>
    <!-- css property -->
    <link rel="stylesheet" href="../../../template/style/admin/style-form/style-delete-form.css">
    <!-- DataTable -->
    <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script>

</head>
<body>
<!-- Form container -->
<div id="formContainer">
    <!-- Modal xác nhận -->
    <div id="confirmModal">
        <div class="modal-content py-4">
            <h5 class="style-title"><i class="fa-solid fa-circle-question me-2"></i>Xóa danh mục</h5>
            <hr>
            <h6 class="style-text">Bạn chắc chắn muốn xóa <span class="style-name-element">Danh mục 1</span>?</h6>
            <hr>
            <div class="text-end">
                <button class="btn-no d-inline" id="cancelBtn">Không</button>
                <button class="btn-yes d-inline" id="confirmYes">Có</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
