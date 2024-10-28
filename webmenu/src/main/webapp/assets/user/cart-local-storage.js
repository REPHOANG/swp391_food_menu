console.log("cart-local-storage.js")
viewCartUser()
export function applyQuantityAdjustment() {
    console.log("applyQuantityAdjustment")
    $(".addcart-button").off('click').on('click', function () {
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');
        const productName = productElement.data('product-name');
        const productCategory = productElement.data('product-category');
        const productPrice = parseFloat(productElement.data('product-price'));
        const productImg = productElement.data('product-img');
        const product = {
            productId: productId,
            name: productName,
            category: productCategory,
            price: productPrice,
            img: (productImg === null || productImg === "undefined") ? null : productImg
        };

        const $qtyInput = productElement.find('.qty-input');
        let quantity = parseInt($qtyInput.val());

        if (isNaN(quantity) || quantity <= 0) {
            $qtyInput.val(1);
            quantity = 1; // Khởi tạo số lượng là 1 nếu không hợp lệ
        }

        productElement.find('.cart_qty').addClass("open");

        // Thêm sản phẩm vào giỏ hàng với số lượng
        addToCart(product, quantity);
    });

    // Xử lý sự kiện khi nhấn nút tăng số lượng (plus)
    $('.qty-right-plus').off('click').on('click', function () {
        const $qty = $(this).siblings(".qty-input");
        let currentVal = parseInt($qty.val());
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');

        if (!isNaN(currentVal)) {
            $qty.val(currentVal + 1); // Tăng số lượng lên 1

            // Cập nhật số lượng trong giỏ hàng
            updateCartQuantity(productId, currentVal + 1);
        }
    });

    // Xử lý sự kiện khi nhấn nút giảm số lượng (minus)
    $('.qty-left-minus').off('click').on('click', function () {
        const $qty = $(this).siblings(".qty-input");
        let currentVal = parseInt($qty.val());
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');

        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1); // Giảm số lượng đi 1
            // Cập nhật số lượng trong giỏ hàng
            updateCartQuantity(productId, currentVal - 1);
        } else {
            $qty.val(""); // Xóa giá trị nếu số lượng là 1
            $(this).closest('.cart_qty').removeClass("open"); // Ẩn bộ điều khiển số lượng
            // Xóa sản phẩm khỏi giỏ hàng nếu số lượng là 0
            removeFromCart(productId);
        }
    });
}

function addToCart(product, quantity) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
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
    viewCartHeaderDisplay()
    viewCartUser()
}

function updateCartQuantity(productId, newQuantity) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const productIndex = cart.findIndex(item => item.productId === productId);
    if (productIndex !== -1) {
        cart[productIndex].quantity = newQuantity; // Cập nhật số lượng mới
        if (newQuantity <= 0) {
            // Nếu số lượng <= 0 thì xóa sản phẩm khỏi giỏ hàng
            cart.splice(productIndex, 1);
        }
    }
    // Lưu lại giỏ hàng đã cập nhật vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
    viewCartHeaderDisplay()
    viewCartUser()
}

function removeFromCart(productId) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    // Lọc ra các sản phẩm không có productId trùng với sản phẩm cần xóa
    cart = cart.filter(item => item.productId !== productId);
    // Lưu lại giỏ hàng mới vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));
    viewCartHeaderDisplay()
    viewCartUser()
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

function viewCartUser() {
    console.log("viewCartUser")
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartContainer = $('.table tbody'); // Vùng chứa sản phẩm trong giỏ
    cartContainer.empty(); // Xóa nội dung cũ

    if (cart.length === 0) {
        cartContainer.append('<tr><td colspan="5">Your cart is empty.</td></tr>');
        return;
    }

    let totalPrice = 0;

    cart.forEach(item => {
        const itemTotal = (item.price * item.quantity);
        totalPrice += parseFloat(itemTotal);
        cartContainer.append(`
            <tr class="product-box-contain">
                <td class="product-detail">
                    <div class="product border-0">
                        <a href="product-left-thumbnail.html" class="product-image">
                            <img src="${item.img}" class="img-fluid blur-up lazyload" alt="${item.name}">
                        </a>
                        <div class="product-detail">
                            <ul>
                                <li class="name">
                                    <a href="product-left-thumbnail.html">${item.name}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>

                <td class="price">
                    <h4 class="table-title text-content">Price</h4>
                    <h5>${formatVND(item.price)}</h5>
                </td>

                <td class="quantity">
                    <h4 class="table-title text-content">Qty</h4>
                    <div class="quantity-price">
                        <div class="cart_qty">
                            <div class="input-group">
                                <button type="button" class="btn qty-left-minus-user" data-user-product-id="${item.productId}">
                                    <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                </button>
                                <input class="form-control input-number qty-input" type="text" name="quantity" value="${item.quantity}">
                                <button type="button" class="btn qty-right-plus-user" data-user-product-id="${item.productId}">
                                    <i class="fa fa-plus ms-0" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </td>

                <td class="subtotal">
                    <h4 class="table-title text-content">Total</h4>
                    <h5>${formatVND(itemTotal)}</h5>
                </td>

                <td class="save-remove">
                    <h4 class="table-title text-content">Action</h4>
                    <a class="remove close_button" data-product-id="${item.productId}" href="javascript:void(0)">Remove</a>
                </td>
            </tr>
        `);
    });
    // Cập nhật tổng tiền
    $('#total-price').text(`${formatVND(totalPrice)}`);
    $('#price-order').text(`${formatVND(totalPrice)}`);
    attachCartEvents()
}

// Hàm gắn lại sự kiện cho các nút tăng/giảm số lượng và xóa sản phẩm
function attachCartEvents() {
    // Xử lý sự kiện tăng số lượng
    $('.qty-right-plus-user').off('click').on('click', function () {
        const productId = $(this).data('user-product-id');
        const $input = $(this).siblings('.qty-input'); // Lấy input chứa số lượng
        let currentQuantity = parseInt($input.val());
        updateCartQuantity(productId, currentQuantity + 1); // Tăng số lượng lên 1
    });

    // Xử lý sự kiện giảm số lượng
    $('.qty-left-minus-user').off('click').on('click', function () {
        const productId = $(this).data('user-product-id');
        const $input = $(this).siblings('.qty-input'); // Lấy input chứa số lượng
        let currentQuantity = parseInt($input.val());
        updateCartQuantity(productId, currentQuantity - 1); // Giảm số lượng đi 1
    });

    // Xử lý sự kiện xóa sản phẩm
    $('.close_button').off('click').on('click', function () {
        const productId = $(this).data('product-id');
        // removeFromCart(productId); // Xóa sản phẩm khỏi giỏ hàng
    });
}

function formatVND(price) {
    return price.toLocaleString('vi-VN', {
        style: 'currency',
        currency: 'VND',
        minimumFractionDigits: 0,
        maximumFractionDigits: 2
    });
}