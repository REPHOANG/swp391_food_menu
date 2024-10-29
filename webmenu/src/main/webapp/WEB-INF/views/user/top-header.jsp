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
                            <a href="" class="delivery-login-box">
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
                                    <span class="position-absolute top-0 start-100 translate-middle badge"
                                          id="cart-count">0</span>
                                </button>
                                <div class="onhover-div onhover-div-cart-list">
                                    <ul class="cart-list" id="cart-list">
                                        <!-- Danh sách sản phẩm sẽ được chèn vào đây -->
                                    </ul>
                                    <div class="price-box">
                                        <h5>Total :</h5>
                                        <h4 class="theme-color fw-bold" id="cart-total">$0.00</h4>
                                    </div>
                                    <div class="button-group">
                                        <a href="<c:url value="/ViewCartController"></c:url>"
                                           class="btn btn-sm cart-button">View Cart</a>
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
                                        <li class="product-box-contain">
                                            <a href="<c:url value="/ForgotPasswordController"></c:url>">Forgot Password</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${user != null}">
                                        <li class="product-box-contain">
                                            <a href="<c:url value="/ViewProfileController?viewProfileAction=profileActionUser"></c:url>">Profile</a>
                                        </li>
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
