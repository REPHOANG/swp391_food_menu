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
                        <div class="delivery-icon">
                            <i data-feather="user"></i>
                        </div>
                        <div class="user-name-hide media-body">
                            <span>${user.email}</span>
                            <c:choose>
                                <c:when test="${user.roleID == 1}">
                                    <p class="mb-0 font-roboto">Admin<i class="middle ri-arrow-down-s-line"></i></p>
                                </c:when>
                                <c:when test="${user.roleID == 2}">
                                    <p class="mb-0 font-roboto">User<i class="middle ri-arrow-down-s-line"></i></p>
                                </c:when>
                                <c:when test="${user.roleID == 3}">
                                    <p class="mb-0 font-roboto">Staff<i class="middle ri-arrow-down-s-line"></i></p>
                                </c:when>
                                <c:otherwise>
                                    <p class="mb-0 font-roboto">Unknown Role<i class="middle ri-arrow-down-s-line"></i>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <ul class="profile-dropdown onhover-show-div">
                        <c:if test="${user != null}">
                            <li class="product-box-contain">
                                <a href="<c:url value="/ViewProfileController?viewProfileAction=profileActionAdmin"></c:url>">Profile</a>
                            </li>
                            <li class="product-box-contain">
                                <a href="<c:url value="/LoginWebController?loginAction=logout"></c:url>">Log out</a>
                            </li>
                        </c:if>
                        <li class="product-box-contain">
                            <a href="<c:url value="/ChangePasswordStaffController"></c:url>">Change Password</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
