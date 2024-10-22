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
                            <span>${user.email}</span>
                            <%-- Lấy roleID từ đối tượng user --%>
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
                        <%--                        <li>--%>
                        <%--                            <a href="">--%>
                        <%--                                <i data-feather="usezrs"></i>--%>
                        <%--                                <c:choose>--%>
                        <%--                                    <c:when test="${user.roleID == 1}">--%>
                        <%--                                        <span>Admin</span>--%>
                        <%--                                    </c:when>--%>
                        <%--                                    <c:when test="${user.roleID == 2}">--%>
                        <%--                                        <span>User</span>--%>
                        <%--                                    </c:when>--%>
                        <%--                                    <c:when test="${user.roleID == 3}">--%>
                        <%--                                        <span>Staff</span>--%>
                        <%--                                    </c:when>--%>
                        <%--                                    <c:otherwise>--%>
                        <%--                                        <span>Unknown Role</span>--%>
                        <%--                                    </c:otherwise>--%>
                        <%--                                </c:choose>--%>
                        <%--                            </a>--%>
                        <%--                        </li>--%>
                        <li>
                            <a href="<c:url value="/ChangePasswordStaffController"></c:url>">
                                <i data-feather="log-out"></i>
                                <span>Change Password</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/LoginAdminController?loginAction=logout"></c:url>">
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
