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
    <title>Register</title>

    <!-- Google font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">

    <!-- bootstrap css -->
    <link id="rtl-link" rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/bootstrap.css"/>"/>

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/font-awesome.css"/>"/>

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/feather-icon.css"/>"/>

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/style.css"/>"/>
</head>

<body>
<!-- log in section start -->
<section class="log-in-section section-b-space">
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
                        <h4>Create New Account</h4>
                    </div>
                    <div class="input-box">
                        <span style="color: #0baf9a; font-size: 18px;">${messageSuccessful}</span>
                        <span style="color: red; font-size: 18px;">${messageFailed}</span>
                        <form class="row g-4" action="SignUpUserController" method="post">
                            <div class="col-12">
                                <div class="form-floating theme-form-floating">
                                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Full Name" required>
                                    <label for="fullname">Full Name</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating theme-form-floating">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required>
                                    <label for="email">Email Address</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating theme-form-floating">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                    <label for="password">Password</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-animation w-100" type="submit">Sign Up</button>
                            </div>
                        </form>
                    </div>

<%--                    <div class="other-log-in">--%>
<%--                        <h6>or</h6>--%>
<%--                    </div>--%>

<%--                    <div class="log-in-button">--%>
<%--                        <ul>--%>
<%--                            <li>--%>
<%--                                <a href="https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin"--%>
<%--                                   class="btn google-button w-100">--%>
<%--                                    <img src="../assets/images/inner-page/google.png" class="blur-up lazyload"--%>
<%--                                         alt="">--%>
<%--                                    Sign up with Google--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a href="https://www.facebook.com/" class="btn google-button w-100">--%>
<%--                                    <img src="../assets/images/inner-page/facebook.png" class="blur-up lazyload"--%>
<%--                                         alt=""> Sign up with Facebook--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="other-log-in">--%>
<%--                        <h6></h6>--%>
<%--                    </div>--%>

<%--                    <div class="sign-up-box">--%>
<%--                        <h4>Already have an account?</h4>--%>
<%--                        <a href="<c:url value="LoginAdminController"/>">Log In</a>--%>
<%--                    </div>--%>
                </div>
            </div>

            <div class="col-xxl-7 col-xl-6 col-lg-6"></div>
        </div>
    </div>
</section>
<!-- log in section end -->

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
</body>

</html>