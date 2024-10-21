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
    <title>Log In</title>
    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="<c:url value="/assets/user/css/vendors/bootstrap.css"/>"/>
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
<!-- log in section start -->
<section class="log-in-section background-image-2 section-b-space">
    <div class="container-fluid-lg w-100">
        <div class="row">
            <div class="col-xxl-6 col-xl-5 col-lg-6 d-lg-block d-none ms-auto">
                <div class="image-contain">
                    <img src="<c:url value='/assets/user/images/inner-page/log-in.png'/>" class="img-fluid" alt="">
                </div>
            </div>
            <div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
                <div class="log-in-box">
                    <div class="log-in-title">
                        <h3>Welcome To Fastkart</h3>
                        <%--                        <h4>Log In Your Account</h4>--%>
                    </div>
                    <div class="input-box">
                        <form class="row g-4" action="./LoginController" method="post">
                            <div class="col-12">
                                <div class="form-floating theme-form-floating log-in-form">
                                    <input type="text" class="form-control" id="username" name="username"
                                           placeholder="Email Address">
                                    <label for="username">Email Address</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-animation w-100 justify-content-center" type="submit">Log In
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="other-log-in">
                        <h6>or</h6>
                    </div>
                    <div class="log-in-button">
                        <!-- Google Identity Services - không cần dùng data-login_uri -->
                        <div id="g_id_onload"
                             data-client_id="1091790792976-ks6ah0826cgh92qtm3qo1k5n6cpov2mg.apps.googleusercontent.com"
                             data-context="signin" data-ux_mode="popup"
                             data-callback="loginByGoogle"
                             data-itp_support="true">
                        </div>
                        <div class="g_id_signin" data-type="button" data-shape="circle"
                             data-theme="outline" data-text="signin_with"
                             data-size="medium">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- log in section end -->

<!-- Footer Section Start -->
<footer class="section-t-space">
</footer>
<!-- Footer Section End -->

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
<!-- Bootstrap js-->
<script src="<c:url value="/assets/user/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap/popper.min.js"/>"></script>
<!-- feather icon js-->
<script src="<c:url value="/assets/user/js/feather/feather.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/feather/feather-icon.js"/>"></script>
<!-- Slick js-->
<script src="<c:url value="/assets/user/js/slick/slick.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/slick-animation.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/custom_slick.js"/>"></script>
<!-- Lazyload Js -->
<script src="<c:url value="/assets/user/js/lazysizes.min.js"/>"></script>
<!-- script js -->
<script src="<c:url value="/assets/user/js/script.js"/>"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script>
    // Hàm để giải mã token JWT
    function decodeJwtResponse(token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload);
    }

    function loginByGoogle(response) {
        const responsePayload = decodeJwtResponse(response.credential);
        const email = responsePayload.email;
        const avatar = responsePayload.picture;
        const username = responsePayload.name;
        fetch("<c:url value="/MainController?btnAction=user&userAction=login&email="/>" + email + "&picture=" + avatar + "&username=" + username, {
            method: "GET"
        }).then(res =>
            res.json()
        ).then(res => {
                window.location.href = "/webmenu/MainController?tableId=${tableId}";
            }
        )
    }
</script>
</body>
</html>