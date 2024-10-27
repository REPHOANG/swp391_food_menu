<%-- 
    Document   : header
    Created on : Feb 8, 2023, 5:51:26 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
          rel="stylesheet">
    <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>
<script>
    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    });
</script>
<body>
<header class="header">
    <div class="header-top">
        <div class="container">
            <div class="header-top-content">
                <div class="row">
                    <div class="col-left">
                        <div class="col-left-content">Chào mừng <span class="email-need-split"
                                                                      data-email="${sessionScope.user.email}"></span>
                            đến với chúng tôi
                        </div>
                    </div>
                    <div class="col-right">
                        <div class="navigation-user">
                            <ul class="navigation-user-selection">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <li class="navigation-user-item">
                                            <span class="email-need-split"
                                                  data-email="${sessionScope.user.email}"></span>
                                        </li>
                                        <li class="navigation-user-item dropdown">
                                                    <span class="navigation-user-action">
                                                        <div class="current-avatar">
                                                            <div id="my-avatar-header"
                                                                 style="background-image: url('${sessionScope.user.avatarUrl}')"></div>
                                                        </div>

                                                        <span>My Account</span>
                                                        <i class="fa-solid fa-angle-down"></i>
                                                    </span>
                                            <div class="dropdown-action">
                                                <a href="<c:url value="/MainController?btnAction=user&userAction=profile#profile" />">Thông
                                                    tin của tôi</a>
                                                <a href="<c:url value="/MainController?btnAction=user&userAction=transaction"></c:url>">Lịch
                                                    sử giao dịch</a>
                                                <a href="<c:url value="/MainController?btnAction=user&userAction=logout"></c:url>">Đăng
                                                    xuất</a>
                                            </div>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="navigation-user-item">
                                                    <span id="g_id_onload"
                                                          data-client_id="1091790792976-ks6ah0826cgh92qtm3qo1k5n6cpov2mg.apps.googleusercontent.com"
                                                          data-context="signin" data-ux_mode="popup"
                                                          data-callback="loginByGoogle"
                                                          data-itp_support="true">
                                                    </span>

                                            <span class="g_id_signin" data-type="button" data-shape="circle"
                                                  data-theme="outline" data-text="signin_with" data-size="medium">
                                                    </span>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End header top -->
    <div class="header-center">
        <div class="container">
            <div class="header-center-row">
                <div class="header-center-col">
                    <div class="header-logo-container">
                        <a href="<c:url value="/MainController"></c:url>" class="logo">
                            <img class="header-logo" src="assets/images/logo3.png" alt="">
                        </a>
                    </div>

                </div>
                <div class="header-center-col">
                    <nav class="menu">
                        <ul class="menu-list">
                            <li class="menu-list-item">
                                <a class="menu-list-item-action" href="<c:url value="/MainController"></c:url>">Home</a>
                            </li>

                        </ul>
                    </nav>
                </div>
                <div class="header-center-col">
                    <div class="contact-container">
                        <div class="contact-inner">
                            <i class="fa-solid fa-headphones"></i>
                            <div class="phone">
                                <strong>Contact us: </strong>
                                <span class="phone">9999999</span><br>
                            </div>
                            <div class="email">
                                <span>Email: </span>
                                <span>adasdasd@gmail.com</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="header-bottom">
        <div class="container">

            <div class="row-header-bottom">
                <div class="header-bottom-left">
                    <div>
                        <a class="menu-title">
                            <i class="fa-solid fa-align-left"></i>
                            <span>Các loại sản phẩm</span>
                            <i class="fa-regular fa-circle-down down"></i>
                        </a>
                        <div class="menu-categories  ${param.btnAction == null  ? "" : "is-hover"}">
                            <ul class="menu-categories-list">

                                <c:forEach items="${sessionScope.listCategory}" var="categoryItem">
                                    <li class="menu-categories-item">
                                        <a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem.categoryID}&orderBy=popular"></c:url>"
                                           class="menu-categories-item-action">
                                                ${categoryItem.icon}${categoryItem.name}
                                        </a>
                                    </li>
                                </c:forEach>


                                <li class="menu-categories-item loadmore">
                                    <div class="menu-categories-item-action">
                                        <i class="fa-solid fa-circle-plus"></i>
                                        <span class="more-view">Xem thêm</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="header-bottom-right">
                    <div class="row-header-bottom-right">
                        <div class="header-bottom-search">
                            <form action="MainController">
                                <div class="input-group">

                                    <input type="text" name="searchValue" class="search-input" placeholder="Tìm kiếm..."
                                           required onkeyup="renderSearchResult(this.value)">
                                    <div id="searchAjaxResult"></div>
                                    <div class="search-icon">
                                        <button type="submit" class="search-button" name="btnAction" value="search"><i
                                                class="fa-solid fa-magnifying-glass"></i><input type="text"
                                                                                                name="orderBy"
                                                                                                value="popular" hidden>
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div style="    grid-column: 3/4;
                                     justify-self: center;
                                     display: flex;
                                     align-items: center;">

                            <div class="header-bottom-cart">
                                <a href="#" class="cart-button"><i class="fa-solid fa-cart-shopping cart-icon"></i></a>
                            </div>
                            <div class="header-bottom-admin">
                                <c:if test="${sessionScope.user.roleId == 4}">
                                    <a href="<c:url value="MainController?btnAction=admin"/>" class="cart-button">ad<i
                                            class="fa-solid fa-user-shield"></i></a>
                                </c:if>
                            </div>
                            <div class="header-bottom-shop">
                                <c:if test="${sessionScope.user.roleId == 3}">
                                    <a href="MainController?btnAction=manageProduct" class="cart-button"><i
                                            class="fa-solid fa-shop"></i></a>
                                </c:if>
                            </div>


                            <div class="header-bottom-register">
                                <c:if test="${sessionScope.user.roleId == 2}">

                                    <a href="<c:url value="MainController?btnAction=shop&shopAction=register" />"
                                       class="register-shop"><i class="fa-solid fa-store"></i>Đăng ký cửa hàng</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
</body>
<script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

    function stopGoToCart(e) {

        if (${empty sessionScope.user}) {
            swal("", "Vui lòng đăng nhập", "warning");
            e.preventDefault();
        } else if (${sessionScope.user.roleId ==3} || ${sessionScope.user.roleId ==4}) {
            swal("", "Hãy chuyển sang tài khoản người mua", "warning");
            e.preventDefault();
        }


    }

    document.querySelector(".header-bottom-cart").addEventListener("click", stopGoToCart)
    if (${not empty sessionScope.user}) {
        document.querySelector(".cart-button").href = "<c:url value="MainController?btnAction=cart&cartAction=view" />"
    }

    // function to get response
    function loginByGoogle(response) {

        console.log(response)
        const responsePayload = decodeJwtResponse(response.credential);
        console.log(responsePayload)
        const email = responsePayload.email;
        const avatar = responsePayload.picture;
        const username = responsePayload.name;
        fetch("<c:url value="/MainController?btnAction=user&userAction=login&email="/>" + email + "&picture=" + avatar + "&username=" + username, {
            method: "GET"
        }).then(res =>
            res.json()
        ).then(res => {
                console.log(res)
//                                                        let isLogined = true
//                                                        window.localStorage.setItem("isLogin", true)
                const resUrl = res.avatarUrl;
                document.querySelector(".header-bottom-cart").removeEventListener("click", stopGoToCart)
                document.querySelector(".cart-button").href = "<c:url value="MainController?btnAction=cart&cartAction=view" />"
                document.querySelector('.navigation-user-selection').innerHTML =
                    `<li class="navigation-user-item">
                 <span class="email-need-split" data-email="${res.email}"></span>
                                  </li>
                                  <li class="navigation-user-item dropdown">
                                      <span class="navigation-user-action">
                                            <div class="current-avatar">
                                                            <div id="my-avatar-header" style="background-image: url('')" ></div>
                                                        </div>
                                          <span>My Account</span>
                                          <i class="fa-solid fa-angle-down"></i>

                                      </span>

                                      <div class="dropdown-action">
                                          <a href="<c:url value="/MainController?btnAction=user&userAction=profile" />">Thông tin của tôi</a>
                                        <a href="<c:url value="/MainController?btnAction=user&userAction=transaction"></c:url>">Lịch sử giao dịch</a>
                                          <a href="<c:url value="/MainController?btnAction=user&userAction=logout"></c:url>">Đăng xuất</a>

                                          </div>

                                      </li>`;
                document.querySelector('.email-need-split').innerHTML = res.email.substring(0, res.email.lastIndexOf("@"));
                document.querySelector('#my-avatar-header').style.backgroundImage = "url('" + resUrl + "')";
                if (res.roleId == 4) {
                    console.log("4")

                    document.querySelector(".header-bottom-admin").innerHTML = ` <a href="<c:url value="MainController?btnAction=admin&adminAction=show" />" class="cart-button"><i class="fa-solid fa-user-shield"></i></a>`

                } else if (res.roleId == 3) {
                    console.log(3)
                    document.querySelector(".header-bottom-shop").innerHTML = `<a href="MainController?btnAction=manageProduct" class="cart-button"><i class="fa-solid fa-shop"></i></a>`
                } else if (res.roleId == 2) {
                    document.querySelector(".header-bottom-register").innerHTML = `<a href="<c:url value="MainController?btnAction=shop&shopAction=register" />" class="register-shop"><i class="fa-solid fa-store"></i>Đăng ký cửa hàng</a>`
                }
                user = 2;
            }
        )
    }

    window.onload = function () {
        // also display the One Tap dialog on right side
        // important for auto login
        google.accounts.id.prompt();
    }

    // function to decode the response.credential
    function decodeJwtResponse(token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload);
    }

    let usernameDiv = document.querySelector('.email-need-split');
    let emailNeedSplit = document.querySelector('.email-need-split').dataset.email;
    let username = emailNeedSplit.substring(0, emailNeedSplit.lastIndexOf("@"));
    usernameDiv.innerHTML = username;

    function callSearchControllerAjax(typingValue) {

        return new Promise(function (res, rej) {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open('GET', 'MainController?btnAction=searchAjax&searchValue=' + typingValue, true)

            xmlHttp.onreadystatechange = function () {
                if (this.readyState == 4) {
                    return res(this.responseText)
                }
            }
            xmlHttp.send()
        })

    }
    ;

    function renderSearchResult(typingValueFromInput) {
        if (typingValueFromInput.length === 0) {
            document.querySelector("#searchAjaxResult").innerHTML = "";
            return
        }
        console.log(typingValueFromInput.length)
        let div = document.querySelector("#searchAjaxResult");
        callSearchControllerAjax(typingValueFromInput)
            .then(res => {
                let div = document.querySelector("#searchAjaxResult");
                let data = JSON.parse(res);
                let htmls = data.map(d => {
                    console.log(d)
                    return `<a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=\${d.productID}" />">\${d.name}</a>`
                })
                div.innerHTML = htmls.join('');
            })
//                                                    div.innerHTML = htmls.join('');

    }

    class CartItem {
        constructor(productID, srcImg, quantity, price, shopID, productName) {
            this.productID = productID;
            this.srcImg = srcImg;
            this.quantity = quantity;
            this.price = price;
            this.shopID = shopID;
            this.productName = productName;
        }
    }

</script>

</html>
