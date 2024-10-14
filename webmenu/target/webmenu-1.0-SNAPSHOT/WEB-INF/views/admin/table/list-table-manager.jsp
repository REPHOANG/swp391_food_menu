<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
          content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <link rel="shortcut icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <title>Fastkart - Product</title>
    <!-- Google font-->
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- Fontawesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/font-awesome.css"/>"/>
    <!-- Linear Icon css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/linearicon.css"/>"/>
    <!-- Themify icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/themify.css"/>"/>
    <!-- Feather icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/feather-icon.css"/>"/>
    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/remixicon.css"/>"/>
    <!-- Data Table css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/datatables.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>
<body>
<!-- tap on top start-->
<div class="tap-top">
    <span class="lnr lnr-chevron-up"></span>
</div>
<!-- tap on tap end-->
<!-- page-wrapper Start-->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <!-- Page Header Start-->
    <jsp:include page="/WEB-INF/views/admin/page-header.jsp"/>
    <!-- Page Header Ends-->
    <!-- Page Body Start-->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="sidebar-wrapper">
            <div id="sidebarEffect"></div>
            <div>
                <jsp:include page="/WEB-INF/views/admin/logo.jsp"/>
                <nav class="sidebar-main">
                    <jsp:include page="/WEB-INF/views/admin/sidebar-main.jsp"/>
                </nav>
            </div>
        </div>
        <!-- Page Sidebar Ends-->
        <!-- Container-fluid starts-->
        <div class="page-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-table">
                            <div class="card-body">
                                <div class="title-header option-title d-sm-flex d-block">
                                    <h5>Table List</h5>
                                    <div class="right-options">
                                        <ul>
                                            <li>
                                                <a class="btn btn-solid"
                                                   href="<c:url value="TableManagerController?tableAction=addTable"/>">Add
                                                    Table</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success">
                                                ${message}
                                        </div>
                                    </c:if>
                                    <div class="table-responsive">
                                        <table class="table all-package theme-table table-product" id="table_id">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th>Table Name</th>
                                                <th>Status</th>
                                                <th>Capacity</th>
                                                <th>Option</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="table" items="${tables}">
                                                <tr>
                                                    <td>${table.tableName}</td>
                                                    <td>${table.status}</td>
                                                    <td>${table.capacity}</td>
                                                    <td>
                                                        <ul>
                                                            <li>
                                                                <a href="<c:url value='TableManagerController?tableAction=detailTable&tableId=${table.tableId}'/>">
                                                                    <i class="ri-eye-line"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <div>
                                            <c:if test="${currentPage > 1}">
                                                <a href="TableManagerController?page=${currentPage - 1}">Previous</a>
                                            </c:if>
                                            <c:set var="startPage" value="${currentPage - 2}"/>
                                            <c:set var="endPage" value="${currentPage + 2}"/>
                                            <c:if test="${startPage < 1}">
                                                <c:set var="startPage" value="1"/>
                                                <c:set var="endPage" value="${5 > totalPages ? totalPages : 5}"/>
                                            </c:if>
                                            <c:if test="${endPage > totalPages}">
                                                <c:set var="endPage" value="${totalPages}"/>
                                                <c:set var="startPage" value="${endPage - 4 > 1 ? endPage - 4 : 1}"/>
                                            </c:if>
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <c:if test="${i == currentPage}">
                                                    <strong>${i}</strong> <!-- Trang hiện tại -->
                                                </c:if>
                                                <c:if test="${i != currentPage}">
                                                    <a href="TableManagerController?page=${i}">${i}</a> <!-- Các trang khác -->
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="TableManagerController?page=${currentPage + 1}">Next</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container-fluid Ends-->
            <div class="container-fluid">
                <jsp:include page="/WEB-INF/views/admin/container-fluid.jsp"/>
            </div>
        </div>
    </div>
</div>
<!-- page-wrapper End-->

<!-- Modal Start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <jsp:include page="/WEB-INF/views/admin/staticBackdrop.jsp"/>
</div>
<!-- Modal End -->

<!-- Delete Modal Box Start -->
<div class="modal fade theme-modal remove-coupon" id="exampleModalToggle" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header d-block text-center">
                <h5 class="modal-title w-100" id="exampleModalLabel22">Are You Sure ?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="remove-box">
                    <p>The permission for the use/group, preview is inherited from the object, object will create a
                        new permission for this object</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-target="#exampleModalToggle2"
                        data-bs-toggle="modal" data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade theme-modal remove-coupon" id="exampleModalToggle2" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="exampleModalLabel12">Done!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="remove-box text-center">
                    <div class="wrapper">
                        <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                            <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                            <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
                        </svg>
                    </div>
                    <h4 class="text-content">It's Removed.</h4>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Delete Modal Box End -->
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
<!-- customizer js -->
<script src="<c:url value="/assets/admin/js/customizer.js"/>"></script>
<!-- Plugins js -->
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<!-- Theme js -->
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
</body>
</html>
