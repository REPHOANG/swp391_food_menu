<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid-lg">
    <div class="row">
        <div class="col-12">
            <div class="navbar-top">
                <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
                        data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                </button>
                <a href="<c:url value="MainController"/>" class="web-logo nav-logo">
                    <img src="<c:url value='/assets/user/images/logo/1.png'/>"
                         class="img-fluid blur-up lazyload" alt="">
                </a>
                <div class="middle-box">
                </div>

                <div class="rightside-box">
                    <div class="search-full">
                        <div class="input-group">
                                        <span class="input-group-text">
                                            <i data-feather="search" class="font-light"></i>
                                        </span>
                            <input type="text" class="form-control search-type" placeholder="Search here..">
                            <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                        </span>
                        </div>
                    </div>
                    <ul class="right-side-menu">
                        <li class="right-side">
                            <div class="delivery-login-box">
                                <div class="delivery-icon">
                                    <div class="search-box">
                                        <i data-feather="search"></i>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="right-side">
                            <a href="contact-us.html" class="delivery-login-box">
                                <div class="delivery-icon">
                                    <i data-feather="phone-call"></i>
                                </div>
                                <div class="delivery-detail">
                                    <h6>24/7 Delivery</h6>
                                    <h5>+91 888 104 2340</h5>
                                </div>
                            </a>
                        </li>
                        <li class="right-side">
                            <div class="onhover-dropdown header-badge">
                                <button type="button" class="btn p-0 position-relative header-wishlist">
                                    <i data-feather="shopping-cart"></i>
                                    <span class="position-absolute top-0 start-100 translate-middle badge">2
                                                    <span class="visually-hidden">unread messages</span>
                                                </span>
                                </button>
                                <div class="onhover-div">
                                    <ul class="cart-list">
                                        <li class="product-box-contain">
                                            <div class="drop-cart">
                                                <a href="product-left-thumbnail.html" class="drop-image">
                                                    <img src="../assets/images/vegetable/product/1.png"
                                                         class="blur-up lazyload" alt="">
                                                </a>

                                                <div class="drop-contain">
                                                    <a href="product-left-thumbnail.html">
                                                        <h5>Fantasy Crunchy Choco Chip Cookies</h5>
                                                    </a>
                                                    <h6><span>1 x</span> $80.58</h6>
                                                    <button class="close-button close_button">
                                                        <i class="fa-solid fa-xmark"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </li>

                                        <li class="product-box-contain">
                                            <div class="drop-cart">
                                                <a href="product-left-thumbnail.html" class="drop-image">
                                                    <img src="../assets/images/vegetable/product/2.png"
                                                         class="blur-up lazyload" alt="">
                                                </a>

                                                <div class="drop-contain">
                                                    <a href="product-left-thumbnail.html">
                                                        <h5>Peanut Butter Bite Premium Butter Cookies 600 g
                                                        </h5>
                                                    </a>
                                                    <h6><span>1 x</span> $25.68</h6>
                                                    <button class="close-button close_button">
                                                        <i class="fa-solid fa-xmark"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>

                                    <div class="price-box">
                                        <h5>Total :</h5>
                                        <h4 class="theme-color fw-bold">$106.58</h4>
                                    </div>

                                    <div class="button-group">
                                        <a href="cart.html" class="btn btn-sm cart-button">View Cart</a>
                                        <a href="checkout.html" class="btn btn-sm cart-button theme-bg-color
                                                    text-white">Checkout</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="right-side onhover-dropdown">
                            <div class="delivery-login-box">
                                <div class="delivery-icon">
                                    <i data-feather="user"></i>
                                </div>
                                <div class="delivery-detail">
                                    <h6>Hello <c:if test="${user != null}">: ${user.email}</c:if></h6>
                                    <h5>My Account</h5>
                                </div>
                            </div>

                            <div class="onhover-div onhover-div-login">
                                <ul class="user-box-name">
                                    <c:if test="${user == null}">
                                        <li class="product-box-contain">
                                            <i></i>
                                            <a href="<c:url value="/LoginWebController"></c:url>">Log In</a>
                                        </li>
                                        <li class="product-box-contain">
                                            <a href="<c:url value="/SignUpUserController"></c:url>">Register</a>
                                        </li>
                                    </c:if>
                                    <li class="product-box-contain">
                                        <a href="<c:url value="/ForgotPasswordController"></c:url>">Forgot Password</a>
                                    </li>
                                    <c:if test="${user != null}">
                                        <li class="product-box-contain">
                                            <a href="<c:url value="/LoginWebController?loginAction=logout"></c:url>">Log
                                                out</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
