<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/swiperHomePage.css" />"/>

    <title>Document</title>

</head>

<body>

<jsp:include page="header.jsp"/>

<section class="slideShow">
    <div class="container">
        <div class="row-slideShow">
            <div class="col-slideShow-left">
            </div>
            <div class="col-slideShow-right">
                <div class="row-sldeShow-right">
                    <div class="swiper mySlideShow slide-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><img src="assets/images/slide1.jpg" alt=""></div>
                            <div class="swiper-slide"><img src="assets/images/slide2.jpg" alt=""></div>
                            <div class="swiper-slide"><img src="assets/images/slide3.jpg" alt=""></div>

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <div class="banner-container">
                        <div class="banner">
                            <a href="#">
                                <img src="assets/images/banner1.jpg" alt="">
                            </a>
                        </div>
                        <div class="banner">
                            <a>
                                <img src="assets/images/banner2.jpg" alt="">
                            </a>
                        </div>
                        <div class="banner">
                            <a>
                                <img src="assets/images/banner3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="main-body">
    <div class="container">
        <div class="main-body-full">
            <div class="popular-categories">
                <h5 class="block-title">
                    Các loại sản phẩm phổ biến
                </h5>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script>
    var swiperSlideShow = new Swiper(".mySlideShow", {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        }

    });

    var swiper = new Swiper(".mySwiper2", {
        slidesPerView: 4,
        grid: {
            rows: 2,
        },
        spaceBetween: 0,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        }
    });
</script>
</html>