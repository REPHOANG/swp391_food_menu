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
<div class="modal fade theme-modal view-modal" id="view" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header p-0">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="row g-sm-4 g-2">
                    <div class="col-lg-6">
                        <div class="slider-image">
                            <img src="../assets/images/product/category/1.jpg" class="img-fluid blur-up lazyload"
                                 alt="">
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="right-sidebar-modal">
                            <h4 class="title-name">Peanut Butter Bite Premium Butter Cookies 600 g</h4>
                            <h4 class="price">$36.99</h4>
                            <div class="product-rating">
                                <ul class="rating">
                                    <li>
                                        <i data-feather="star" class="fill"></i>
                                    </li>
                                    <li>
                                        <i data-feather="star" class="fill"></i>
                                    </li>
                                    <li>
                                        <i data-feather="star" class="fill"></i>
                                    </li>
                                    <li>
                                        <i data-feather="star" class="fill"></i>
                                    </li>
                                    <li>
                                        <i data-feather="star"></i>
                                    </li>
                                </ul>
                                <span class="ms-2">8 Reviews</span>
                                <span class="ms-2 text-danger">6 sold in last 16 hours</span>
                            </div>

                            <div class="product-detail">
                                <h4>Product Details :</h4>
                                <p>Candy canes sugar plum tart cotton candy chupa chups sugar plum chocolate I love.
                                    Caramels marshmallow icing dessert candy canes I love soufflé I love toffee.
                                    Marshmallow pie sweet sweet roll sesame snaps tiramisu jelly bear claw. Bonbon
                                    muffin I love carrot cake sugar plum dessert bonbon.</p>
                            </div>

                            <ul class="brand-list">
                                <li>
                                    <div class="brand-box">
                                        <h5>Brand Name:</h5>
                                        <h6>Black Forest</h6>
                                    </div>
                                </li>

                                <li>
                                    <div class="brand-box">
                                        <h5>Product Code:</h5>
                                        <h6>W0690034</h6>
                                    </div>
                                </li>

                                <li>
                                    <div class="brand-box">
                                        <h5>Product Type:</h5>
                                        <h6>White Cream Cake</h6>
                                    </div>
                                </li>
                            </ul>

                            <div class="select-size">
                                <h4>Cake Size :</h4>
                                <select class="form-select select-form-size">
                                    <option selected>Select Size</option>
                                    <option value="1.2">1/2 KG</option>
                                    <option value="0">1 KG</option>
                                    <option value="1.5">1/5 KG</option>
                                    <option value="red">Red Roses</option>
                                    <option value="pink">With Pink Roses</option>
                                </select>
                            </div>

                            <div class="modal-button">
                                <button onclick="location.href = 'cart.html';"
                                        class="btn btn-md add-cart-button icon">Add
                                    To Cart
                                </button>
                                <button onclick="location.href = 'product-left.html';"
                                        class="btn theme-bg-color view-button icon text-white fw-bold btn-md">
                                    View More Details
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Quick View Modal Box End -->

<!-- Location Modal Start -->
<div class="modal location-modal fade theme-modal" id="locationModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Choose your Delivery Location</h5>
                <p class="mt-1 text-content">Enter your address and we will specify the offer for your area.</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="location-list">
                    <div class="search-input">
                        <input type="search" class="form-control" placeholder="Search Your Area">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>

                    <div class="disabled-box">
                        <h6>Select a Location</h6>
                    </div>

                    <ul class="location-select custom-height">
                        <li>
                            <a href="javascript:void(0)">
                                <h6>Alabama</h6>
                                <span>Min: $130</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Arizona</h6>
                                <span>Min: $150</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>California</h6>
                                <span>Min: $110</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Colorado</h6>
                                <span>Min: $140</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Florida</h6>
                                <span>Min: $160</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Georgia</h6>
                                <span>Min: $120</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Kansas</h6>
                                <span>Min: $170</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Minnesota</h6>
                                <span>Min: $120</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>New York</h6>
                                <span>Min: $110</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)">
                                <h6>Washington</h6>
                                <span>Min: $130</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Location Modal End -->

<!-- Deal Box Modal Start -->
<div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header">
                <div>
                    <h5 class="modal-title w-100" id="deal_today">Deal Today</h5>
                    <p class="mt-1 text-content">Recommended deals for you.</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="deal-offer-box">
                    <ul class="deal-offer-list">
                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="shop-left-sidebar.html" class="deal-image">
                                    <img src="../assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="shop-left-sidebar.html" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-2">
                            <div class="deal-offer-contain">
                                <a href="shop-left-sidebar.html" class="deal-image">
                                    <img src="../assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="shop-left-sidebar.html" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-3">
                            <div class="deal-offer-contain">
                                <a href="shop-left-sidebar.html" class="deal-image">
                                    <img src="../assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="shop-left-sidebar.html" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="shop-left-sidebar.html" class="deal-image">
                                    <img src="../assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="shop-left-sidebar.html" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57
                                        <del>57.62</del>
                                        <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Deal Box Modal End -->

<!-- Add to cart Modal Start -->

<!-- Add to cart Modal End -->

<!-- Tap to top start -->
<div class="theme-option">
    <div class="back-to-top">
        <a id="back-to-top" href="#">
            <i class="fas fa-chevron-up"></i>
        </a>
    </div>
</div>
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
<script type="module" src="<c:url value="/assets/user/load-products.js"/>"></script>
<script src="<c:url value="/assets/user/top-header.js"/>"></script>
<script type="text/javascript">
    const userSelectedTable = {
        tableId: '${userSelectedTable.tableId}',
        tableName: '${userSelectedTable.tableName}',
        status: '${userSelectedTable.status}',
        capacity: '${userSelectedTable.capacity}'
    }
</script>
</body>

</html>