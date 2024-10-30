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
                        <h3>Order Total</h3>
                    </div>

                    <div class="summery-contain">
                        <ul>
                            <li>
                                <h4><strong>Table</strong> : ${orderDetail.tableName}</h4>
                            </li>
                            <li>
                                <h4>Subtotal</h4>
                                <h4 class="price" id="total-price-product" content="total-price"></h4>
                            </li>
                            <li>
                                <h4>Coupon Discount</h4>
                                <h4 class="price" id="coupon-discount" content="coupon-discount">(-) ${orderDetail.maxDiscountValue}</h4>
                            </li>
                        </ul>
                    </div>

                    <ul class="summery-total">
                        <li class="list-total border-top-0">
                            <h4>Total</h4>
                            <h4 class="price theme-color" id="total-price-order"></h4>
                        </li>
                    </ul>
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
<script src="<c:url value="/assets/user/order-detail-user.js"/>"></script>
<script type="text/javascript">
    viewCartHeaderDisplay()
    const orderDetailDtoList = JSON.parse('${orderDetailDtoList}');
    const orderDetails = []
    let totalPriceProduct = 0;
    orderDetailDtoList.forEach((item, index) => {
        totalPriceProduct += item.quantity * item.productPrice;
        orderDetails.push({
            orderId: item.orderId,
            orderDetailId: item.orderDetailId,
            quantity: item.quantity,
            productId: item.productId,
            productName: item.productName,
            productUrl: item.productUrl,
            productPrice: item.productPrice
        });
    });
    viewOrderDetailUser()
    let orderTotal = ${orderDetail.orderTotal};
    document.getElementById("total-price-product").textContent = formatCurrency(totalPriceProduct);
    document.getElementById("total-price-order").textContent = formatCurrency(orderTotal);

    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }
</script>
</body>

</html>