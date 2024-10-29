// Hàm lấy giỏ hàng từ localStorage
function getCart() {
    const cart = localStorage.getItem('cart');
    return cart ? JSON.parse(cart) : [];
}

function addToCart(product, quantity) {
    console.log("addToCart")
    let cart = getCart();
    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    const existingProductIndex = cart.findIndex(item => item.productId === product.productId);
    if (existingProductIndex !== -1) {
        // Nếu đã có, tăng số lượng sản phẩm
        cart[existingProductIndex].quantity += quantity;
    } else {
        // Nếu chưa có, thêm sản phẩm mới vào giỏ hàng
        product.quantity = quantity;
        cart.push(product);
    }
    // Lưu giỏ hàng vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
}

function updateCartQuantity(productId, newQuantity) {
    console.log("updateCartQuantity " + productId + " - " + newQuantity)
    let cart = getCart();
    const productIndex = cart.findIndex(item => item.productId === productId);
    console.log("productIndex " + productIndex)
    if (productIndex !== -1) {
        cart[productIndex].quantity = newQuantity; // Cập nhật số lượng mới
        if (newQuantity <= 0) {
            // Nếu số lượng <= 0 thì xóa sản phẩm khỏi giỏ hàng
            cart.splice(productIndex, 1);
        }
    }
    console.log("JSON.stringify(cart) " + JSON.stringify(cart))
    // Lưu lại giỏ hàng đã cập nhật vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
}

function removeFromCart(productId) {
    let cart = getCart();
    // Lọc ra các sản phẩm không có productId trùng với sản phẩm cần xóa
    cart = cart.filter(item => item.productId !== productId);
    // Lưu lại giỏ hàng mới vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
    // Chuyển nút sản phẩm tương ứng về trạng thái "Add"
    const productElement = $(`[data-product-id='${productId}']`);
    if (productElement.length) {
        // Ẩn điều khiển số lượng
        productElement.find('.cart_qty').removeClass("open");
        // Đặt lại giá trị ô số lượng về 0
        productElement.find('.qty-input').val(0);
    }
}

$(document).on('click', '.close_button', function () {
    const productId = $(this).data('product-id');
    removeFromCart(productId);
});

function formatVND(price) {
    return price.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND',
        minimumFractionDigits: 0,
        maximumFractionDigits: 2
    });
}