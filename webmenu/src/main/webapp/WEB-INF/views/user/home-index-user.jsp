<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fastkart">
    <meta name="keywords" content="Fastkart">
    <meta name="author" content="Fastkart">
    <link rel="icon" href="../assets/images/favicon/1.png" type="image/x-icon">
    <title>Shop Top Filter</title>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="<c:url value="/assets/user/css/vendors/bootstrap.css"/>"/>
    <!-- wow css -->
    <link rel="stylesheet" href="<c:url value="/assets/user/css/animate.min.css"/>"/>
    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/font-awesome.css"/>"/>
    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/feather-icon.css"/>"/>
    <!-- slick css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/slick/slick.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/slick/slick-theme.css"/>"/>
    <!-- Iconly css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/bulk-style.css"/>"/>
    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/style.css"/>"/>

    <!-- ionRangeSlider CSS -->
    <link href="https://cdn.jsdelivr.net/npm/ion-rangeslider@2.3.1/css/ion.rangeSlider.min.css" rel="stylesheet">
    <style>
        /* CSS cho thanh trượt */
        .price-filter {
            width: 300px;
            margin: 20px auto;
        }

        .price-title {
            color: #3ab497;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .price-input {
            margin-top: 15px;
        }

        .price-input input {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
        }

        /* Màu xanh cho các thành phần của thanh trượt */
        .irs--round .irs-bar {
            background-color: #3ab497;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .irs--round .irs-handle {
            background-color: #3ab497;
            border-radius: 50%;
        }

        .irs--round .irs-from,
        .irs--round .irs-to,
        .irs--round .irs-single {
            background-color: #3ab497;
            color: #fff;
            border-radius: 5px;
            padding: 5px;
            font-weight: bold;
        }

        .irs--round .irs-line {
            background-color: #f3f3f3;
        }

        .irs--round .irs-slider {
            background-color: #3ab497;
            border-radius: 50%;
        }

        .irs--round .irs-min,
        .irs--round .irs-max {
            color: #b3b3b3;
            font-size: 14px;
            padding: 2px;
            font-weight: bold;
        }
    </style>
</head>

<body>

<!-- Loader Start -->
<div class="fullpage-loader">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>
<!-- Loader End -->

<!-- Header Start -->
<header class="pb-md-4 pb-0">
    <div class="top-nav top-header sticky-header">
        <jsp:include page="top-header.jsp"/>
    </div>
</header>
<!-- Header End -->

<!-- mobile fix menu start -->
<jsp:include page="menu-section.jsp"/>
<!-- mobile fix menu end -->

<!-- Shop Section Start -->
<section class="section-b-space shop-section">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="show-button">
                    <div class="top-filter-menu-2">
                        <div class="sidebar-filter-menu" data-bs-toggle="collapse"
                             data-bs-target="#collapseExample">
                            <a href="javascript:void(0)"><i class="fa-solid fa-filter"></i> Filter Menu</a>
                        </div>

                        <div class="ms-auto d-flex align-items-center">
                            <div class="category-dropdown me-md-3">
                                <%--                                <h5 class="text-content">Sort By :</h5>--%>
                                <%--                                <div class="dropdown">--%>
                                <%--                                    <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"--%>
                                <%--                                            data-bs-toggle="dropdown">--%>
                                <%--                                        <span>Most Popular</span> <i class="fa-solid fa-angle-down"></i>--%>
                                <%--                                    </button>--%>
                                <%--                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="pop"--%>
                                <%--                                               href="javascript:void(0)">Popularity</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="low" href="javascript:void(0)">Low - High--%>
                                <%--                                                Price</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="high" href="javascript:void(0)">High - Low--%>
                                <%--                                                Price</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="rating" href="javascript:void(0)">Average--%>
                                <%--                                                Rating</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="aToz" href="javascript:void(0)">A - Z--%>
                                <%--                                                Order</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="zToa" href="javascript:void(0)">Z - A--%>
                                <%--                                                Order</a>--%>
                                <%--                                        </li>--%>
                                <%--                                        <li>--%>
                                <%--                                            <a class="dropdown-item" id="off" href="javascript:void(0)">% Off ---%>
                                <%--                                                Hight To--%>
                                <%--                                                Low</a>--%>
                                <%--                                        </li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                            </div>

                            <div class="grid-option grid-option-2">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="top-filter-category" id="collapseExample">
                    <div class="row g-sm-4 g-3">
                        <div class="col-xl-3 col-md-6">
                            <div class="category-title">
                                <h3>Price</h3>
                            </div>
                            <input type="text" class="js-range-slider" name="price" value=""/>
                            <div class="price-input">
                                <input type="text" class="js-price-display" readonly/>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="category-title">
                                <h3>Category</h3>
                            </div>
                            <ul class="category-list custom-padding custom-height">
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault5">
                                        <label class="form-check-label" for="flexCheckDefault5">
                                            <span class="name">400 to 500 g</span>
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="category-title">
                                <h3>Product Name</h3>
                            </div>
                            <input type="text" class="form-control" placeholder="Enter product name"
                                   id="searchProductName"
                                   aria-label="Product Name">
                        </div>

                        <%--                        <div class="col-xl-3 col-md-6">--%>
                        <%--                            <button id="Filter-product" onclick="filterProduct()"><span>Apply Filters</span></button>--%>
                        <%--                        </div>--%>

                    </div>
                </div>

                <div class="row g-sm-4 g-3 row-cols-xxl-5 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 product-list-section"
                     id="product-list-section">
                </div>

                <nav class="custome-pagination" id="custome-pagination">
                    <ul class="pagination justify-content-center">
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

<!-- Footer Section Start -->
<footer class="section-t-space">
    <jsp:include page="footer-section.jsp"/>
</footer>
<!-- Footer Section End -->

<!-- Quick View Modal Box Start -->
<!-- Quick View Modal Box End -->

<!-- Location Modal Start -->
<!-- Location Modal End -->

<!-- Deal Box Modal Start -->
<!-- Deal Box Modal End -->

<!-- Add to cart Modal Start -->

<!-- Add to cart Modal End -->

<!-- Tap to top start -->
<!-- Tap to top end -->

<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->
<!-- latest jquery-->
<script src="<c:url value="/assets/user/js/jquery-3.6.0.min.js"/>"></script>
<!-- jquery ui-->
<script src="<c:url value="/assets/user/js/jquery-ui.min.js"/>"></script>
<!-- Bootstrap js-->
<script src="<c:url value="/assets/user/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap/bootstrap-notify.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap/popper.min.js"/>"></script>
<!-- feather icon js-->
<script src="<c:url value="/assets/user/js/feather/feather.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/feather/feather-icon.js"/>"></script>
<!-- Lazyload Js -->
<script src="<c:url value="/assets/user/js/lazysizes.min.js"/>"></script>
<!-- Slick js-->
<script src="<c:url value="/assets/user/js/slick/slick.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/slick-animation.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/custom_slick.js"/>"></script>
<!-- Price Range Js -->
<%--<script src="<c:url value="/assets/user/js/ion.rangeSlider.min.js"/>"></script>--%>
<!-- sidebar open js -->
<script src="<c:url value="/assets/user/js/filter-sidebar.js"/>"></script>
<!-- Quantity js -->
<script src="<c:url value="/assets/user/js/quantity-2.js"/>"></script>
<!-- WOW js -->
<script src="<c:url value="/assets/user/js/wow.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/custom-wow.js"/>"></script>
<!-- script js -->
<script src="<c:url value="/assets/user/js/script.js"/>"></script>
<script src="<c:url value="/assets/user/cart-local-storage.js"/>"></script>
<script src="<c:url value="/assets/user/top-header.js"/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/ion-rangeslider@2.3.1/js/ion.rangeSlider.min.js"></script>
<script type="text/javascript">
    const userSelectedTable = {
        tableId: '${userSelectedTable.tableId}',
        tableName: '${userSelectedTable.tableName}',
        status: '${userSelectedTable.status}',
        capacity: '${userSelectedTable.capacity}'
    }
    let priceFrom = null;
    let priceTo = null;
    let productName = null;
    let categoryIds = [];
    viewCartHeaderDisplay()
    $(function () {
        var $range = $(".js-range-slider"),
            $priceDisplay = $(".js-price-display"),
            instance,
            min = 0,
            max = 10000000,
            from = priceFrom,
            to = priceTo;
        $range.ionRangeSlider({
            type: "double",
            min: min,
            max: max,
            from: from,
            to: to,
            prefix: "$. ",
            step: 50000,
            prettify_enabled: true,
            prettify_separator: ".",
            values_separator: " - ",
            force_edges: true,
            onStart: updatePriceDisplay,
            onChange: updatePriceDisplay
        });
        instance = $range.data("ionRangeSlider");

        function updatePriceDisplay(data) {
            priceFrom = data.from;
            priceTo = data.to;
            filterProduct()
            $priceDisplay.val(formatNumber(data.from) + " - " + formatNumber(data.to));
        }

        // Định dạng số với dấu chấm (.)
        function formatNumber(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }
    });

</script>
</script>
<script src="<c:url value="/assets/user/load-products.js"/>"></script>
</body>
</html>