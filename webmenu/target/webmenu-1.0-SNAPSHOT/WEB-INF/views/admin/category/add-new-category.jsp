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
                                        <p>${message}</p>
                                    </c:if>
                                    <div class="card-header-2">
                                        <h5>Category Information</h5>
                                    </div>
                                    <form class="theme-form theme-form-2 mega-form" action="./CategoryManagerController"
                                          method="post">
                                        <input class="form-control" type="hidden" name="categoryId"
                                               value="${category.categoryId}">
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Category Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" placeholder="Category Name"
                                                       name="name" value="${category.name}">
                                            </div>
                                        </div>
                                        <!-- Description -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" placeholder="Description"
                                                          name="description"
                                                          id="description">${category.description}</textarea>
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
    document.querySelector('form').addEventListener('submit', function (event) {
        const inputField = document.querySelector('input[name="name"]');
        if (!inputField.value.trim()) {
            event.preventDefault(); // Prevent form submission
            inputField.classList.add('is-invalid'); // Bootstrap class for invalid state
        } else {
            inputField.classList.remove('is-invalid');
        }
    });
</script>
</body>
</html>