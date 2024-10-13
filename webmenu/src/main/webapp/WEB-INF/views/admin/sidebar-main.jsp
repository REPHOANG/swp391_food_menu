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
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="UserController?userAction=userManagerAdmin"/>">
                <i class="ri-user-3-line"></i>
                <span>User</span>
            </a>
        </li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="OrderManagerController"/>">
                <i class="ri-archive-line"></i>
                <span>Orders</span>
            </a>
        </li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="ProductManagerController"/>">
                <i class="ri-store-3-line"></i>
                <span>Prodcts</span>
            </a>
        </li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="DiscountManagerController"/>">
                <i class="ri-focus-3-line"></i>
                <span>Discount</span>
            </a>
        </li>
        <li class="sidebar-list">
            <a class="sidebar-link sidebar-title link-nav" href="<c:url value="CategoryManagerController"/>">
                <i class="ri-list-check-2"></i>
                <span>Category</span>
            </a>
<%--            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-list-check-2"></i>--%>
<%--                <span>Category</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="category.html">Category List</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="add-new-category.html">Add New Category</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
        </li>
<%--        <li class="sidebar-list">--%>
<%--            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-list-settings-line"></i>--%>
<%--                <span>Attributes</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="attributes.html">Attributes</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="add-new-attributes.html">Add Attributes</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-user-3-line"></i>--%>
<%--                <span>Users</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="all-users.html">All users</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="add-new-user.html">Add new user</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-user-3-line"></i>--%>
<%--                <span>Roles</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="role.html">All roles</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="create-role.html">Create Role</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="media.html">--%>
<%--                <i class="ri-price-tag-3-line"></i>--%>
<%--                <span>Media</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-archive-line"></i>--%>
<%--                <span>Orders</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="order-list.html">Order List</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="order-detail.html">Order Detail</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="order-tracking.html">Order Tracking</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-focus-3-line"></i>--%>
<%--                <span>Localization</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="translation.html">Translation</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="currency-rates.html">Currency Rates</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-price-tag-3-line"></i>--%>
<%--                <span>Coupons</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="coupon-list.html">Coupon List</a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="create-coupon.html">Create Coupon</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="taxes.html">--%>
<%--                <i class="ri-price-tag-3-line"></i>--%>
<%--                <span>Tax</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="product-review.html">--%>
<%--                <i class="ri-star-line"></i>--%>
<%--                <span>Product Review</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="support-ticket.html">--%>
<%--                <i class="ri-phone-line"></i>--%>
<%--                <span>Support Ticket</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">--%>
<%--                <i class="ri-settings-line"></i>--%>
<%--                <span>Settings</span>--%>
<%--            </a>--%>
<%--            <ul class="sidebar-submenu">--%>
<%--                <li>--%>
<%--                    <a href="profile-setting.html">Profile Setting</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="reports.html">--%>
<%--                <i class="ri-file-chart-line"></i>--%>
<%--                <span>Reports</span>--%>
<%--            </a>--%>
<%--        </li>--%>

<%--        <li class="sidebar-list">--%>
<%--            <a class="sidebar-link sidebar-title link-nav" href="list-page.html">--%>
<%--                <i class="ri-list-check"></i>--%>
<%--                <span>List Page</span>--%>
<%--            </a>--%>
<%--        </li>--%>
    </ul>
</div>
<div class="right-arrow" id="right-arrow">
    <i data-feather="arrow-right"></i>
</div>
</body>
</html>
