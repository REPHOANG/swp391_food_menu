<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <!-- meta data -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
          content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link type="image/x-icon" rel="icon" href="<c:url value="/assets/admin/images/favicon.png"/>"/>
    <link rel="shortcut icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <title>Fastkart - Add New Product</title>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <!-- Linear Icon css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/linearicon.css"/>"/>
    <!-- Fontawesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/font-awesome.css"/>"/>
    <!-- Themify icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/themify.css"/>"/>
    <!--Dropzon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/dropzone.css"/>"/>
    <!-- Feather icon css-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/feather-icon.css"/>"/>
    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/remixicon.css"/>"/>
    <!-- Select2 css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/select2.min.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/chartist.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/date-picker.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- Bootstrap-tag input css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap-tagsinput.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>

<body>
<!-- tap on top start -->
<div class="tap-top">
    <span class="lnr lnr-chevron-up"></span>
</div>
<!-- tap on tap end -->

<!-- page-wrapper start -->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <!-- Page Header Start-->
    <jsp:include page="../page-header.jsp"/>
    <!-- Page Header Ends-->
    <!-- Page Body start -->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="sidebar-wrapper">
            <div id="sidebarEffect"></div>
            <div>
                <jsp:include page="../logo.jsp"/>
                <nav class="sidebar-main">
                    <jsp:include page="../sidebar-main.jsp"/>
                </nav>
            </div>
        </div>
        <!-- Page Sidebar Ends-->
        <div class="page-body">
            <!-- New Product Add Start -->
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-8 m-auto">
                            <div class="card">
                                <div class="card-body">
                                    <c:if test="${not empty message}">
                                        <p style="color: red; font-size: 18px;">${message}</p>
                                    </c:if>
                                    <div class="card-header-2">
                                        <h5>Staff Information</h5>
                                    </div>
                                    <form class="theme-form theme-form-2 mega-form" action="./StaffController"
                                          method="post">
                                        <input class="form-control" type="hidden" name="userId"
                                               value="${staff.userId}">
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Full Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" placeholder="Full Name"
                                                       name="fullName" value="${staff.fullName}">
                                            </div>
                                        </div>
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Email</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="email" placeholder="Email "
                                                       name="email" value="${staff.email}">
                                            </div>
                                        </div>
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Phone number</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" placeholder="Phone number"
                                                       name="phone" value="${staff.phone}">
                                            </div>
                                        </div>
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Address</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" placeholder="Address"
                                                       name="address" value="${staff.address}">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-success" value="Save">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <jsp:include page="../container-fluid.jsp"/>
        </div>
        <!-- Container-fluid End -->
    </div>
    <!-- Page Body End -->
</div>
<!-- page-wrapper End -->

<!-- Modal Start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <jsp:include page="../staticBackdrop.jsp"/>
</div>
<!-- Modal End -->

<!-- latest js -->
<script src="<c:url value="/assets/admin/js/jquery-3.6.0.min.js"/>"></script>
<!-- Bootstrap js -->
<script src="<c:url value="/assets/admin/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<!-- feather icon js -->
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather-icon.js"/>"></script>
<!-- scrollbar simplebar js -->
<script src="<c:url value="/assets/admin/js/scrollbar/simplebar.js"/>"></script>
<script src="<c:url value="/assets/admin/js/scrollbar/custom.js"/>"></script>
<!-- Sidebar js -->
<script src="<c:url value="/assets/admin/js/config.js"/>"></script>
<!-- bootstrap tag-input js -->
<script src="<c:url value="/assets/admin/js/bootstrap-tagsinput.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<!-- customizer js -->
<script src="<c:url value="/assets/admin/js/customizer.js"/>"></script>
<!--Dropzon js -->
<script src="<c:url value="/assets/admin/js/dropzone/dropzone.js"/>"></script>
<script src="<c:url value="/assets/admin/js/dropzone/dropzone-script.js"/>"></script>
<!-- Plugins js -->
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<%--<script src="<c:url value="/assets/admin/js/notify/index.js"/>"></script>--%>
<!-- ck editor js -->
<script src="<c:url value="/assets/admin/js/ckeditor.js"/>"></script>
<script src="<c:url value="/assets/admin/js/ckeditor-custom.js"/>"></script>
<!-- select2 js -->
<script src="<c:url value="/assets/admin/js/select2.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/select2-custom.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<!-- Theme js -->
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
<script>
    //Kiểm tra dữ liệu đầu vào
    document.querySelector('form').addEventListener('submit', function (event) {
        // Mảng chứa tên các trường input cần kiểm tra
        const inputNames = ['fullName', 'email'];
        let isValid = true; // Biến theo dõi trạng thái hợp lệ của form
        // Lặp qua tất cả các input và select trong form
        document.querySelectorAll('input, select').forEach(function (input) {
            const inputName = input.getAttribute('name'); // Lấy tên của input hoặc select
            if (inputNames.includes(inputName)) {
                // Kiểm tra nếu input rỗng hoặc không hợp lệ
                if (!input.value.trim()) {
                    event.preventDefault(); // Ngăn form được submit nếu có trường không hợp lệ
                    input.classList.add('is-invalid'); // Thêm class Bootstrap cho trạng thái không hợp lệ
                    isValid = false; // Đánh dấu là không hợp lệ
                } else {
                    input.classList.remove('is-invalid'); // Xóa class nếu trường hợp lệ
                }
            }
        });
        // Nếu form không hợp lệ, ngăn chặn submit và hiển thị thông báo
        if (!isValid) {
            event.preventDefault(); // Ngăn form submit
            console.log('Form contains invalid inputs');
        }
    });
</script>
</body>
</html>