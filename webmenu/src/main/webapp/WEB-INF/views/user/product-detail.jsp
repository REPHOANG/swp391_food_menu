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
                                    <%--                                    <ul class="rating">--%>
                                    <%--                                        <li>--%>
                                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                                    <%--                                        </li>--%>
                                    <%--                                        <li>--%>
                                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                                    <%--                                        </li>--%>
                                    <%--                                        <li>--%>
                                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                                    <%--                                        </li>--%>
                                    <%--                                        <li>--%>
                                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                                    <%--                                        </li>--%>
                                    <%--                                        <li>--%>
                                    <%--                                            <i data-feather="star"></i>--%>
                                    <%--                                        </li>--%>
                                    <%--                                    </ul>--%>
                                    <%--                                    <span class="review">23 Customer Review</span>--%>
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


                            <%--                            <div class="buy-box">--%>
                            <%--                                <a href="wishlist.html">--%>
                            <%--                                    <i data-feather="heart"></i>--%>
                            <%--                                    <span>Add To Wishlist</span>--%>
                            <%--                                </a>--%>

                            <%--                                <a href="compare.html">--%>
                            <%--                                    <i data-feather="shuffle"></i>--%>
                            <%--                                    <span>Add To Compare</span>--%>
                            <%--                                </a>--%>
                            <%--                            </div>--%>

                            <div class="pickup-box">
                                <%--                                <div class="product-title">--%>
                                <%--                                    <h4>Store Information</h4>--%>
                                <%--                                </div>--%>

                                <%--                                <div class="pickup-detail">--%>
                                <%--                                    <h4 class="text-content">Lollipop cake chocolate chocolate cake dessert jujubes.--%>
                                <%--                                        Shortbread sugar plum dessert powder cookie sweet brownie.</h4>--%>
                                <%--                                </div>--%>

                                <%--                                <div class="product-info">--%>
                                <%--                                    <ul class="product-info-list product-info-list-2">--%>
                                <%--                                        <li>Type : <a href="javascript:void(0)">Black Forest</a></li>--%>
                                <%--                                        <li>SKU : <a href="javascript:void(0)">SDFVW65467</a></li>--%>
                                <%--                                        <li>MFG : <a href="javascript:void(0)">Jun 4, 2022</a></li>--%>
                                <%--                                        <li>Stock : <a href="javascript:void(0)">2 Items Left</a></li>--%>
                                <%--                                        <li>Tags : <a href="javascript:void(0)">Cake,</a> <a--%>
                                <%--                                                href="javascript:void(0)">Backery</a></li>--%>
                                <%--                                    </ul>--%>
                                <%--                                </div>--%>
                            </div>

                            <div class="paymnet-option">
                                <%--                                <div class="product-title">--%>
                                <%--                                    <h4>Guaranteed Safe Checkout</h4>--%>
                                <%--                                </div>--%>
                                <%--                                <ul>--%>
                                <%--                                    <li>--%>
                                <%--                                        <a href="javascript:void(0)">--%>
                                <%--                                            <img src="../assets/images/product/payment/1.svg"--%>
                                <%--                                                 class="blur-up lazyload" alt="">--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
                                <%--                                    <li>--%>
                                <%--                                        <a href="javascript:void(0)">--%>
                                <%--                                            <img src="../assets/images/product/payment/2.svg"--%>
                                <%--                                                 class="blur-up lazyload" alt="">--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
                                <%--                                    <li>--%>
                                <%--                                        <a href="javascript:void(0)">--%>
                                <%--                                            <img src="../assets/images/product/payment/3.svg"--%>
                                <%--                                                 class="blur-up lazyload" alt="">--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
                                <%--                                    <li>--%>
                                <%--                                        <a href="javascript:void(0)">--%>
                                <%--                                            <img src="../assets/images/product/payment/4.svg"--%>
                                <%--                                                 class="blur-up lazyload" alt="">--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
                                <%--                                    <li>--%>
                                <%--                                        <a href="javascript:void(0)">--%>
                                <%--                                            <img src="../assets/images/product/payment/5.svg"--%>
                                <%--                                                 class="blur-up lazyload" alt="">--%>
                                <%--                                        </a>--%>
                                <%--                                    </li>--%>
                                <%--                                </ul>--%>
                            </div>
                        </div>
                    </div>

                    <%--                    <div class="col-12">--%>
                    <%--                        <div class="product-section-box">--%>
                    <%--                            <ul class="nav nav-tabs custom-nav" id="myTab" role="tablist">--%>
                    <%--                                <li class="nav-item" role="presentation">--%>
                    <%--                                    <button class="nav-link active" id="description-tab" data-bs-toggle="tab"--%>
                    <%--                                            data-bs-target="#description" type="button" role="tab"--%>
                    <%--                                            aria-controls="description" aria-selected="true">Description--%>
                    <%--                                    </button>--%>
                    <%--                                </li>--%>

                    <%--                                <li class="nav-item" role="presentation">--%>
                    <%--                                    <button class="nav-link" id="info-tab" data-bs-toggle="tab"--%>
                    <%--                                            data-bs-target="#info" type="button" role="tab" aria-controls="info"--%>
                    <%--                                            aria-selected="false">Additional info--%>
                    <%--                                    </button>--%>
                    <%--                                </li>--%>

                    <%--                                <li class="nav-item" role="presentation">--%>
                    <%--                                    <button class="nav-link" id="care-tab" data-bs-toggle="tab"--%>
                    <%--                                            data-bs-target="#care" type="button" role="tab" aria-controls="care"--%>
                    <%--                                            aria-selected="false">Care Instuctions--%>
                    <%--                                    </button>--%>
                    <%--                                </li>--%>

                    <%--                                <li class="nav-item" role="presentation">--%>
                    <%--                                    <button class="nav-link" id="review-tab" data-bs-toggle="tab"--%>
                    <%--                                            data-bs-target="#review" type="button" role="tab" aria-controls="review"--%>
                    <%--                                            aria-selected="false">Review--%>
                    <%--                                    </button>--%>
                    <%--                                </li>--%>
                    <%--                            </ul>--%>

                    <%--                            <div class="tab-content custom-tab" id="myTabContent">--%>
                    <%--                                <div class="tab-pane fade show active" id="description" role="tabpanel"--%>
                    <%--                                     aria-labelledby="description-tab">--%>
                    <%--                                    <div class="product-description">--%>
                    <%--                                        <div class="nav-desh">--%>
                    <%--                                            <p>Jelly beans carrot cake icing biscuit oat cake gummi bears tart.--%>
                    <%--                                                Lemon drops carrot cake pudding sweet gummi bears. Chocolate cake--%>
                    <%--                                                tart cupcake donut topping liquorice sugar plum chocolate bar. Jelly--%>
                    <%--                                                beans tiramisu caramels jujubes biscuit liquorice chocolate. Pudding--%>
                    <%--                                                toffee jujubes oat cake sweet roll. Lemon drops dessert croissant--%>
                    <%--                                                danish cake cupcake. Sweet roll candy chocolate toffee jelly sweet--%>
                    <%--                                                roll halvah brownie topping. Marshmallow powder candy sesame snaps--%>
                    <%--                                                jelly beans candy canes marshmallow gingerbread pie.</p>--%>
                    <%--                                        </div>--%>

                    <%--                                        <div class="nav-desh">--%>
                    <%--                                            <div class="desh-title">--%>
                    <%--                                                <h5>Organic:</h5>--%>
                    <%--                                            </div>--%>
                    <%--                                            <p>vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam--%>
                    <%--                                                vestibulum morbi blandit cursus risus at ultrices mi tempus--%>
                    <%--                                                imperdiet nulla malesuada pellentesque elit eget gravida cum sociis--%>
                    <%--                                                natoque penatibus et magnis dis parturient montes nascetur ridiculus--%>
                    <%--                                                mus mauris vitae ultricies leo integer malesuada nunc vel risus--%>
                    <%--                                                commodo viverra maecenas accumsan lacus vel facilisis volutpat est--%>
                    <%--                                                velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit--%>
                    <%--                                                amet nisl suscipit adipiscing bibendum est ultricies integer quis--%>
                    <%--                                                auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet--%>
                    <%--                                                massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada--%>
                    <%--                                                proin libero nunc consequat interdum varius sit amet mattis--%>
                    <%--                                                vulputate enim nulla aliquet porttitor lacus luctus accumsan.</p>--%>
                    <%--                                        </div>--%>

                    <%--                                        <div class="banner-contain nav-desh">--%>
                    <%--                                            <img src="../assets/images/vegetable/banner/14.jpg"--%>
                    <%--                                                 class="bg-img blur-up lazyload" alt="">--%>
                    <%--                                            <div class="banner-details p-center banner-b-space w-100 text-center">--%>
                    <%--                                                <div>--%>
                    <%--                                                    <h6 class="ls-expanded theme-color mb-sm-3 mb-1">SUMMER</h6>--%>
                    <%--                                                    <h2>VEGETABLE</h2>--%>
                    <%--                                                    <p class="mx-auto mt-1">Save up to 5% OFF</p>--%>
                    <%--                                                </div>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>

                    <%--                                        <div class="nav-desh">--%>
                    <%--                                            <div class="desh-title">--%>
                    <%--                                                <h5>From The Manufacturer:</h5>--%>
                    <%--                                            </div>--%>
                    <%--                                            <p>Jelly beans shortbread chupa chups carrot cake jelly-o halvah apple--%>
                    <%--                                                pie pudding gingerbread. Apple pie halvah cake tiramisu shortbread--%>
                    <%--                                                cotton candy croissant chocolate cake. Tart cupcake caramels gummi--%>
                    <%--                                                bears macaroon gingerbread fruitcake marzipan wafer. Marzipan--%>
                    <%--                                                dessert cupcake ice cream tootsie roll. Brownie chocolate cake--%>
                    <%--                                                pudding cake powder candy ice cream ice cream cake. Jujubes soufflé--%>
                    <%--                                                chupa chups cake candy halvah donut. Tart tart icing lemon drops--%>
                    <%--                                                fruitcake apple pie.</p>--%>

                    <%--                                            <p>Dessert liquorice tart soufflé chocolate bar apple pie pastry danish--%>
                    <%--                                                soufflé. Gummi bears halvah gingerbread jelly icing. Chocolate cake--%>
                    <%--                                                chocolate bar pudding chupa chups bear claw pie dragée donut halvah.--%>
                    <%--                                                Gummi bears cookie ice cream jelly-o jujubes sweet croissant.--%>
                    <%--                                                Marzipan cotton candy gummi bears lemon drops lollipop lollipop--%>
                    <%--                                                chocolate. Ice cream cookie dragée cake sweet roll sweet roll.Lemon--%>
                    <%--                                                drops cookie muffin carrot cake chocolate marzipan gingerbread--%>
                    <%--                                                topping chocolate bar. Soufflé tiramisu pastry sweet dessert.</p>--%>
                    <%--                                        </div>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>

                    <%--                                <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">--%>
                    <%--                                    <div class="table-responsive">--%>
                    <%--                                        <table class="table info-table">--%>
                    <%--                                            <tbody>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Specialty</td>--%>
                    <%--                                                <td>Vegetarian</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Ingredient Type</td>--%>
                    <%--                                                <td>Vegetarian</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Brand</td>--%>
                    <%--                                                <td>Lavian Exotique</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Form</td>--%>
                    <%--                                                <td>Bar Brownie</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Package Information</td>--%>
                    <%--                                                <td>Box</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Manufacturer</td>--%>
                    <%--                                                <td>Prayagh Nutri Product Pvt Ltd</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Item part number</td>--%>
                    <%--                                                <td>LE 014 - 20pcs Crème Bakes (Pack of 2)</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            <tr>--%>
                    <%--                                                <td>Net Quantity</td>--%>
                    <%--                                                <td>40.00 count</td>--%>
                    <%--                                            </tr>--%>
                    <%--                                            </tbody>--%>
                    <%--                                        </table>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>

                    <%--                                <div class="tab-pane fade" id="care" role="tabpanel" aria-labelledby="care-tab">--%>
                    <%--                                    <div class="information-box">--%>
                    <%--                                        <ul>--%>
                    <%--                                            <li>Store cream cakes in a refrigerator. Fondant cakes should be--%>
                    <%--                                                stored in an air conditioned environment.--%>
                    <%--                                            </li>--%>

                    <%--                                            <li>Slice and serve the cake at room temperature and make sure--%>
                    <%--                                                it is not exposed to heat.--%>
                    <%--                                            </li>--%>

                    <%--                                            <li>Use a serrated knife to cut a fondant cake.</li>--%>

                    <%--                                            <li>Sculptural elements and figurines may contain wire supports--%>
                    <%--                                                or toothpicks or wooden skewers for support.--%>
                    <%--                                            </li>--%>

                    <%--                                            <li>Please check the placement of these items before serving to--%>
                    <%--                                                small children.--%>
                    <%--                                            </li>--%>

                    <%--                                            <li>The cake should be consumed within 24 hours.</li>--%>

                    <%--                                            <li>Enjoy your cake!</li>--%>
                    <%--                                        </ul>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>

                    <%--                                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">--%>
                    <%--                                    <div class="review-box">--%>
                    <%--                                        <div class="row g-4">--%>
                    <%--                                            <div class="col-xl-6">--%>
                    <%--                                                <div class="review-title">--%>
                    <%--                                                    <h4 class="fw-500">Customer reviews</h4>--%>
                    <%--                                                </div>--%>

                    <%--                                                <div class="d-flex">--%>
                    <%--                                                    <div class="product-rating">--%>
                    <%--                                                        <ul class="rating">--%>
                    <%--                                                            <li>--%>
                    <%--                                                                <i data-feather="star" class="fill"></i>--%>
                    <%--                                                            </li>--%>
                    <%--                                                            <li>--%>
                    <%--                                                                <i data-feather="star" class="fill"></i>--%>
                    <%--                                                            </li>--%>
                    <%--                                                            <li>--%>
                    <%--                                                                <i data-feather="star" class="fill"></i>--%>
                    <%--                                                            </li>--%>
                    <%--                                                            <li>--%>
                    <%--                                                                <i data-feather="star"></i>--%>
                    <%--                                                            </li>--%>
                    <%--                                                            <li>--%>
                    <%--                                                                <i data-feather="star"></i>--%>
                    <%--                                                            </li>--%>
                    <%--                                                        </ul>--%>
                    <%--                                                    </div>--%>
                    <%--                                                    <h6 class="ms-3">4.2 Out Of 5</h6>--%>
                    <%--                                                </div>--%>

                    <%--                                                <div class="rating-box">--%>
                    <%--                                                    <ul>--%>
                    <%--                                                        <li>--%>
                    <%--                                                            <div class="rating-list">--%>
                    <%--                                                                <h5>5 Star</h5>--%>
                    <%--                                                                <div class="progress">--%>
                    <%--                                                                    <div class="progress-bar" role="progressbar"--%>
                    <%--                                                                         style="width: 68%" aria-valuenow="100"--%>
                    <%--                                                                         aria-valuemin="0" aria-valuemax="100">--%>
                    <%--                                                                        68%--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="rating-list">--%>
                    <%--                                                                <h5>4 Star</h5>--%>
                    <%--                                                                <div class="progress">--%>
                    <%--                                                                    <div class="progress-bar" role="progressbar"--%>
                    <%--                                                                         style="width: 67%" aria-valuenow="100"--%>
                    <%--                                                                         aria-valuemin="0" aria-valuemax="100">--%>
                    <%--                                                                        67%--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="rating-list">--%>
                    <%--                                                                <h5>3 Star</h5>--%>
                    <%--                                                                <div class="progress">--%>
                    <%--                                                                    <div class="progress-bar" role="progressbar"--%>
                    <%--                                                                         style="width: 42%" aria-valuenow="100"--%>
                    <%--                                                                         aria-valuemin="0" aria-valuemax="100">--%>
                    <%--                                                                        42%--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="rating-list">--%>
                    <%--                                                                <h5>2 Star</h5>--%>
                    <%--                                                                <div class="progress">--%>
                    <%--                                                                    <div class="progress-bar" role="progressbar"--%>
                    <%--                                                                         style="width: 30%" aria-valuenow="100"--%>
                    <%--                                                                         aria-valuemin="0" aria-valuemax="100">--%>
                    <%--                                                                        30%--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="rating-list">--%>
                    <%--                                                                <h5>1 Star</h5>--%>
                    <%--                                                                <div class="progress">--%>
                    <%--                                                                    <div class="progress-bar" role="progressbar"--%>
                    <%--                                                                         style="width: 24%" aria-valuenow="100"--%>
                    <%--                                                                         aria-valuemin="0" aria-valuemax="100">--%>
                    <%--                                                                        24%--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>
                    <%--                                                    </ul>--%>
                    <%--                                                </div>--%>
                    <%--                                            </div>--%>

                    <%--                                            <div class="col-xl-6">--%>
                    <%--                                                <div class="review-title">--%>
                    <%--                                                    <h4 class="fw-500">Add a review</h4>--%>
                    <%--                                                </div>--%>

                    <%--                                                <div class="row g-4">--%>
                    <%--                                                    <div class="col-md-6">--%>
                    <%--                                                        <div class="form-floating theme-form-floating">--%>
                    <%--                                                            <input type="text" class="form-control" id="name"--%>
                    <%--                                                                   placeholder="Name">--%>
                    <%--                                                            <label for="name">Your Name</label>--%>
                    <%--                                                        </div>--%>
                    <%--                                                    </div>--%>

                    <%--                                                    <div class="col-md-6">--%>
                    <%--                                                        <div class="form-floating theme-form-floating">--%>
                    <%--                                                            <input type="email" class="form-control" id="email"--%>
                    <%--                                                                   placeholder="Email Address">--%>
                    <%--                                                            <label for="email">Email Address</label>--%>
                    <%--                                                        </div>--%>
                    <%--                                                    </div>--%>

                    <%--                                                    <div class="col-md-6">--%>
                    <%--                                                        <div class="form-floating theme-form-floating">--%>
                    <%--                                                            <input type="url" class="form-control" id="website"--%>
                    <%--                                                                   placeholder="Website">--%>
                    <%--                                                            <label for="website">Website</label>--%>
                    <%--                                                        </div>--%>
                    <%--                                                    </div>--%>

                    <%--                                                    <div class="col-md-6">--%>
                    <%--                                                        <div class="form-floating theme-form-floating">--%>
                    <%--                                                            <input type="url" class="form-control" id="review1"--%>
                    <%--                                                                   placeholder="Give your review a title">--%>
                    <%--                                                            <label for="review1">Review Title</label>--%>
                    <%--                                                        </div>--%>
                    <%--                                                    </div>--%>

                    <%--                                                    <div class="col-12">--%>
                    <%--                                                        <div class="form-floating theme-form-floating">--%>
                    <%--                                                                <textarea class="form-control"--%>
                    <%--                                                                          placeholder="Leave a comment here"--%>
                    <%--                                                                          id="floatingTextarea2"--%>
                    <%--                                                                          style="height: 150px"></textarea>--%>
                    <%--                                                            <label for="floatingTextarea2">Write Your--%>
                    <%--                                                                Comment</label>--%>
                    <%--                                                        </div>--%>
                    <%--                                                    </div>--%>
                    <%--                                                </div>--%>
                    <%--                                            </div>--%>

                    <%--                                            <div class="col-12">--%>
                    <%--                                                <div class="review-title">--%>
                    <%--                                                    <h4 class="fw-500">Customer questions & answers</h4>--%>
                    <%--                                                </div>--%>

                    <%--                                                <div class="review-people">--%>
                    <%--                                                    <ul class="review-list">--%>
                    <%--                                                        <li>--%>
                    <%--                                                            <div class="people-box">--%>
                    <%--                                                                <div>--%>
                    <%--                                                                    <div class="people-image">--%>
                    <%--                                                                        <img src="../assets/images/review/1.jpg"--%>
                    <%--                                                                             class="img-fluid blur-up lazyload"--%>
                    <%--                                                                             alt="">--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>

                    <%--                                                                <div class="people-comment">--%>
                    <%--                                                                    <a class="name"--%>
                    <%--                                                                       href="javascript:void(0)">Tracey</a>--%>
                    <%--                                                                    <div class="date-time">--%>
                    <%--                                                                        <h6 class="text-content">14 Jan, 2022 at--%>
                    <%--                                                                            12.58 AM</h6>--%>

                    <%--                                                                        <div class="product-rating">--%>
                    <%--                                                                            <ul class="rating">--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                            </ul>--%>
                    <%--                                                                        </div>--%>
                    <%--                                                                    </div>--%>

                    <%--                                                                    <div class="reply">--%>
                    <%--                                                                        <p>Icing cookie carrot cake chocolate cake--%>
                    <%--                                                                            sugar plum jelly-o danish. Dragée dragée--%>
                    <%--                                                                            shortbread tootsie roll croissant muffin--%>
                    <%--                                                                            cake I love gummi bears. Candy canes ice--%>
                    <%--                                                                            cream caramels tiramisu marshmallow cake--%>
                    <%--                                                                            shortbread candy canes cookie.<a--%>
                    <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                    <%--                                                                        </p>--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="people-box">--%>
                    <%--                                                                <div>--%>
                    <%--                                                                    <div class="people-image">--%>
                    <%--                                                                        <img src="../assets/images/review/2.jpg"--%>
                    <%--                                                                             class="img-fluid blur-up lazyload"--%>
                    <%--                                                                             alt="">--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>

                    <%--                                                                <div class="people-comment">--%>
                    <%--                                                                    <a class="name"--%>
                    <%--                                                                       href="javascript:void(0)">Olivia</a>--%>
                    <%--                                                                    <div class="date-time">--%>
                    <%--                                                                        <h6 class="text-content">01 May, 2022 at--%>
                    <%--                                                                            08.31 AM</h6>--%>
                    <%--                                                                        <div class="product-rating">--%>
                    <%--                                                                            <ul class="rating">--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                            </ul>--%>
                    <%--                                                                        </div>--%>
                    <%--                                                                    </div>--%>

                    <%--                                                                    <div class="reply">--%>
                    <%--                                                                        <p>Tootsie roll cake danish halvah powder--%>
                    <%--                                                                            Tootsie roll candy marshmallow cookie--%>
                    <%--                                                                            brownie apple pie pudding brownie--%>
                    <%--                                                                            chocolate bar. Jujubes gummi bears I--%>
                    <%--                                                                            love powder danish oat cake tart--%>
                    <%--                                                                            croissant.<a--%>
                    <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                    <%--                                                                        </p>--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>

                    <%--                                                        <li>--%>
                    <%--                                                            <div class="people-box">--%>
                    <%--                                                                <div>--%>
                    <%--                                                                    <div class="people-image">--%>
                    <%--                                                                        <img src="../assets/images/review/3.jpg"--%>
                    <%--                                                                             class="img-fluid blur-up lazyload"--%>
                    <%--                                                                             alt="">--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>

                    <%--                                                                <div class="people-comment">--%>
                    <%--                                                                    <a class="name"--%>
                    <%--                                                                       href="javascript:void(0)">Gabrielle</a>--%>
                    <%--                                                                    <div class="date-time">--%>
                    <%--                                                                        <h6 class="text-content">21 May, 2022 at--%>
                    <%--                                                                            05.52 PM</h6>--%>

                    <%--                                                                        <div class="product-rating">--%>
                    <%--                                                                            <ul class="rating">--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"--%>
                    <%--                                                                                       class="fill"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                                <li>--%>
                    <%--                                                                                    <i data-feather="star"></i>--%>
                    <%--                                                                                </li>--%>
                    <%--                                                                            </ul>--%>
                    <%--                                                                        </div>--%>
                    <%--                                                                    </div>--%>

                    <%--                                                                    <div class="reply">--%>
                    <%--                                                                        <p>Biscuit chupa chups gummies powder I love--%>
                    <%--                                                                            sweet pudding jelly beans. Lemon drops--%>
                    <%--                                                                            marzipan apple pie gingerbread macaroon--%>
                    <%--                                                                            croissant cotton candy pastry wafer.--%>
                    <%--                                                                            Carrot cake halvah I love tart caramels--%>
                    <%--                                                                            pudding icing chocolate gummi bears.--%>
                    <%--                                                                            Gummi bears danish cotton candy muffin--%>
                    <%--                                                                            marzipan caramels awesome feel. <a--%>
                    <%--                                                                                    href="javascript:void(0)">Reply</a>--%>
                    <%--                                                                        </p>--%>
                    <%--                                                                    </div>--%>
                    <%--                                                                </div>--%>
                    <%--                                                            </div>--%>
                    <%--                                                        </li>--%>
                    <%--                                                    </ul>--%>
                    <%--                                                </div>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                    </div>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
            </div>

            <div class="col-xxl-3 col-xl-4 col-lg-5 d-none d-lg-block wow fadeInUp">
                <div class="right-sidebar-box">
                    <%--                    <div class="vendor-box">--%>
                    <%--                        <div class="verndor-contain">--%>
                    <%--                            <div class="vendor-image">--%>
                    <%--                                <img src="../assets/images/product/vendor.png" class="blur-up lazyload" alt="">--%>
                    <%--                            </div>--%>

                    <%--                            <div class="vendor-name">--%>
                    <%--                                <h5 class="fw-500">Noodles Co.</h5>--%>

                    <%--                                <div class="product-rating mt-1">--%>
                    <%--                                    <ul class="rating">--%>
                    <%--                                        <li>--%>
                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                    <%--                                        </li>--%>
                    <%--                                        <li>--%>
                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                    <%--                                        </li>--%>
                    <%--                                        <li>--%>
                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                    <%--                                        </li>--%>
                    <%--                                        <li>--%>
                    <%--                                            <i data-feather="star" class="fill"></i>--%>
                    <%--                                        </li>--%>
                    <%--                                        <li>--%>
                    <%--                                            <i data-feather="star"></i>--%>
                    <%--                                        </li>--%>
                    <%--                                    </ul>--%>
                    <%--                                    <span>(36 Reviews)</span>--%>
                    <%--                                </div>--%>

                    <%--                            </div>--%>
                    <%--                        </div>--%>

                    <%--                        <p class="vendor-detail">Noodles & Company is an American fast-casual--%>
                    <%--                            restaurant that offers international and American noodle dishes and pasta.</p>--%>

                    <%--                        <div class="vendor-list">--%>
                    <%--                            <ul>--%>
                    <%--                                <li>--%>
                    <%--                                    <div class="address-contact">--%>
                    <%--                                        <i data-feather="map-pin"></i>--%>
                    <%--                                        <h5>Address: <span class="text-content">1288 Franklin Avenue</span></h5>--%>
                    <%--                                    </div>--%>
                    <%--                                </li>--%>

                    <%--                                <li>--%>
                    <%--                                    <div class="address-contact">--%>
                    <%--                                        <i data-feather="headphones"></i>--%>
                    <%--                                        <h5>Contact Seller: <span class="text-content">(+1)-123-456-789</span></h5>--%>
                    <%--                                    </div>--%>
                    <%--                                </li>--%>
                    <%--                            </ul>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <!-- Trending Product -->
                    <div class="pt-25">
                        <%--                        <div class="category-menu">--%>
                        <%--                            <h3>Trending Products</h3>--%>

                        <%--                            <ul class="product-list product-right-sidebar border-0 p-0">--%>
                        <%--                                <li>--%>
                        <%--                                    <div class="offer-product">--%>
                        <%--                                        <a href="product-left-thumbnail.html" class="offer-image">--%>
                        <%--                                            <img src="../assets/images/vegetable/product/23.png"--%>
                        <%--                                                 class="img-fluid blur-up lazyload" alt="">--%>
                        <%--                                        </a>--%>

                        <%--                                        <div class="offer-detail">--%>
                        <%--                                            <div>--%>
                        <%--                                                <a href="product-left-thumbnail.html">--%>
                        <%--                                                    <h6 class="name">Meatigo Premium Goat Curry</h6>--%>
                        <%--                                                </a>--%>
                        <%--                                                <span>450 G</span>--%>
                        <%--                                                <h6 class="price theme-color">$ 70.00</h6>--%>
                        <%--                                            </div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </li>--%>

                        <%--                                <li>--%>
                        <%--                                    <div class="offer-product">--%>
                        <%--                                        <a href="product-left-thumbnail.html" class="offer-image">--%>
                        <%--                                            <img src="../assets/images/vegetable/product/24.png"--%>
                        <%--                                                 class="blur-up lazyload" alt="">--%>
                        <%--                                        </a>--%>

                        <%--                                        <div class="offer-detail">--%>
                        <%--                                            <div>--%>
                        <%--                                                <a href="product-left-thumbnail.html">--%>
                        <%--                                                    <h6 class="name">Dates Medjoul Premium Imported</h6>--%>
                        <%--                                                </a>--%>
                        <%--                                                <span>450 G</span>--%>
                        <%--                                                <h6 class="price theme-color">$ 40.00</h6>--%>
                        <%--                                            </div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </li>--%>

                        <%--                                <li>--%>
                        <%--                                    <div class="offer-product">--%>
                        <%--                                        <a href="product-left-thumbnail.html" class="offer-image">--%>
                        <%--                                            <img src="../assets/images/vegetable/product/25.png"--%>
                        <%--                                                 class="blur-up lazyload" alt="">--%>
                        <%--                                        </a>--%>

                        <%--                                        <div class="offer-detail">--%>
                        <%--                                            <div>--%>
                        <%--                                                <a href="product-left-thumbnail.html">--%>
                        <%--                                                    <h6 class="name">Good Life Walnut Kernels</h6>--%>
                        <%--                                                </a>--%>
                        <%--                                                <span>200 G</span>--%>
                        <%--                                                <h6 class="price theme-color">$ 52.00</h6>--%>
                        <%--                                            </div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </li>--%>

                        <%--                                <li class="mb-0">--%>
                        <%--                                    <div class="offer-product">--%>
                        <%--                                        <a href="product-left-thumbnail.html" class="offer-image">--%>
                        <%--                                            <img src="../assets/images/vegetable/product/26.png"--%>
                        <%--                                                 class="blur-up lazyload" alt="">--%>
                        <%--                                        </a>--%>

                        <%--                                        <div class="offer-detail">--%>
                        <%--                                            <div>--%>
                        <%--                                                <a href="product-left-thumbnail.html">--%>
                        <%--                                                    <h6 class="name">Apple Red Premium Imported</h6>--%>
                        <%--                                                </a>--%>
                        <%--                                                <span>1 KG</span>--%>
                        <%--                                                <h6 class="price theme-color">$ 80.00</h6>--%>
                        <%--                                            </div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </li>--%>
                        <%--                            </ul>--%>
                        <%--                        </div>--%>
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