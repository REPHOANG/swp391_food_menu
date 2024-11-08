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
    <link id="rtl-link" rel="stylesheet" type="text/css"
          href="<c:url value="/assets/user/css/vendors/bootstrap.css"/>"/>

    <!-- font-awesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/font-awesome.css"/>"/>

    <!-- feather icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/vendors/feather-icon.css"/>"/>

    <!-- Template css -->
    <link id="color-link" rel="stylesheet" type="text/css" href="<c:url value="/assets/user/css/style.css"/>"/>
</head>

<body>
<header class="pb-md-4 pb-0">
    <div class="top-nav top-header sticky-header">
        <jsp:include page="/WEB-INF/views/user/top-header.jsp"/>
    </div>
</header>
<!-- mobile fix menu start -->
<jsp:include page="menu-section.jsp"/>
<!-- mobile fix menu end -->
<!-- log in section start -->
<div class="page-body">
    <!-- New Product Add Start -->
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-sm-8 m-auto">
                    <div class="card">
                        <div class="card-body">
                            <span style="color: #0baf9a; font-size: 18px;">${messageSuccessful}</span>
                            <span style="color: red; font-size: 18px;">${messageFailed}</span>
                            <form class="theme-form theme-form-2 mega-form"
                                  action="./ViewProfileController?viewProfileAction=profileActionUser"
                                  method="post">
                                <input class="form-control" type="hidden" name="userId"
                                       value="${profileUser.userId}">
                                <div class="mb-4 row align-items-center">
                                    <label class="form-label-title col-sm-3 mb-0">Full Name</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" placeholder="Full Name"
                                               name="fullName" value="${profileUser.fullName}">
                                    </div>
                                </div>
                                <!-- Phone Number -->
                                <div class="mb-4 row align-items-center">
                                    <label class="form-label-title col-sm-3 mb-0">Phone number</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" placeholder="Phone number" name="phone" id="phone" value="${profileUser.phone}">
                                        <div id="phone-error" style="color: red; display: none;">Please enter valid phone format</div>
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label class="form-label-title col-sm-3 mb-0">Address</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" placeholder="Address"
                                               name="address" value="${profileUser.address}">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Save" id="save-btn" disabled >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- log in section end -->

<!-- Footer Section Start -->
<footer class="section-t-space">
    <jsp:include page="/WEB-INF/views/user/footer-section.jsp"/>
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
<!-- script js -->
<%--<script src="<c:url value="/assets/user/js/script.js"/>"></script>--%>
<script src="<c:url value="/assets/user/cart-local-storage.js"/>"></script>
<script src="<c:url value="/assets/user/top-header.js"/>"></script>
<script type="text/javascript">
    const phoneRegex = /^(0[3|5|7|8|9][0-9]{8})$/; // Regex cho số điện thoại Việt Nam
    const phoneInput = document.getElementById("phone");
    const phoneError = document.getElementById("phone-error");
    const saveButton = document.getElementById("save-btn");
    document.getElementById('phone').addEventListener("input", function() {
        const phoneValue = this.value;
        if (phoneRegex.test(phoneValue)) {
            phoneError.style.display = "none";  // Ẩn lỗi
            saveButton.disabled = false;  // Bật nút Save
        } else {
            phoneError.style.display = "block";  // Hiển thị lỗi
            saveButton.disabled = true;  // Vô hiệu hóa nút Save
        }
    });

    viewCartHeaderDisplay()
</script>
</body>

</html>