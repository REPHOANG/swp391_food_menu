<%@ page import="com.mycompany.webmenu.enums.StatusOrderType" %>
<%@ page import="com.mycompany.webmenu.dto.OrderDto" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Lấy trạng thái hiện tại của đơn hàng từ orderDetail
    OrderDto orderDetail = (OrderDto) request.getAttribute("orderDetail");
    Integer currentStatus = orderDetail != null ? orderDetail.getOrderStatus() : null;
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
          content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <link rel="shortcut icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <title>Fastkart - Order Details</title>
    <!-- Google font-->
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <!-- Fontawesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/font-awesome.css"/>"/>
    <!-- Linear Icon css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/linearicon.css"/>"/>
    <!-- Themify icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/themify.css"/>"/>
    <!-- Feather icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/feather-icon.css"/>"/>
    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/remixicon.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>

<body>
<!-- tap on top start -->
<div class="tap-top">
    <i data-feather="chevrons-up"></i>
</div>
<!-- tap on tap end -->
<!-- page-wrapper Start -->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <!-- Page Header Start-->
    <jsp:include page="/WEB-INF/views/admin/page-header.jsp"/>
    <!-- Page Header Ends-->

    <!-- Page Body Start-->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="sidebar-wrapper">
            <div id="sidebarEffect"></div>
            <div>
                <jsp:include page="/WEB-INF/views/admin/logo.jsp"/>
                <nav class="sidebar-main">
                    <jsp:include page="/WEB-INF/views/admin/sidebar-main.jsp"/>
                </nav>
            </div>
        </div>
        <!-- Page Sidebar Ends-->
        <!-- tracking section start -->
        <div class="page-body">
            <!-- tracking table start -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="title-header title-header-block package-card">
                                    <div>
                                        <h5>Order #${orderDetail.orderId}</h5>
                                    </div>
                                    <div class="card-order-section">
                                        <ul>
                                            ${orderDetail.orderDate}
                                            <li>Total <span id="order-total">${orderDetail.orderTotal}</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="bg-inner cart-section order-details-table">
                                    <div class="row g-1">
                                        <div class="col-xl-8">
                                            <div class="table-responsive table-details">
                                                <table class="table cart-table table-borderless">
                                                    <tbody>
                                                    <c:forEach var="order" items="${orderDetail.orderDetailDto}">
                                                        <tr class="table-order">
                                                            <td>
                                                                <a href="javascript:void(0)">
                                                                    <img src="<c:url value='${order.productUrl}' />"
                                                                         class="img-fluid blur-up lazyload" alt="">
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <p>Product Name</p>
                                                                <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 150px;">
                                                                        ${order.productName}
                                                                </h5>
                                                            </td>
                                                            <td>
                                                                <p>Price</p>
                                                                <h5>
                                                                    <fmt:formatNumber value="${order.productPrice}"
                                                                                      type="currency" currencySymbol="₫"
                                                                                      minFractionDigits="2"
                                                                                      maxFractionDigits="2"/>
                                                                </h5>
                                                            </td>
                                                            <td>
                                                                <p>Quantity</p>
                                                                <h5>${order.quantity}</h5>
                                                            </td>
                                                            <td>
                                                                <p>Total</p>
                                                                <h5>
                                                                    <fmt:formatNumber
                                                                            value="${order.productPrice * order.quantity}"
                                                                            type="currency" currencySymbol="₫"
                                                                            minFractionDigits="2"
                                                                            maxFractionDigits="2"/>
                                                                </h5>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h5>Subtotal :</h5>
                                                        </td>
                                                        <td>
                                                            <h4 id="total-price-product">$55.00fb </h4>
                                                        </td>
                                                    </tr>
                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h5>Coupon Discount</h5>
                                                        </td>
                                                        <td>
                                                            <h4 id="max-discount-value">${orderDetail.maxDiscountValue}</h4>
                                                        </td>
                                                    </tr>
                                                    <tr class="table-order">
                                                        <td colspan="3">
                                                            <h4 class="theme-color fw-bold">Total Price :</h4>
                                                        </td>
                                                        <td>
                                                            <h4 class="theme-color fw-bold" id="total-price-order">
                                                                $6935.00</h4>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="col-xl-4">
                                            <div class="order-success">
                                                <div class="row g-4">
                                                    <div class="payment-mode">
                                                        <h4>Table </h4>
                                                        <p>${orderDetail.tableName}</p>
                                                    </div>
                                                    <div class="payment-mode">
                                                        <h4>Order Note </h4>
                                                        <p>${orderDetail.orderNote}</p>
                                                    </div>
                                                    <div class="payment-mode">
                                                        <h4>Status Order </h4>
                                                        <select class="form-select select-form-size" id="status-selection">
                                                            <option disabled>Select Status</option>
                                                            <%
                                                                // Lặp qua các trạng thái trong enum và tạo các <option>
                                                                for (StatusOrderType status : StatusOrderType.getStatusOptions()) {
                                                                    // Kiểm tra nếu trạng thái hiện tại khớp với trạng thái trong vòng lặp
                                                                    boolean isSelected = status.getId() == currentStatus;
                                                            %>
                                                            <option value="<%= status.getId() %>" <%= isSelected ? "selected" : "" %>>
                                                                <%= status.getName() %>
                                                            </option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-success" value="Save"
                                                   onclick="saveStatus()">
                                        </div>
                                    </div>
                                </div>
                                <!-- section end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- tracking table end -->
            <div class="container-fluid">
                <jsp:include page="/WEB-INF/views/admin/container-fluid.jsp"/>
            </div>
        </div>
        <!-- tracking section End -->
    </div>
</div>
<!-- page-wrapper End -->

<!-- Modal start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
                <p>Are you sure you want to log out?</p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                <div class="button-box">
                    <button type="button" class="btn btn--no" data-bs-dismiss="modal">No</button>
                    <button type="button" class="btn  btn--yes btn-primary">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->
<!-- latest js -->
<script src="<c:url value="/assets/admin/js/jquery-3.6.0.min.js"/>"></script>
<!-- Bootstrap js -->
<script src="<c:url value="/assets/admin/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<!-- feather icon js -->
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather-icon.js"/>"></script>
<!-- scrollbar simplebar js -->
<script src="<c:url value="/assets/admin/js/scrollbar/simplebar.js"/>"></script>
<script src="<c:url value="/assets/admin/js/scrollbar/custom.js"/>"></script>
<!-- Sidebar js -->
<script src="<c:url value="/assets/admin/js/config.js"/>"></script>
<!-- customizer js -->
<script src="<c:url value="/assets/admin/js/customizer.js"/>"></script>
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
<script type="text/javascript">
    const orderId =${orderDetail.orderId};
    const tableId =${orderDetail.tableId};
    const orderTotal = ${orderDetail.orderTotal};
    const orderDetailDtoList = JSON.parse('${orderDetailDtoList}');
    const orderDetails = []
    let totalPriceProduct = 0;
    orderDetailDtoList.forEach((item, index) => {
        totalPriceProduct += item.quantity * item.productPrice;
        orderDetails.push({
            quantity: item.quantity,
            productId: item.productId,
            productPrice: item.productPrice
        })
    });

    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
    }

    document.getElementById("order-total").textContent = formatCurrency(orderTotal);
    document.getElementById("total-price-product").textContent = formatCurrency(totalPriceProduct);
    document.getElementById("max-discount-value").textContent = formatCurrency(${orderDetail.maxDiscountValue});
    document.getElementById("total-price-order").textContent = formatCurrency(${orderDetail.orderTotal});

    function saveStatus() {
        // Lấy giá trị của statusId từ select'
        const statusId = document.getElementById('status-selection').value;
        console.log("statusId " + orderId + "-" + statusId)
        const url = `/webmenu/OrderManagerController?orderAction=staffUpdateStatusOrder&orderId=` + orderId + `&statusId=` + statusId + `&tableId=` + tableId;
        // Gửi yêu cầu fetch với phương thức POST để cập nhật dữ liệu
        fetch(url, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => {
            // Kiểm tra phản hồi thành công
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        }).then(data => {
            // Xử lý dữ liệu trả về từ API
            console.log("Response data:", data);
            alert("Status updated successfully!");
            location.reload();
        }).catch(error => {
            // Xử lý lỗi
            console.error("Error updating status:", error);
            alert("Failed to update status.");
        });
    }
</script>
</body>

</html>