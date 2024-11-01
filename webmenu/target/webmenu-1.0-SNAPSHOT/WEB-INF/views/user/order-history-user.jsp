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
        <div class="row g-sm-5 g-3 justify-content-center">
            <div class="col-xxl-9">
                <div class="cart-table">
                    <div class="table-responsive-xl">
                        <table class="table">
                            <tbody id="table_body">
                            <%--                            <tr class="product-box-contain">--%>
                            <%--                                <td class="product-detail">--%>
                            <%--                                    <h4 class="table-title text-content">Order Name</h4>--%>
                            <%--                                    <h5>$35.10--%>
                            <%--                                        <del class="text-content">$45.68</del>--%>
                            <%--                                    </h5>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="product-detail">--%>
                            <%--                                    <h4 class="table-title text-content">Order Date</h4>--%>
                            <%--                                    <h5>$35.10--%>
                            <%--                                        <del class="text-content">$45.68</del>--%>
                            <%--                                    </h5>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="product-detail">--%>
                            <%--                                    <h4 class="table-title text-content">Total Price</h4>--%>
                            <%--                                    <h5>$35.10--%>
                            <%--                                        <del class="text-content">$45.68</del>--%>
                            <%--                                    </h5>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="product-detail">--%>
                            <%--                                    <h4 class="table-title text-content">Status</h4>--%>
                            <%--                                    <h5>$35.10--%>
                            <%--                                        <del class="text-content">$45.68</del>--%>
                            <%--                                    </h5>--%>
                            <%--                                </td>--%>
                            <%--                                <td class="save-remove">--%>
                            <%--                                    <h4 class="table-title text-content">Action</h4>--%>
                            <%--                                    <a class="save notifi-wishlist" href="">Detail</a>--%>
                            <%--                                </td>--%>
                            <%--                            </tr>--%>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div id="pagination" style="display: flex; justify-content: center;"></div>
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

<!-- Location Modal Start -->
<!-- Location Modal End -->

<!-- Deal Box Modal Start -->
<!-- Deal Box Modal End -->

<!-- Tap to top start -->
<!-- Tap to top end -->

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
<script type="text/javascript">
    viewCartHeaderDisplay()
    let currentPage = 1;
    let itemsPerPage = 2;  // Số sản phẩm mỗi trang
    let maxVisiblePages = 5; // Số lượng trang tối đa hiển thị
    let userId = ${user.userId};
    loadOrdersList(currentPage)

    function loadOrdersList(page) {
        let baseUrl = `/webmenu/OrderManagerController?orderAction=viewOrderListManager&page=` + page + `&pageSize=` + itemsPerPage;
        let url = baseUrl;
        // Chỉ thêm userId vào URL nếu nó có giá trị
        if (userId) {
            url += `&userId=` + userId;
        }
        console.log("loadOrdersList url " + url);
        fetch(url)
            .then(response => response.json())
            .then(data => {
                const tableBody = document.getElementById("table_body");
                tableBody.innerHTML = ""; // Clear old rows before adding new ones
                data.items.forEach(item => {
                    // Create a new row with the specified class
                    const row = document.createElement("tr");
                    row.classList.add("product-box-contain");

                    // Column for Order Name
                    const nameCell = document.createElement("td");
                    nameCell.classList.add("price");
                    const nameTitle = document.createElement("h4");
                    nameTitle.classList.add("table-title", "text-content");
                    nameTitle.textContent = "Order Name";
                    const nameValue = document.createElement("h5");
                    nameValue.textContent = item.userName || "";
                    nameCell.appendChild(nameTitle);
                    nameCell.appendChild(nameValue);
                    row.appendChild(nameCell);

                    // Column for Order Date with time
                    const dateCell = document.createElement("td");
                    dateCell.classList.add("price");
                    const dateTitle = document.createElement("h4");
                    dateTitle.classList.add("table-title", "text-content");
                    dateTitle.textContent = "Order Date";
                    const dateValue = document.createElement("h5");

                    // Format Order Date to "dd-MM-yyyy HH:mm"
                    const orderDate = new Date(item.orderDate);
                    const formattedDate = orderDate.toLocaleDateString('vi-VN', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                    });
                    dateValue.textContent = formattedDate;
                    dateCell.appendChild(dateTitle);
                    dateCell.appendChild(dateValue);
                    row.appendChild(dateCell);

                    // Column for Total Price
                    const totalPriceCell = document.createElement("td");
                    totalPriceCell.classList.add("price");
                    const priceTitle = document.createElement("h4");
                    priceTitle.classList.add("table-title", "text-content");
                    priceTitle.textContent = "Total Price";
                    const priceValue = document.createElement("h5");
                    const orderTotal = item.orderTotal || 0;

                    // Format price display
                    priceValue.textContent = Number.isInteger(orderTotal)
                        ? orderTotal.toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND',
                            minimumFractionDigits: 0
                        })
                        : orderTotal.toLocaleString('vi-VN', {
                            style: 'currency',
                            currency: 'VND',
                            minimumFractionDigits: 2
                        });

                    totalPriceCell.appendChild(priceTitle);
                    totalPriceCell.appendChild(priceValue);
                    row.appendChild(totalPriceCell);

                    // Column for Status
                    const statusCell = document.createElement("td");
                    statusCell.classList.add("price");
                    const statusTitle = document.createElement("h4");
                    statusTitle.classList.add("table-title", "text-content");
                    statusTitle.textContent = "Status";
                    const statusValue = document.createElement("h5");
                    statusValue.textContent = getOrderStatusText(item.orderStatus);
                    statusCell.appendChild(statusTitle);
                    statusCell.appendChild(statusValue);
                    row.appendChild(statusCell);

                    // Cột Option
                    const optionCell = document.createElement("td");
                    optionCell.classList.add("save-remove");
                    // Tiêu đề cho cột Option
                    const optionTitle = document.createElement("h4");
                    optionTitle.classList.add("table-title", "text-content");
                    optionTitle.textContent = "Action";
                    optionCell.appendChild(optionTitle);
                    // Liên kết "Save for later"
                    const saveLink = document.createElement("a");
                    saveLink.classList.add("save", "notifi-wishlist");
                    const detailUrl = `/webmenu/OrderManagerController?orderAction=detailOrderUser&orderId=` + item.orderId;
                    saveLink.href = detailUrl;
                    saveLink.textContent = "Detail";
                    optionCell.appendChild(saveLink);
                    // Thêm optionCell vào hàng
                    row.appendChild(optionCell);
                    // Thêm hàng vào phần thân của bảng
                    tableBody.appendChild(row);
                });
                renderPagination(data.totalPages); // Gọi hàm phân trang
            })
            .catch(error => console.error('Error:', error));
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
</script>
</body>

</html>