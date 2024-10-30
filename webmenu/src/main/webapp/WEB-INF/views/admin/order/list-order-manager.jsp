<%@ page import="com.mycompany.webmenu.enums.StatusOrderType" %>
<%@ page import="com.mycompany.webmenu.dto.OrderDto" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Fastkart - Product</title>
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
    <!-- Data Table css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/datatables.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>
<body>
<!-- tap on top start-->
<div class="tap-top">
    <span class="lnr lnr-chevron-up"></span>
</div>
<!-- tap on tap end-->
<!-- page-wrapper Start-->
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

        <!-- Container-fluid starts-->
        <div class="page-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card card-table">
                            <div class="card-body">
                                <div class="title-header option-title d-sm-flex d-block">
                                    <h5>Orders List</h5>
                                    <div>
                                        <input type="text" value="${userId}" id="data-user-id" style="display: none;">
                                        <p>Search : <input type="search" id="search" class="" placeholder>
                                        </p>
                                    </div>
                                    <div>
                                        <p>Status : <select id="status-selection">
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
                                        </select></p>
                                    </div>
                                </div>
                                <div>
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success">
                                                ${message}
                                        </div>
                                    </c:if>
                                    <div class="table-responsive">
                                        <table class="table all-package theme-table table-product" id="table_id">
                                            <thead>
                                            <tr>
                                                <th>Order Name</th>
                                                <th>Order Date</th>
                                                <th>Total Price</th>
                                                <th>Status</th>
                                                <th>Option</th>
                                            </tr>
                                            </thead>
                                            <tbody id="table_body">
                                            <!-- Dữ liệu sẽ được chèn ở đây -->
                                            </tbody>
                                        </table>
                                        <div id="pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container-fluid Ends-->
            <div class="container-fluid">
                <jsp:include page="/WEB-INF/views/admin/container-fluid.jsp"/>
            </div>
        </div>
    </div>
</div>
<!-- page-wrapper End-->

<!-- Modal Start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <jsp:include page="/WEB-INF/views/admin/staticBackdrop.jsp"/>
</div>
<!-- Modal End -->

<!-- Delete Modal Box Start -->
<div class="modal fade theme-modal remove-coupon" id="exampleModalToggle" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header d-block text-center">
                <h5 class="modal-title w-100" id="exampleModalLabel22">Are You Sure ?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="remove-box">
                    <p>The permission for the use/group, preview is inherited from the object, object will create a
                        new permission for this object</p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-animation btn-md fw-bold" data-bs-target="#exampleModalToggle2"
                        data-bs-toggle="modal" data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade theme-modal remove-coupon" id="exampleModalToggle2" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="exampleModalLabel12">Done!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="remove-box text-center">
                    <div class="wrapper">
                        <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                            <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/>
                            <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
                        </svg>
                    </div>
                    <h4 class="text-content">It's Removed.</h4>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Delete Modal Box End -->
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
<!-- Plugins js -->
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<!-- Theme js -->
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
<script type="text/javascript">
    let currentPage = 1;
    let itemsPerPage = 5;  // Số sản phẩm mỗi trang
    let maxVisiblePages = 5; // Số lượng trang tối đa hiển thị
    let userName = null;
    let orderStatus = document.getElementById("status-selection").value;
    let userId = document.getElementById("data-user-id").value;
    loadOrdersList(currentPage)
    handleSearchInput();
    handleStatusSelection();

    function loadOrdersList(page) {
        let baseUrl = `/webmenu/OrderManagerController?orderAction=viewOrderListManager&page=` + page + `&pageSize=` + itemsPerPage;
        let url = baseUrl;
        // Chỉ thêm userName vào URL nếu nó có giá trị
        if (userName) {
            url += `&userName=` + userName;
        }
        // Chỉ thêm orderStatus vào URL nếu nó có giá trị
        if (orderStatus) {
            url += `&orderStatus=` + orderStatus;
        }
        // Chỉ thêm userId vào URL nếu nó có giá trị
        if (userId) {
            url += `&userId=` + userId;
        }
        console.log("loadOrdersList url " + url);
        fetch(url)
            .then(response => response.json())
            .then(data => {
                const tableBody = document.getElementById("table_body");
                tableBody.innerHTML = ""; // Xóa các hàng cũ trước khi thêm hàng mới
                data.items.forEach(item => {
                    // Tạo hàng mới trong bảng
                    const row = document.createElement("tr");
                    // Cột Order Name
                    const nameCell = document.createElement("td");
                    nameCell.textContent = item.userName || "";
                    row.appendChild(nameCell);
                    // Cột Order Date
                    const dateCell = document.createElement("td");
                    dateCell.textContent = item.orderDate || "";
                    row.appendChild(dateCell);
                    // Cột Total Price
                    const totalPriceCell = document.createElement("td");
                    const orderTotal = item.orderTotal || 0;
                    // Kiểm tra xem orderTotal có phải là số nguyên hay không
                    if (Number.isInteger(orderTotal)) {
                        // Nếu là số nguyên, chỉ hiển thị phần nguyên mà không có số thập phân
                        totalPriceCell.textContent = orderTotal.toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND',
                            minimumFractionDigits: 0
                        });
                    } else {
                        // Nếu có phần thập phân, hiển thị đủ hai chữ số thập phân
                        totalPriceCell.textContent = orderTotal.toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND',
                            minimumFractionDigits: 2
                        });
                    }
                    row.appendChild(totalPriceCell);
                    // Cột Status
                    const statusCell = document.createElement("td");
                    statusCell.textContent = getOrderStatusText(item.orderStatus);
                    row.appendChild(statusCell);
                    // Cột Option
                    const optionCell = document.createElement("td");
                    const orderDetailUrl = `/webmenu/OrderManagerController?orderAction=detailOrderAdmin&orderId=` + encodeURIComponent(item.orderId);
                    // Tạo phần tử HTML bằng JavaScript thay vì innerHTML
                    const ul = document.createElement("ul");
                    const li = document.createElement("li");
                    const a = document.createElement("a");
                    a.href = orderDetailUrl;  // Đặt href bằng URL chi tiết
                    a.innerHTML = '<i class="ri-eye-line"></i>'; // Icon hiển thị

                    li.appendChild(a);
                    ul.appendChild(li);
                    optionCell.appendChild(ul);

                    row.appendChild(optionCell);
                    // Thêm hàng vào bảng
                    tableBody.appendChild(row);
                });
                renderPagination(data.totalPages); // Gọi hàm phân trang
            })
            .catch(error => console.error('Error:', error));
    }

    // Hàm để lấy trạng thái đơn hàng
    function getOrderStatusText(status) {
        switch (status) {
            case 1:
                return "Initialized";
            case 2:
                return "Confirmed";
            case 3:
                return "Preparing";
            case 4:
                return "Delivered";
            case 5:
                return "Paid";
            case 6:
                return "Table Cleared";
            default:
                return "Unknown";
        }
    }

    // Hàm render pagination
    function renderPagination(totalPages) {
        const pagination = document.getElementById("pagination");
        pagination.innerHTML = ""; // Xóa phân trang cũ

        // Nút "Previous"
        if (currentPage > 1) {
            const prevButton = document.createElement("button");
            prevButton.textContent = "Previous";
            prevButton.onclick = () => {
                currentPage -= 1; // Giảm currentPage khi nhấn Previous
                loadOrdersList(currentPage);
            };
            pagination.appendChild(prevButton);
        }

        // Tính toán `startPage` và `endPage` để giới hạn tối đa 5 trang hiển thị
        let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
        let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

        // Điều chỉnh `startPage` nếu `endPage` ít hơn 5 trang
        if (endPage - startPage + 1 < maxVisiblePages) {
            startPage = Math.max(1, endPage - maxVisiblePages + 1);
        }

        // Tạo các nút trang từ `startPage` đến `endPage`
        for (let i = startPage; i <= endPage; i++) {
            const pageButton = document.createElement("button");
            pageButton.textContent = i;
            pageButton.onclick = () => {
                currentPage = i; // Cập nhật currentPage khi chọn trang mới
                loadOrdersList(currentPage);
            };

            if (i === currentPage) {
                pageButton.disabled = true; // Vô hiệu hóa nút của trang hiện tại
                pageButton.classList.add("active"); // Thêm lớp CSS để đánh dấu trang hiện tại
            }
            pagination.appendChild(pageButton);
        }

        // Nút "Next"
        if (currentPage < totalPages) {
            const nextButton = document.createElement("button");
            nextButton.textContent = "Next";
            nextButton.onclick = () => {
                currentPage += 1; // Tăng currentPage khi nhấn Next
                loadOrdersList(currentPage);
            };
            pagination.appendChild(nextButton);
        }
    }

    // Hàm xử lý khi nhập vào ô tìm kiếm
    function handleSearchInput() {
        const searchInput = document.getElementById("search");
        searchInput.addEventListener("input", function () {
            const searchValue = this.value;
            orderStatus = document.getElementById("status-selection").value;
            userName = this.value;
            currentPage = 1;
            loadOrdersList(currentPage)
            // Gọi hàm xử lý khác nếu cần, ví dụ: loadOrdersList(searchValue);
        });
    }

    // Hàm xử lý khi thay đổi giá trị trong <select>
    function handleStatusSelection() {
        const statusSelect = document.getElementById("status-selection");
        statusSelect.addEventListener("change", function () {
            let text = document.getElementById("search").value;
            if (!text) {
                userName = null
            } else {
                userName = text
            }
            orderStatus = this.value;
            currentPage = 1;
            loadOrdersList(currentPage)
        });
    }
</script>
</body>
</html>
