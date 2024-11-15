function viewCartHeaderDisplay() {
    let cart = getCart()
    const cartList = $('#cart-list');
    const cartCount = $('#cart-count');
    const cartTotal = $('#cart-total');
    const cartDropdown = $('.onhover-div-cart-list');
    cartList.empty(); // Xóa nội dung cũ

    if (cart.length === 0) {
        cartList.append('<li><p>Your cart is empty.</p></li>');
        cartCount.text('0');
        cartTotal.text('$0.00');
        cartDropdown.hide(); // Ẩn phần tử nếu giỏ hàng trống
    } else {
        let total = 0;
        let totalQuantity = 0; // Khởi tạo biến để đếm tổng số lượng sản phẩm
        cartCount.text(cart.length); // Cập nhật số lượng sản phẩm trên biểu tượng giỏ hàng
        cart.forEach(item => {
            total += item.price * item.quantity;
            totalQuantity += item.quantity;
            cartList.append(`
                <li class="product-box-contain">
                    <div class="drop-cart">
                        <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}" class="drop-image">
                            <img src="${item.img}" class="blur-up lazyload" alt="${item.name}">
                        </a>
                        <div class="drop-contain">
                            <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}">
                                <h5>${item.name}</h5>
                            </a>
                            <h6><span>${item.quantity} x</span> ${formatVND(item.price)}</h6>
                            <button class="btn btn-danger" style="margin: 0 80px;" onclick="removeProductCart(${item.productId})">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>
                    </div>
                </li>
            `);
        });
        cartCount.text(totalQuantity);
        cartTotal.text(`${formatVND(total)}`); // Cập nhật tổng giá trị giỏ hàng
        cartDropdown.show(); // Hiển thị phần tử nếu giỏ hàng có sản phẩm
    }
}

function removeProductCart(productId) {
    console.log("removeProductCart " + productId)
    removeFromCart(productId);
    viewCartHeaderDisplay()
    viewCartUser()
    displayCartQuantities()
}

function formatVND(price) {
    return price.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND',
        minimumFractionDigits: 0,
        maximumFractionDigits: 2
    });
}