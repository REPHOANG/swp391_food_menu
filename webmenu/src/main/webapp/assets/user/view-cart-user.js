viewCartUser()

function viewCartUser() {
    let cart = getCart()
    const cartContainer = $('#table-cart-user');
    cartContainer.empty(); // Xóa nội dung cũ
    let totalPrice = 0;
    if (cart.length === 0) {
        cartContainer.append('<tr><td colspan="5">Your cart is empty.</td></tr>');
    }
    cart.forEach(item => {
        const itemTotal = (item.price * item.quantity);
        totalPrice += parseFloat(itemTotal);
        cartContainer.append(`
            <tr class="product-box-contain">
                <td class="product-detail">
                    <div class="product border-0">
                        <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}" class="product-image">
                            <img src="${item.img}" class="img-fluid blur-up lazyload" alt="${item.name}">
                        </a>
                        <div class="product-detail">
                            <ul>
                                <li class="name">
                                    <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}">${item.name}</a>
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
                                <button type="button" class="btn qty-left-minus-user" onclick="qtyLeftMinusUser(${item.productId})">
                                    <i class="fa fa-minus ms-0" aria-hidden="true"></i>
                                </button>
                                <input id="qty-input-${item.productId}" class="form-control input-number qty-input" type="text" name="quantity" value="${item.quantity}">
                                <button type="button" class="btn qty-right-plus-user"  onclick="qtyRightPlusUser(${item.productId})">
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
                    <a class="remove" href="javascript:void(0);" onclick="removeProductCartTable(${item.productId})">Remove</a>
                </td>
            </tr>
        `);
    });
    // Cập nhật tổng tiền
    $('#total-price').text(`${formatVND(totalPrice)}`);
    $('#price-order').text(`${formatVND(totalPrice)}`);
}

function removeProductCartTable(productId) {
    removeFromCart(productId);
    viewCartHeaderDisplay()
    viewCartUser()
}

function qtyLeftMinusUser(productId) {
    const input = document.getElementById(`qty-input-${productId}`);
    let currentQty = parseInt(input.value) || 0;
    currentQty -= 1;
    if (currentQty <= 0) {
        removeProductCartTable(productId)
    } else {
        input.value = currentQty;
        updateCartQuantity(productId, currentQty); // Giảm số lượng đi 1
        viewCartHeaderDisplay()
    }
    viewCartUser()
}

function qtyRightPlusUser(productId) {
    const input = document.getElementById(`qty-input-${productId}`);
    let currentQty = parseInt(input.value) || 0;
    currentQty += 1;
    input.value = currentQty;
    updateCartQuantity(productId, currentQty); // Tăng số lượng đi 1
    viewCartHeaderDisplay()
    viewCartUser()
}
