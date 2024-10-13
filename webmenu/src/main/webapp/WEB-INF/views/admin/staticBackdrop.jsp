<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
