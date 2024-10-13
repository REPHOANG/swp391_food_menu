<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="logo-wrapper logo-wrapper-center">
    <a href="<c:url value="AdminController" />" data-bs-original-title="" title="">
        <img class="img-fluid for-white"
             src="<c:url value='/assets/admin/images/logo/1-white.png'/>"
             alt="logo">
    </a>
    <div class="back-btn">
        <i class="fa fa-angle-left"></i>
    </div>
    <div class="toggle-sidebar">
        <i class="ri-apps-line status_toggle middle sidebar-toggle"></i>
    </div>
</div>
<div class="logo-icon-wrapper">
    <a href="index.html">
        <img class="img-fluid main-logo main-white"
             src="<c:url value='/assets/admin/images/logo/1-white.png' />"
             alt="logo">
        <img class="img-fluid main-logo main-dark"
             src="<c:url value='/assets/admin/images/logo/logo-white.png' />"
             alt="logo">
    </a>
</div>
</body>
</html>
