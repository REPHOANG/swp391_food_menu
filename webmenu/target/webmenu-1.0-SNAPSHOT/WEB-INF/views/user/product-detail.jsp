<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <title>Product Left Thumbnail</title>

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

<!-- Breadcrumb Section Start -->
<!-- Breadcrumb Section End -->

<!-- Product Left Sidebar Start -->
<section class="product-section">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-xxl-9 col-xl-8 col-lg-7 wow fadeInUp">
                <div class="row g-4">
                    <div class="col-xl-6 wow fadeInUp">
                        <div class="product-left-box">
                            <div class="row g-2">
                                <div class="col-xxl-10 col-lg-12 col-md-10 order-xxl-2 order-lg-1 order-md-2">
                                    <div class="product-main-2 no-arrow">
                                        <div>
                                            <div class="slider-image">
                                                <img src="${product.mainImg.url}"
                                                     id="img-1"
                                                     data-zoom-image="${product.mainImg.url}"
                                                     class="img-fluid image_zoom_cls-0 blur-up lazyload" alt="">
                                            </div>
                                        </div>
                                        <c:forEach var="img" items="${product.imgs}">
                                            <div>
                                                <div class="slider-image">
                                                    <img src="${img.url}"
                                                         data-zoom-image="${img.url}"
                                                         class="img-fluid image_zoom_cls-1 blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <div class="col-xxl-2 col-lg-12 col-md-2 order-xxl-1 order-lg-2 order-md-1">
                                    <div class="left-slider-image-2 left-slider no-arrow slick-top">
                                        <div>
                                            <div class="sidebar-image">
                                                <img src="${product.mainImg.url}"
                                                     class="img-fluid blur-up lazyload" alt="">
                                            </div>
                                        </div>
                                        <c:forEach var="img" items="${product.imgs}">
                                            <div>
                                                <div class="sidebar-image">
                                                    <img src="${img.url}"
                                                         class="img-fluid blur-up lazyload" alt="">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="right-box-contain">
                            <%--                            <h6 class="offer-top">30% Off</h6>--%>
                            <h2 class="name">${product.name}</h2>
                            <div class="price-rating">
                                <h3 class="theme-color price">
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"
                                                      minFractionDigits="0"/>
                                </h3>
                                <%--                                    <del class="text-content">$58.46</del>--%>
                                <div class="product-rating custom-rate">
                                 
                                </div>
                            </div>

                            <div class="procuct-contain">
                                <p>${product.description}</p>
                            </div>

                            <div class="product-packege">
                            </div>

                            <div class="time deal-timer product-deal-timer mx-md-0 mx-auto" id="clockdiv-1"
                                 data-hours="1" data-minutes="2" data-seconds="3">
                            </div>
                            <input type="number" id="product-id" value="${product.productId}" style="display: none;">
                            <div class="note-box product-packege"
                                 data-product-id="${product.productId}"
                                 data-product-name="${product.name}"
                                 data-product-category="${product.categoryName}"
                                 data-product-price="${product.price}"
                                 data-product-img="${product.mainImg.url}">
                                <div class="cart_qty qty-box product-qty" style="display: none;">
                                    <div class="input-group">
                                        <button type="button" class="qty-left-minus" onclick="qtyLeftMinusProductDetail(${product.productId})" data-type="minus" data-field="">
                                            <i class="fa fa-minus" aria-hidden="true"></i>
                                        </button>
                                        <input class="form-control input-number qty-input" type="text" id="quantity-${product.productId}" name="quantity"
                                               value="1">
                                        <button type="button" class="qty-right-plus" onclick="qtyRightPlusProductDetail(${product.productId})" data-type="plus" data-field="">
                                            <i class="fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
                                <button class="btn btn-md bg-dark cart-button text-white w-100" id="cart-button"
                                        onclick="addToCartProductDetail(this)">Add To Cart
                                </button>
                            </div>


                         

                            <div class="pickup-box">
                              
                            </div>

                            <div class="paymnet-option">
                                
                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>

            <div class="col-xxl-3 col-xl-4 col-lg-5 d-none d-lg-block wow fadeInUp">
                <div class="right-sidebar-box">
                   
                    <!-- Trending Product -->
                    <div class="pt-25">
                      
                    </div>

                    <!-- Banner Section -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Left Sidebar End -->

<!-- Releted Product Section Start -->
<section class="product-list-section section-b-space">
    <div class="container-fluid-lg">
    </div>
</section>
<!-- Releted Product Section End -->

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

<!-- Sticky Cart Box Start -->
<!-- Sticky Cart Box End -->
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
<script src="<c:url value="/assets/user/js/custom-slick-animated.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/custom_slick.js"/>"></script>
<!-- Price Range Js -->
<script src="<c:url value="/assets/user/js/ion.rangeSlider.min.js"/>"></script>
<!-- sidebar open js -->
<script src="<c:url value="/assets/user/js/filter-sidebar.js"/>"></script>
<!-- Quantity js -->
<script src="<c:url value="/assets/user/js/quantity-2.js"/>"></script>
<!-- Zoom Js -->
<script src="<c:url value="/assets/user/js/jquery.elevatezoom.js"/>"></script>
<script src="<c:url value="/assets/user/js/zoom-filter.js"/>"></script>
<!-- Timer Js -->
<script src="<c:url value="/assets/user/js/timer1.js"/>"></script>
<!-- Sticky-bar js -->
<script src="<c:url value="/assets/user/js/sticky-cart-bottom.js"/>"></script>
<!-- WOW js -->
<script src="<c:url value="/assets/user/js/wow.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/custom-wow.js"/>"></script>
<!-- script js -->
<script src="<c:url value="/assets/user/js/script.js"/>"></script>
<script src="<c:url value="/assets/user/cart-local-storage.js"/>"></script>
<script src="<c:url value="/assets/user/top-header.js"/>"></script>
<script src="<c:url value="/assets/user/view-cart-user.js"/>"></script>
<script src="<c:url value="/assets/user/product-detail-user.js"/>"></script>
<script type="text/javascript">
    viewCartHeaderDisplay()
</script>
</body>
</html>