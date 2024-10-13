<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="page-header">
    <div class="header-wrapper m-0">
        <div class="nav-right col-6 pull-right right-header p-0">
            <ul class="nav-menus">
                <li class="profile-nav onhover-dropdown pe-0 me-0">
                    <div class="media profile-media">
                        <img class="user-profile rounded-circle"
                             src="<c:url value='/assets/admin/images/logo/1-white.png' />" alt="user">
                        <div class="user-name-hide media-body">
                            <span>${sessionScope.user.email}</span>
                            <p class="mb-0 font-roboto">Admin<i class="middle ri-arrow-down-s-line"></i></p>
                        </div>
                    </div>
                    <ul class="profile-dropdown onhover-show-div">
                        <li>
                            <a href="all-users.html">
                                <i data-feather="users"></i>
                                <span>Users</span>
                            </a>
                        </li>
                        <li>
                            <a href="order-list.html">
                                <i data-feather="archive"></i>
                                <span>Orders</span>
                            </a>
                        </li>
                        <li>
                            <a href="support-ticket.html">
                                <i data-feather="phone"></i>
                                <span>Spports Tickets</span>
                            </a>
                        </li>
                        <li>
                            <a href="profile-setting.html">
                                <i data-feather="settings"></i>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li>
                            <a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                               href="javascript:void(0)">
                                <i data-feather="log-out"></i>
                                <span>Log out</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
