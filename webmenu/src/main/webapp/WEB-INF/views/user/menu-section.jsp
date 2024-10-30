<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="menu-section" style="background-color: #f8f9fa; padding: 15px 0;">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="menu-contain" style="text-align: center;">
                    <a href="<c:url value="MainController"/>"
                       style="color: black; text-decoration: none; margin: 0 15px; font-weight: bold;">
                        <i class="fa-solid fa-house"></i> Home
                    </a>
                    <c:if test="${user != null}">
                        <a href="<c:url value="OrderManagerController?orderAction=orderHistoryUser&userId=${user.userId}"/>"
                           style="color: black; text-decoration: none; margin: 0 15px; font-weight: bold;">
                            Order History
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
