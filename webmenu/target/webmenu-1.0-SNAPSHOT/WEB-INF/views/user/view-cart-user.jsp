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
    <title>Cart</title>

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

<!-- Cart Section Start -->
<section class="cart-section section-b-space">
    <div class="container-fluid-lg">
        <div class="row g-sm-5 g-3">
            <form style="max-width: 400px; margin: 0 auto; padding: 20px; background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <label style="display: none; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    User
                    <input id="userId" name="userId" type="text"
                           style="padding: 8px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; width: 100%; max-width: 300px; box-sizing: border-box; margin-top: 5px;">
                </label>

                <label style="display: none; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    Email
                    <input id="email" name="email" type="email"
                           style="padding: 8px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; width: 100%; max-width: 300px; box-sizing: border-box; margin-top: 5px;">
                </label>
                <label style="display: flex; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    Capacity Table
                    <select class="form-control" id="capacity-table-selection"></select>
                    <div class="error-message" id="capacity-table-error"
                         style="color: red; font-size: 12px; display: none;">
                        Please select a table.
                    </div>
                </label>
                <label style="display: flex; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    Table
                    <select class="form-control" id="table-selection"></select>
                    <div class="error-message" id="table-error" style="color: red; font-size: 12px; display: none;">
                        Please select a table.
                    </div>
                </label>
                <label style="display: flex; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    Full Name
                    <input id="fullName" name="fullName" type="text"
                           style="padding: 8px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; width: 100%; max-width: 300px; box-sizing: border-box; margin-top: 5px;">
                    <div class="error-message" id="name-error" style="color: red; font-size: 12px; display: none;">Full
                        Name is required.
                    </div>
                </label>
                <label style="display: flex; flex-direction: column; font-weight: bold; margin-bottom: 15px; color: #333;">
                    Order Note
                    <input id="orderNote" name="orderNote" type="text"
                           style="padding: 8px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; width: 100%; max-width: 300px; box-sizing: border-box; margin-top: 5px;">
                </label>
            </form>

            <div class="col-xxl-9">
                <div class="cart-table">
                    <div class="table-responsive-xl">
                        <table class="table">
                            <tbody id="table-cart-user">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-xxl-3">
                <div class="summery-box p-sticky">
                    <div class="summery-header">
                        <h3>Cart Total</h3>
                    </div>

                    <div class="summery-contain">
                        <div class="coupon-cart">
                            <h6 class="text-content mb-2">Coupon Apply</h6>
                            <div class="mb-3 coupon-box input-group">
                                <select type="email" class="form-control" id="exampleFormControlInput1"
                                        placeholder="Enter Coupon Code Here..."></select>
                                <button class="btn-apply" onclick="applyCoupon()">Apply</button>
                            </div>
                        </div>
                        <ul>
                            <li>
                                <h4>Subtotal</h4>
                                <h4 class="price" id="total-price" content="total-price"></h4>
                            </li>
                            <li>
                                <h4>Coupon Discount</h4>
                                <h4 class="price" id="coupon-discount" content="coupon-discount">(-) 0.00</h4>
                            </li>
                        </ul>
                    </div>

                    <ul class="summery-total">
                        <li class="list-total border-top-0">
                            <h4>Total</h4>
                            <h4 class="price theme-color" id="price-order"></h4>
                        </li>
                    </ul>

                    <div class="button-group cart-button">
                        <ul>
                            <li>
                                <button
                                        class="btn btn-animation proceed-btn fw-bold"
                                        onclick="placeOrder()"
                                        style="padding: 10px 20px; background-color: #28a745; color: #fff; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; transition: background-color 0.3s;">
                                    Place Order
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Cart Section End -->

<!-- Footer Section Start -->
<footer class="section-t-space">
    <jsp:include page="footer-section.jsp"/>
</footer>
<!-- Footer Section End -->

<!-- Bg overlay Start -->
<!-- Bg overlay End -->
<!-- latest jquery-->
<script src="<c:url value="/assets/user/js/jquery-3.6.0.min.js"/>"></script>
<!-- jquery ui-->
<script src="<c:url value="/assets/user/js/jquery-ui.min.js"/>"></script>
<!-- Bootstrap js-->
<script src="<c:url value="/assets/user/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap/popper.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap/bootstrap-notify.min.js"/>"></script>
<!-- feather icon js-->
<script src="<c:url value="/assets/user/js/feather/feather.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/feather/feather-icon.js"/>"></script>
<!-- Lazyload Js -->
<script src="<c:url value="/assets/user/js/lazysizes.min.js"/>"></script>
<!-- Slick js-->
<script src="<c:url value="/assets/user/js/slick/slick.js"/>"></script>
<script src="<c:url value="/assets/user/js/slick/custom_slick.js"/>"></script>
<!-- Quantity js -->
<script src="<c:url value="/assets/user/js/quantity.js"/>"></script>
<!-- script js -->
<script src="<c:url value="/assets/user/js/script.js"/>"></script>
<script src="<c:url value="/assets/user/cart-local-storage.js"/>"></script>
<script src="<c:url value="/assets/user/top-header.js"/>"></script>
<script src="<c:url value="/assets/user/view-cart-user.js"/>"></script>
<script type="text/javascript">
    const user = {
        userId: '${user.userId}',
        roleId: '${user.roleId}',
        email: '${user.email}',
        address: '${user.address}',
        avatarUrl: ' ${user.avatarUrl}',
        fullName: '${user.fullName}',
    };
    // Kiểm tra và khởi tạo userSelectedTable bằng EL
    const userSelectedTableCart = {
        tableId: '${userSelectedTable.tableId}',
        tableName: '${userSelectedTable.tableName}',
        status: '${userSelectedTable.status}',
        capacity: '${userSelectedTable.capacity}'
    }
    console.log("userSelectedTableCart " + userSelectedTableCart.tableId)
    document.getElementById("userId").value = user.userId;
    document.getElementById("email").value = user.email;
    document.getElementById("fullName").value = user.fullName;
    viewCartHeaderDisplay();
</script>
<script src="<c:url value="/assets/user/apply-coupon.js"/>"></script>
</body>

</html>