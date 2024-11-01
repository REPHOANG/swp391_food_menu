<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán Qua QR Code</title>
</head>
<body>
<h1>Quét Mã QR để Thanh Toán Qua VNPAY</h1>

<!-- Phần hình ảnh mã QR -->
<c:if test="${not empty qrCodeBase64}">
    <img src="data:image/png;base64,${qrCodeBase64}" alt="QR Code để thanh toán qua VNPAY" style="width:200px; height:200px;"/>
</c:if>

<p>Vui lòng sử dụng ứng dụng ngân hàng hỗ trợ VNPAY để quét mã QR và thực hiện thanh toán.</p>

<!-- Thêm nút để làm mới mã QR nếu cần -->
<form action="generateQR" method="get">
    <button type="submit">Làm mới mã QR</button>
</form>
</body>
</html>
