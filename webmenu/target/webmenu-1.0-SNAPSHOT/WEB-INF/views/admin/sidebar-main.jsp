<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="left-arrow" id="left-arrow">
    <i data-feather="arrow-left"></i>
</div>
<div id="sidebar-menu">
    <ul class="sidebar-links" id="simple-bar">
        <li class="back-btn"></li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="AdminController"/>">
                <i class="ri-home-line"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="OrderManagerController"/>">
                <i class="ri-archive-line"></i>
                <span>Orders</span>
            </a>
        </li>
        <c:if test="${sessionScope.user != null && sessionScope.user.roleId == 1}">
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav"
                   href="<c:url value="UserController?userAction=userManagerAdmin"/>">
                    <i class="ri-user-3-line"></i>
                    <span>User</span>
                </a>
            </li>
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav" href="<c:url value="StaffController"/>">
                    <i class="ri-user-3-line"></i>
                    <span>Staffs</span>
                </a>
            </li>
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav" href="<c:url value="ProductManagerController"/>">
                    <i class="ri-store-3-line"></i>
                    <span>Products</span>
                </a>
            </li>
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav" href="<c:url value="CategoryManagerController"/>">
                    <i class="ri-list-check-2"></i>
                    <span>Category</span>
                </a>
            </li>
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav" href="<c:url value="DiscountManagerController"/>">
                    <i class="ri-coupon-3-line"></i>
                    <span>Discount</span>
                </a>
            </li>
            <li class="sidebar-list">
                <a class="sidebar-link sidebar-title link-nav" href="<c:url value="TableManagerController"/>">
                    <i class="ri-table-line"></i>
                    <span>Tables</span>
                </a>
            </li>
        </c:if>
    </ul>
</div>
<div class="right-arrow" id="right-arrow">
    <i data-feather="arrow-right"></i>
</div>
</body>
</html>
