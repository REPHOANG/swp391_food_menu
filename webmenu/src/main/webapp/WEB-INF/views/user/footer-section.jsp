<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid-lg">
    <div class="service-section">
        <div class="row g-3">
            <div class="col-12">
                <div class="service-contain">
                    <div class="service-box">
                        <div class="service-image">
                            <img src="<c:url value='/assets/user/svg/product.svg'/>" class="blur-up lazyload" alt="">
                        </div>

                        <div class="service-detail">
                            <h5>Every Fresh Products</h5>
                        </div>
                    </div>

                    <div class="service-box">
                        <div class="service-image">
                            <img src="<c:url value='/assets/user/svg/delivery.svg'/>" class="blur-up lazyload" alt="">
                        </div>

                        <div class="service-detail">
                            <h5>Free Delivery For Order Over $50</h5>
                        </div>
                    </div>

                    <div class="service-box">
                        <div class="service-image">
                            <img src="<c:url value='/assets/user/svg/discount.svg'/>" class="blur-up lazyload" alt="">
                        </div>

                        <div class="service-detail">
                            <h5>Daily Mega Discounts</h5>
                        </div>
                    </div>

                    <div class="service-box">
                        <div class="service-image">
                            <img src="<c:url value='/assets/user/svg/market.svg'/>" class="blur-up lazyload" alt="">
                        </div>

                        <div class="service-detail">
                            <h5>Best Price On The Market</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-footer section-b-space section-t-space">
        <div class="row g-md-4 g-3">
            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="footer-logo">
                    <div class="theme-logo">
                        <a href="index.html">
                            <img src="../assets/images/logo/1.png" class="blur-up lazyload" alt="">
                        </a>
                    </div>

                    <div class="footer-logo-contain">
                        <p>We are a friendly bar serving a variety of cocktails, wines and beers. Our bar is a
                            perfect place for a couple.</p>

                        <ul class="address">
                            <li>
                                <i data-feather="home"></i>
                                <a href="javascript:void(0)">1418 Riverwood Drive, CA 96052, US</a>
                            </li>
                            <li>
                                <i data-feather="mail"></i>
                                <a href="javascript:void(0)">support@fastkart.com</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
            </div>
            <div class="col-xl col-lg-2 col-sm-3">
            </div>
            <div class="col-xl-2 col-sm-3">
            </div>

            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="footer-title">
                    <h4>Contact Us</h4>
                </div>

                <div class="footer-contact">
                    <ul>
                        <li>
                            <div class="footer-number">
                                <i data-feather="phone"></i>
                                <div class="contact-number">
                                    <h6 class="text-content">Hotline 24/7 :</h6>
                                    <h5>+91 888 104 2340</h5>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="footer-number">
                                <i data-feather="mail"></i>
                                <div class="contact-number">
                                    <h6 class="text-content">Email Address :</h6>
                                    <h5>fastkart@hotmail.com</h5>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="sub-footer section-small-space">
        <div class="reserve">
            <h6 class="text-content">©2024 Fastkart All rights reserved</h6>
        </div>

        <div class="payment">
            <img src="<c:url value='/assets/user/images/payment/1.png'/>" class="blur-up lazyload" alt="">
        </div>

        <div class="social-link">
            <h6 class="text-content">Stay connected :</h6>
            <ul>
                <li>
                    <a href="https://www.facebook.com/" target="_blank">
                        <i class="fa-brands fa-facebook-f"></i>
                    </a>
                </li>
                <li>
                    <a href="https://twitter.com/" target="_blank">
                        <i class="fa-brands fa-twitter"></i>
                    </a>
                </li>
                <li>
                    <a href="https://www.instagram.com/" target="_blank">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                </li>
                <li>
                    <a href="https://in.pinterest.com/" target="_blank">
                        <i class="fa-brands fa-pinterest-p"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
