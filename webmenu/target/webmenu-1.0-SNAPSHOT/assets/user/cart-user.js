let cart = []; // Mảng chứa các sản phẩm trong giỏ hàng
// Khi trang được tải lại, kiểm tra giỏ hàng từ localStorage
window.onload = function () {
    const savedCart = localStorage.getItem('cart'); // Lấy dữ liệu giỏ hàng từ localStorage
    if (savedCart) {
        cart = JSON.parse(savedCart); // Nếu có, khôi phục lại giỏ hàng từ localStorage
        updateCart(); // Cập nhật giao diện giỏ hàng với dữ liệu đã lưu
    }
}

// Hàm xử lý gọi món, nhận chuỗi JSON đã mã hóa
function order(itemString, productId) {
    const item = JSON.parse(decodeURIComponent(itemString)); // Chuyển chuỗi JSON đã mã hóa thành đối tượng
    const quantity = parseInt(document.getElementById(`quantity-${productId}`).value); // Lấy số lượng từ input
    addToCart(item, quantity); // Thêm sản phẩm vào giỏ hàng với số lượng
}

// Hàm để thêm sản phẩm vào giỏ hàng
function addToCart(item, quantity) {
    const existingItem = cart.find(cartItem => cartItem.productId === item.productId);
    if (existingItem) {
        existingItem.quantity += quantity; // Tăng số lượng nếu sản phẩm đã có
    } else {
        cart.push({
            ...item,
            quantity: quantity // Thêm số lượng đã chọn
        });
    }
    updateCart(); // Cập nhật giỏ hàng sau khi thêm sản phẩm
}

// Hàm xóa sản phẩm khỏi giỏ hàng
function removeFromCart(productId) {
    cart = cart.filter(cartItem => cartItem.productId !== productId); // Xóa sản phẩm dựa trên productId
    updateCart(); // Cập nhật giỏ hàng sau khi xóa sản phẩm
}

// Hàm cập nhật số lượng sản phẩm trong giỏ hàng
function updateQuantity(productId, newQuantity) {
    const item = cart.find(cartItem => cartItem.productId === productId);
    if (item) {
        if (newQuantity <= 0) {
            removeFromCart(productId); // Xóa sản phẩm nếu số lượng <= 0
        } else {
            item.quantity = newQuantity; // Cập nhật số lượng
            updateCart(); // Cập nhật giỏ hàng sau khi thay đổi số lượng
        }
    }
}

// Hàm cập nhật giỏ hàng
function updateCart() {
    const cartItemsContainer = document.getElementById('cart-items');
    const totalPriceElement = document.getElementById('total-price');

    // Xóa nội dung cũ của giỏ hàng
    cartItemsContainer.innerHTML = '';

    let totalPrice = 0;

    // Tạo bảng để hiển thị giỏ hàng
    const table = document.createElement('table');
    table.classList.add('cart-table');
    table.innerHTML = `
        <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thao tác</th>
                <th>Tổng cộng</th>
            </tr>
        </thead>
        <tbody id="cart-table-body"></tbody>
    `;

    const tableBody = table.querySelector('#cart-table-body');

    // Hiển thị từng sản phẩm trong giỏ hàng
    cart.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.name}</td>
            <td>${item.price} VND</td>
            <td>${item.quantity}</td>
            <td>
                <button onclick="updateQuantity(${item.productId}, ${item.quantity - 1})">-</button>
                <button onclick="updateQuantity(${item.productId}, ${item.quantity + 1})">+</button>
                <button onclick="removeFromCart(${item.productId})">Xóa</button>
            </td>
            <td>${item.price * item.quantity} VND</td>
        `;
        tableBody.appendChild(row);
        totalPrice += item.price * item.quantity;
    });

    // Thêm bảng vào giỏ hàng
    cartItemsContainer.appendChild(table);

    // Cập nhật tổng tiền
    totalPriceElement.textContent = `Tổng tiền: ${totalPrice} VND`;

    // Lưu giỏ hàng vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));

    // Hiển thị giỏ hàng
    document.getElementById('cart-container').style.display = 'block';
}

// Hàm để xử lý khi người dùng nhấn nút thanh toán
document.getElementById('checkout-btn').addEventListener('click', function () {
    if (cart.length === 0) {
        alert("Giỏ hàng của bạn trống!");
    } else {
        // Lấy thông tin ghi chú từ textarea
        const orderNote = document.querySelector('.note-container textarea').value;
        // Lấy toàn bộ thông tin sản phẩm trong giỏ hàng
        let cartDetails = "Thông tin giỏ hàng:\n";
        cart.forEach(item => {
            cartDetails += `Sản phẩm: ${item.name}, Số lượng: ${item.quantity}, Giá: ${item.price} VND\n`;
        });
        // Lấy tổng tiền từ giao diện
        const totalPrice = document.getElementById('total-price').textContent;
        // Thông tin hoàn chỉnh
        const fullOrderDetails = cartDetails + `\nGhi chú: ${orderNote}\n` + totalPrice;
        // Hiển thị thông tin đơn hàng
        alert(fullOrderDetails);
        // Thực hiện thanh toán hoặc chuyển hướng tới trang thanh toán
        cart = []; // Xóa giỏ hàng sau khi thanh toán
        localStorage.removeItem('cart'); // Xóa giỏ hàng khỏi localStorage
        updateCart(); // Cập nhật lại giỏ hàng (sẽ trống sau khi thanh toán)
    }
});
