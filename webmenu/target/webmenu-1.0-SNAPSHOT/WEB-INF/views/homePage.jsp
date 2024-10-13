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
                <%--                        <div class="block-content">--%>
                <%--                            <c:forEach items="${listPopularCatetory}" var="popuCate">--%>
                <%--                                <div class="banner">--%>
                <%--                                    <div class="banner-image">--%>
                <%--                                        <a href="<c:url value="MainController?btnAction=product&productAction=showByCateID&categoryID=${popuCate.categoryID}&orderBy=popular"></c:url>">--%>
                <%--                                            <img class="img-popu-cate" src="assets/images/${popuCate.banner}.jpg" alt="${popuCate.name}">--%>
                <%--                                        </a>--%>
                <%--                                    </div>--%>
                <%--                                    <div class="banner-caption">--%>
                <%--                                        <div class="banner-caption-body">--%>
                <%--                                            <h5 class="banner-caption-title">${popuCate.name}</h5>--%>
                <%--                                        </div>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </c:forEach>--%>
                <%--                        </div>--%>
            </div>
            <!--                    <script>
                                    var index = 0;

                                </script>-->
            <%--                    <c:forEach items="${listTop20ProductsHaveBannerVertical}" var="productList" varStatus="loop">--%>
            <%--                        <div class="list-product">--%>
            <%--                            <div class="list-product-header">--%>
            <%--&lt;%&ndash;                                <h3 class="block-title">&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                    <a href="#">${listCategoryHaveNoVerticalBanner[loop.index].name}</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                </h3>&ndash;%&gt;--%>
            <%--                                <div class="list-header-tab">--%>

            <%--                                    <ul class="list-tabs">--%>
            <%--                                        <li class="tab">--%>
            <%--                                            <a href="#" class="tab-title">BestSelling</a>--%>
            <%--                                        </li>--%>
            <%--&lt;%&ndash;                                        <li class="tab">&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                            <a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${listCategoryHaveNoVerticalBanner[loop.index].categoryID}&orderBy=popular" />" class="tab-title">Xem tất cả</a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                        </li>&ndash;%&gt;--%>

            <%--                                    </ul>--%>

            <%--                                </div>--%>

            <%--                            </div>--%>
            <%--                            <!-- end header tab -->--%>

            <%--                            <div class="list-product-tab">--%>
            <%--                                <div class="list-product-image">--%>
            <%--                                    <div class="banner">--%>
            <%--&lt;%&ndash;                                        <div class="banner-image">&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                            <a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${listCategoryHaveNoVerticalBanner[loop.index].categoryID}&orderBy=popular" />"><img src="assets/images/${listCategoryHaveNoVerticalBanner[loop.index].bannerVertical}.jpg" alt="bi ngu"></a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>
            <%--                                        <div class="gif-box">--%>
            <%--                                            <div class="gif-background">--%>
            <%--                                                <div class="gif-image"></div>--%>
            <%--                                            </div>--%>
            <%--                                        </div>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>

            <%--                                <div class="swiper mySwiper2 mySwiper2-css swiper-initialized swiper-horizontal swiper-grid swiper-grid-column">--%>
            <%--                                    <div class="swiper-wrapper" id="swiper-wrapper-b9be9737473a2aeb" aria-live="polite" style="width: 1508px; transform: translate3d(0px, 0px, 0px);">--%>
            <%--                                        <c:forEach  items="${productList}" var="product" varStatus="loop">--%>
            <%--                                            <div class="swiper-slide slide-product">--%>
            <%--                                                <div class="slide-product-block">--%>
            <%--                                                    <div class="slide-product-content">--%>
            <%--                                                        <div class="top-block">--%>
            <%--                                                            <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${product.productID}"></c:url>" class="slide-product-content-image">--%>
            <%--                                                                <img src="${product.getMainImg().getUrl()}" alt="">--%>
            <%--                                                            </a>--%>

            <%--                                                        </div>--%>
            <%--                                                        <div class="bottom-block">--%>
            <%--                                                            <h4 class="card-title">--%>
            <%--                                                                <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${product.productID}"></c:url>">${product.name}</a>--%>

            <%--                                                                </h4>--%>
            <%--                                                                <div class="ratings">--%>
            <%--                                                                    <div class="product-rating">--%>
            <%--                                                                        <span class="rating-small">--%>
            <%--                                                                            <span class="icon"><i class="fa-regular fa-star"></i></span>--%>
            <%--                                                                            <span class="icon"><i class="fa-regular fa-star"></i></span>--%>
            <%--                                                                            <span class="icon"><i class="fa-regular fa-star"></i></span>--%>
            <%--                                                                            <span class="icon"><i class="fa-regular fa-star"></i></span>--%>
            <%--                                                                            <span class="icon"><i class="fa-regular fa-star"></i></span>--%>
            <%--                                                                        </span>--%>
            <%--                                                                    </div>--%>
            <%--                                                                </div>--%>
            <%--                                                                <div class="price-block">--%>
            <%--                                                                    <span id="price-after-discount${loop.index}-${product.productID}"  class="price price-after-discount">300000vnd</span>--%>
            <%--                                                                <span id='price-without-discount${loop.index}-${product.productID}'  class="price price-without-discount">--%>
            <%--                                                                    <script id='tmp'>--%>
            <%--                                                                        document.querySelector("#price-without-discount${loop.index}-${product.productID}").innerHTML = formatter.format(${product.price});--%>
            <%--                                                                        document.querySelector("#price-after-discount${loop.index}-${product.productID}").innerHTML = formatter.format(${product.price * (1-product.discount)});--%>

            <%--                                                                    </script>--%>
            <%--                                                                </span>--%>
            <%--                                                            </div>--%>

            <%--                                                        </div>--%>
            <%--                                                    </div>--%>
            <%--                                                </div>--%>
            <%--                                            </div>--%>
            <%--                                        </c:forEach>--%>
            <%--                                        <!--                                        <script id='tmp2'>--%>
            <%--                                                                                    document.querySelectorAll("#tmp").forEach(i => i.remove());--%>
            <%--                                                                                    document.querySelector("#tmp2").remove();--%>
            <%--                                                                                    --%>
            <%--                                                                                </script>-->--%>
            <%--                                    </div>--%>
            <%--<!--                                    <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-b9be9737473a2aeb" aria-disabled="false"></div>--%>
            <%--                                    <div class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-b9be9737473a2aeb" aria-disabled="true"></div>-->--%>
            <%--                                    <!-- <div class="swiper-pagination"></div> -->--%>
            <%--                                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>--%>
            <%--                            </div>--%>

            <%--                        </div>--%>
            <%--                    </c:forEach>--%>
            <!-- list 2 -->

            <!--  -->

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