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
    <title>Fastkart - Order Details</title>
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
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>

<body>
<!-- tap on top start -->
<div class="tap-top">
    <i data-feather="chevrons-up"></i>
</div>
<!-- tap on tap end -->
<!-- page-wrapper Start -->
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
        <!-- tracking section start -->
        <div class="page-body">
            <!-- tracking table start -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="title-header title-header-block package-card">
                                    <div>
                                        <h5>Order #${orderDetail.orderId}</h5>
                                    </div>
                                    <div class="card-order-section">
                                        <ul>
                                            ${orderDetail.orderDate}
<%--                                            <li>6 items</li>--%>
                                            <li>Total ${orderDetail.total}</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="bg-inner cart-section order-details-table">
                                    <div class="row g-4">
                                        <div class="col-xl-8">
                                            <div class="table-responsive table-details">
                                                <table class="table cart-table table-borderless">
                                                    <tbody>
                                                    <c:forEach var="order" items="${orderDetail.orderDetailDto}">
                                                        <tr class="table-order">
                                                            <td>
                                                                <a href="javascript:void(0)">
                                                                    <img src="<c:url value='${order.url}' />"
                                                                         class="img-fluid blur-up lazyload" alt="">
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <p>Product Name</p>
                                                                <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 150px;">${order.productName}</h5>
                                                            </td>
                                                            <td>
                                                                <p>Quantity</p>
                                                                <h5>${order.quantity}</h5>
                                                            </td>
                                                            <td>
                                                                <p>Price</p>
                                                                <h5>${order.price}</h5>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h5>Subtotal :</h5>
                                                        </td>
                                                        <td>
                                                            <h4>$55.00</h4>
                                                        </td>
                                                    </tr>

                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h5>Shipping :</h5>
                                                        </td>
                                                        <td>
                                                            <h4>${orderDetail.shipping}</h4>
                                                        </td>
                                                    </tr>

                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h5>Tax(GST) :</h5>
                                                        </td>
                                                        <td>
                                                            <h4>$10.00</h4>
                                                        </td>
                                                    </tr>

                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h4 class="theme-color fw-bold">Total Price :</h4>
                                                        </td>
                                                        <td>
                                                            <h4 class="theme-color fw-bold">$6935.00</h4>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="col-xl-4">
                                            <div class="order-success">
                                                <div class="row g-4">
<%--                                                    <h4>summery</h4>--%>
<%--                                                    <ul class="order-details">--%>
<%--                                                        <li>Order ID: 5563853658932</li>--%>
<%--                                                        <li>Order Date: October 22, 2018</li>--%>
<%--                                                        <li>Order Total: $907.28</li>--%>
<%--                                                    </ul>--%>

                                                    <h4>shipping address</h4>
                                                    <ul class="order-details">
                                                        <li>${orderDetail.address}</li>
                                                    </ul>

<%--                                                    <div class="payment-mode">--%>
<%--                                                        <h4>payment method</h4>--%>
<%--                                                        <p>Pay on Delivery (Cash/Card). Cash on delivery (COD)--%>
<%--                                                            available. Card/Net banking acceptance subject to device--%>
<%--                                                            availability.</p>--%>
<%--                                                    </div>--%>

<%--                                                    <div class="delivery-sec">--%>
<%--                                                        <h3>expected date of delivery: <span>october 22, 2018</span>--%>
<%--                                                        </h3>--%>
<%--                                                        <a href="order-tracking.html">track order</a>--%>
<%--                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- section end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- tracking table end -->
            <div class="container-fluid">
                <jsp:include page="/WEB-INF/views/admin/container-fluid.jsp"/>
            </div>
        </div>
        <!-- tracking section End -->
    </div>
</div>
<!-- page-wrapper End -->

<!-- Modal start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                <p>Are you sure you want to log out?</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                <div class="button-box">
                    <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                    <button type="button" class="btn  btn--yes btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->
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
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
</body>

</html>