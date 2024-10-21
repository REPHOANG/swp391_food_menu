<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chào buổi trưa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
        }

        .greeting {
            font-size: 20px;
            font-weight: bold;
        }

        .table-info {
            font-size: 14px;
            color: #555;
        }

        .table-info span {
            font-weight: bold;
            color: #4CAF50;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .buttons div {
            flex: 1;
            margin: 0 5px;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 10px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .buttons div:hover {
            background-color: #ddd;
        }

        .buttons img {
            width: 40px;
            height: 40px;
        }

        .menu-button {
            background-color: #f44336;
            color: white;
            padding: 15px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            cursor: pointer;
        }

        .menu-button:hover {
            background-color: #d32f2f;
        }

        .footer {
            font-size: 12px;
            color: #999;
            margin-top: 20px;
        }

        .footer img {
            width: 30px;
            height: 30px;
            vertical-align: middle;
        }

        /* Container cho sản phẩm */
        .menu-container {
            display: flex;
            flex-wrap: wrap; /* Cho phép sản phẩm tự động xuống dòng nếu không đủ chỗ */
            gap: 20px; /* Khoảng cách giữa các sản phẩm */
            justify-content: center; /* Căn giữa các sản phẩm */
        }

        /* Mỗi sản phẩm (menu-item) */
        .menu-item {
            flex: 1 1 calc(50% - 20px); /* Hiển thị 2 sản phẩm mỗi hàng */
            box-sizing: border-box;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Giãn cách đều nội dung */
            min-height: 350px; /* Đảm bảo chiều cao tối thiểu cho mỗi sản phẩm */
            max-width: 250px;
        }

        /* Đảm bảo hình ảnh không vượt quá kích thước container */
        .menu-item img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto 10px;
        }

        /* Nút gọi món */
        .menu-item button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="greeting">
        Xin Chào <span style="color: #007bff;">${user.username}</span>
    </div>
    <div class="table-info">
        Chúng tôi sẽ trả đồ cho bạn tại bàn: <span>${tableDTO.tableName}</span>
    </div>
    <div class="buttons">
        <div>
            <img src="https://img.icons8.com/ios-filled/50/000000/bill.png" alt="Gọi thanh toán">
            <p>Gọi thanh toán</p>
        </div>
        <div>
            <img src="https://img.icons8.com/ios-filled/50/000000/waiter.png" alt="Gọi nhân viên">
            <p>Gọi nhân viên</p>
        </div>
        <div>
            <img src="https://img.icons8.com/ios-filled/50/000000/rating.png" alt="Đánh giá">
            <p>Đánh giá</p>
        </div>
    </div>

    <div class="cart-container" id="cart-container" style="display: none;">
        <h3>Giỏ hàng của bạn</h3>
        <div id="cart-items">
            <!-- Các sản phẩm trong giỏ hàng sẽ được thêm vào đây -->
        </div>
        <!-- Đặt ghi chú và input trong cùng một dòng -->
        <div class="note-container">
            <label>Ghi Chú:</label>
            <textarea></textarea>
        </div>
        <p id="total-price">Tổng tiền: 0 VND</p>
        <button id="checkout-btn">Thanh toán</button>
    </div>

    <div class="menu-button" id="view-menu-btn">
        Xem Menu - Gọi món
    </div>

    <!-- Phần chứa danh sách món ăn -->
    <div class="menu-container" id="menu-container" style="display: none;">
        <!-- JavaScript sẽ thêm các món ăn vào đây -->
    </div>

    <div class="pagination" id="pagination" style="display: none;">
        <!-- Nút phân trang sẽ được thêm vào đây -->
    </div>
</div>
<script src="<c:url value="/assets/user/home-user.js"/>"></script>
<script src="<c:url value="/assets/user/cart-user.js"/>"></script>
</body>
</html>