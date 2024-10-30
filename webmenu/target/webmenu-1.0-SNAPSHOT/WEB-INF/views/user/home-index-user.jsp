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
                                <h3>Pack Size</h3>
                            </div>
                            <ul class="category-list custom-padding custom-height">
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="fruit">
                                        <label class="form-check-label" for="fruit">
                                            <span class="name">Fruits & Vegetables</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="cake">
                                        <label class="form-check-label" for="cake">
                                            <span class="name">Bakery, Cake & Dairy</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="behe">
                                        <label class="form-check-label" for="behe">
                                            <span class="name">Beverages</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="snacks">
                                        <label class="form-check-label" for="snacks">
                                            <span class="name">Snacks & Branded Foods</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="beauty">
                                        <label class="form-check-label" for="beauty">
                                            <span class="name">Beauty & Household</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="pets">
                                        <label class="form-check-label" for="pets">
                                            <span class="name">Kitchen, Garden & Pets</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="egg">
                                        <label class="form-check-label" for="egg">
                                            <span class="name">Eggs, Meat & Fish</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="food">
                                        <label class="form-check-label" for="food">
                                            <span class="name">Gourment & World Food</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="care">
                                        <label class="form-check-label" for="care">
                                            <span class="name">Baby Care</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="fish">
                                        <label class="form-check-label" for="fish">
                                            <span class="name">Fish & Seafood</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="marinades">
                                        <label class="form-check-label" for="marinades">
                                            <span class="name">Marinades</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="lamb">
                                        <label class="form-check-label" for="lamb">
                                            <span class="name">Mutton & Lamb</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="other">
                                        <label class="form-check-label" for="other">
                                            <span class="name">Port & other Meats</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="pour">
                                        <label class="form-check-label" for="pour">
                                            <span class="name">Pourltry</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="salami">
                                        <label class="form-check-label" for="salami">
                                            <span class="name">Sausages, bacon & Salami</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="category-title">
                                <h3>Price</h3>
                            </div>
                            <div class="range-slider">
                                <input type="text" class="js-range-slider" value="">
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <div class="category-title">
                                <h3>Discount</h3>
                            </div>
                            <ul class="category-list">
                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            <span class="name">upto 5%</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault1">
                                        <label class="form-check-label" for="flexCheckDefault1">
                                            <span class="name">5% - 10%</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault2">
                                        <label class="form-check-label" for="flexCheckDefault2">
                                            <span class="name">10% - 15%</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault3">
                                        <label class="form-check-label" for="flexCheckDefault3">
                                            <span class="name">15% - 25%</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault4">
                                        <label class="form-check-label" for="flexCheckDefault4">
                                            <span class="name">More than 25%</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                            </ul>
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
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault6">
                                        <label class="form-check-label" for="flexCheckDefault6">
                                            <span class="name">500 to 700 g</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault7">
                                        <label class="form-check-label" for="flexCheckDefault7">
                                            <span class="name">700 to 1 kg</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault8">
                                        <label class="form-check-label" for="flexCheckDefault8">
                                            <span class="name">120 - 150 g each Vacuum 2 pcs</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault9">
                                        <label class="form-check-label" for="flexCheckDefault9">
                                            <span class="name">1 pc</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault10">
                                        <label class="form-check-label" for="flexCheckDefault10">
                                            <span class="name">1 to 1.2 kg</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault11">
                                        <label class="form-check-label" for="flexCheckDefault11">
                                            <span class="name">2 x 24 pcs Multipack</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault12">
                                        <label class="form-check-label" for="flexCheckDefault12">
                                            <span class="name">2x6 pcs Multipack</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault13">
                                        <label class="form-check-label" for="flexCheckDefault13">
                                            <span class="name">4x6 pcs Multipack</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault14">
                                        <label class="form-check-label" for="flexCheckDefault14">
                                            <span class="name">5x6 pcs Multipack</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault15">
                                        <label class="form-check-label" for="flexCheckDefault15">
                                            <span class="name">Combo 2 Items</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault16">
                                        <label class="form-check-label" for="flexCheckDefault16">
                                            <span class="name">Combo 3 Items</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault17">
                                        <label class="form-check-label" for="flexCheckDefault17">
                                            <span class="name">2 pcs</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault18">
                                        <label class="form-check-label" for="flexCheckDefault18">
                                            <span class="name">3 pcs</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault19">
                                        <label class="form-check-label" for="flexCheckDefault19">
                                                <span class="name">2 pcs Vacuum (140 g to 180 g each
                                                    )</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault20">
                                        <label class="form-check-label" for="flexCheckDefault20">
                                            <span class="name">4 pcs</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault21">
                                        <label class="form-check-label" for="flexCheckDefault21">
                                                <span class="name">4 pcs Vacuum (140 g to 180 g each
                                                    )</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault22">
                                        <label class="form-check-label" for="flexCheckDefault22">
                                            <span class="name">6 pcs</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault23">
                                        <label class="form-check-label" for="flexCheckDefault23">
                                            <span class="name">6 pcs carton</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check ps-0 m-0 category-list-box">
                                        <input class="checkbox_animated" type="checkbox" id="flexCheckDefault24">
                                        <label class="form-check-label" for="flexCheckDefault24">
                                            <span class="name">6 pcs Pouch</span>
                                            <span class="number">(15)</span>
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
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
<script src="<c:url value="/assets/user/js/ion.rangeSlider.min.js"/>"></script>
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
<script src="<c:url value="/assets/user/load-products.js"/>"></script>
<script type="text/javascript">
    const userSelectedTable = {
        tableId: '${userSelectedTable.tableId}',
        tableName: '${userSelectedTable.tableName}',
        status: '${userSelectedTable.status}',
        capacity: '${userSelectedTable.capacity}'
    }
    viewCartHeaderDisplay()
</script>
</body>

</html>