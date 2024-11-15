<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="icon" href="<c:url value="/assets/admin/images/favicon.png" /> " type="image/x-icon">
    <link rel="shortcut icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <title>4FOOD - Dashboard</title>
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <!-- Linear Icon css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/linearicon.css"/>"/>
    <!-- fontawesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/font-awesome.css"/>"/>
    <!-- Themify icon css-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/themify.css"/>"/>
    <!-- ratio css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/ratio.css"/>"/>
    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/remixicon.css"/>"/>
    <!-- Feather icon css-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/feather-icon.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- vector map css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vector-map.css"/>"/>
    <!-- Slick Slider Css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/vendors/slick.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>

<body>
<!-- tap on top start -->
<div class="tap-top">
    <span class="lnr lnr-chevron-up"></span>
</div>
<!-- tap on tap end -->

<!-- page-wrapper Start-->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <!-- Page Header Start-->
    <jsp:include page="page-header.jsp"/>
    <!-- Page Header Ends-->

    <!-- Page Body Start-->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="sidebar-wrapper">
            <div>
                <jsp:include page="logo.jsp"/>
                <nav class="sidebar-main">
                    <jsp:include page="sidebar-main.jsp"/>
                </nav>
            </div>
        </div>
        <!-- Page Sidebar Ends-->

        <!-- index body start -->
        <div class="page-body">
            <div class="container-fluid">
                <div class="row">
                    <!-- chart caard section start -->
                    <div class="col-sm-6 col-xxl-3 col-lg-6">
                        <div class="main-tiles border-5 border-0  card-hover card o-hidden">
                            <div class="custome-1-bg b-r-4 card-body">
                                <div class="media align-items-center static-top-widget">
                                    <div class="media-body p-0">
                                        <span class="m-0">Total Revenue</span>
                                        <h4 class="mb-0 counter" id="revenueDisplay"></h4>
                                        <%--                                            <span class="badge badge-light-primary grow">--%>
                                        <%--                                                    <i data-feather="trending-up"></i>8.5%</span>--%>
                                        </h4>
                                    </div>
                                    <div class="align-self-center text-center">
                                        <i class="ri-database-2-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xxl-3 col-lg-6">
                        <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                            <div class="custome-2-bg b-r-4 card-body">
                                <div class="media static-top-widget">
                                    <div class="media-body p-0">
                                        <span class="m-0">Total Orders</span>
                                        <h4 class="mb-0 counter">${totalOrders}
                                            <%--                                            <span class="badge badge-light-danger grow">--%>
                                            <%--                                                    <i data-feather="trending-down"></i>8.5%</span>--%>
                                        </h4>
                                    </div>
                                    <div class="align-self-center text-center">
                                        <i class="ri-shopping-bag-3-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xxl-3 col-lg-6">
                        <div class="main-tiles border-5 card-hover border-0  card o-hidden">
                            <div class="custome-3-bg b-r-4 card-body">
                                <div class="media static-top-widget">
                                    <div class="media-body p-0">
                                        <span class="m-0">Total Products</span>
                                        <h4 class="mb-0 counter">${totalProducts}
                                            <a href="<c:url value="ProductManagerController?productAction=addProduct"/>"
                                               class="badge badge-light-secondary grow">
                                                ADD NEW</a>
                                        </h4>
                                    </div>

                                    <div class="align-self-center text-center">
                                        <i class="ri-chat-3-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xxl-3 col-lg-6">
                        <div class="main-tiles border-5 card-hover border-0 card o-hidden">
                            <div class="custome-4-bg b-r-4 card-body">
                                <div class="media static-top-widget">
                                    <div class="media-body p-0">
                                        <span class="m-0">Total Customers</span>
                                        <h4 class="mb-0 counter">${totalCustomers}
                                            <%--                                            <span class="badge badge-light-success grow">--%>
                                            <%--                                                    <i data-feather="trending-down"></i>8.5%</span>--%>
                                        </h4>
                                    </div>

                                    <div class="align-self-center text-center">
                                        <i class="ri-user-add-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card o-hidden card-hover">
                            <div class="card-header border-0 pb-1">
                                <div class="card-header-title p-0">
                                    <h4>Category</h4>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <div class="category-slider no-arrow">
                                    <c:forEach var="category" items="${listAllCategory}">
                                        <div>
                                            <div class="dashboard-category">
                                                <a href="/webmenu/CategoryManagerController?categoryAction=detailCategory&categoryId=${category.categoryId}"
                                                   class="category-name">
                                                    <h6>${category.name}</h6>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- chart card section End -->


                    <!-- Earning chart star-->
                    <%--                    <div class="col-xl-6">--%>
                    <%--                        <div class="card o-hidden card-hover">--%>
                    <%--                            <div class="card-header border-0 pb-1">--%>
                    <%--                                <div class="card-header-title">--%>
                    <%--                                    <h4>Revenue Report</h4>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="card-body p-0">--%>
                    <%--                                <div id="report-chart"></div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <!-- Earning chart  end-->


                    <!-- Best Selling Product Start -->
                    <div class="col-xl-6 col-md-12">
                        <div class="card o-hidden card-hover">
                            <div class="card-header card-header-top card-header--2 px-0 pt-0">
                                <div class="card-header-title">
                                    <h4>Best Selling Product</h4>
                                    <p>Start Date: <input type="date" id="start-date-best-selling"></p>
                                    <p>End Date: <input type="date" id="end-date-best-selling"></p>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <div>
                                    <div class="table-responsive">
                                        <table class="best-selling-table w-image
                                            w-image
                                            w-image table border-0" id="table-best-selling-product">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <div class="product-name">
                                                        <h5>${product.productName}</h5>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="product-detail-box">
                                                        <h6>Price</h6>
                                                        <h5>${product.price}</h5>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="product-detail-box">
                                                        <h6>Orders</h6>
                                                        <h5>${product.orders}</h5>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div class="product-detail-box">
                                                        <h6>Amount</h6>
                                                        <h5>${product.amount}</h5>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Best Selling Product End -->


                    <!-- Recent orders start-->
                    <div class="col-xl-6">
                        <div class="card o-hidden card-hover">
                            <div class="card-header card-header-top card-header--2 px-0 pt-0">
                                <div class="card-header-title">
                                    <h4>Recent Orders</h4>
                                    <p>Start Date: <input type="date" id="start-date-recent-orders"></p>
                                    <p>End Date: <input type="date" id="end-date-recent-orders"></p>
                                </div>
                            </div>

                            <div class="card-body p-0">
                                <div>
                                    <div class="table-responsive">
                                        <table class="best-selling-table table border-0" id="table-recent-orders">
                                            <tbody>
                                            <!-- Dữ liệu sẽ được thêm vào đây bởi JS -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Recent orders end-->

                   
                </div>
            </div>
            <!-- Container-fluid Ends-->

            <!-- footer start-->
            <div class="container-fluid">
                <jsp:include page="container-fluid.jsp"/>
            </div>
            <!-- footer End-->
        </div>
        <!-- index body end -->
    </div>
    <!-- Page Body End -->
</div>
<!-- page-wrapper End-->

<!-- Modal Start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <jsp:include page="staticBackdrop.jsp"/>
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
<!-- Sidebar jquery -->
<script src="<c:url value="/assets/admin/js/config.js"/>"></script>
<!-- tooltip init js -->
<script src="<c:url value="/assets/admin/js/tooltip-init.js"/>"></script>
<!-- Plugins JS -->
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<!-- Apexchar js -->
<script src="<c:url value="/assets/admin/js/chart/apex-chart/apex-chart1.js"/>"></script>
<script src="<c:url value="/assets/admin/js/chart/apex-chart/moment.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/chart/apex-chart/apex-chart.js"/>"></script>
<script src="<c:url value="/assets/admin/js/chart/apex-chart/stock-prices.js"/>"></script>
<script src="<c:url value="/assets/admin/js/chart/apex-chart/chart-custom1.js"/>"></script>
<!-- slick slider js -->
<script src="<c:url value="/assets/admin/js/slick.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/custom-slick.js"/>"></script>
<!-- customizer js -->
<script src="<c:url value="/assets/admin/js/customizer.js"/>"></script>
<!-- ratio js -->
<script src="<c:url value="/assets/admin/js/ratio.js"/>"></script>
<!-- sidebar effect -->
<%--<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>--%>
<!-- Theme js -->
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
<script type="text/javascript">
    const totalRevenue = ${totalRevenue}; // Example total revenue value
    document.getElementById("revenueDisplay").textContent = totalRevenue.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND'
    });
</script>
<script src="<c:url value="/assets/admin/home-admin.js"/>"></script>
</body>
</html>