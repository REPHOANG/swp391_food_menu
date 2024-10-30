function viewOrderDetailUser() {
    let cart = orderDetails;
    const cartContainer = $('#table-cart-user');
    cartContainer.empty(); // Xóa nội dung cũ
    let totalPrice = 0;
    if (cart.length === 0) {
        cartContainer.append('<tr><td colspan="5">Your cart is empty.</td></tr>');
    }
    cart.forEach(item => {
        console.log("item " + item.quantity)
        const itemTotal = (item.productPrice * item.quantity);
        totalPrice += parseFloat(itemTotal);
        cartContainer.append(`
            <tr class="product-box-contain">
                <td class="product-detail">
                    <div class="product border-0">
                        <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}" class="product-image">
                            <img src="${item.productUrl}" class="img-fluid blur-up lazyload" alt="${item.productName}">
                        </a>
                        <div class="product-detail">
                            <h4 class="table-title text-content">Product Name</h4>
                            <ul>
                                <li class="name">
                                    <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}">${item.productName}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>

                <td class="price">
                    <h4 class="table-title text-content">Price</h4>
                    <h5>${formatVND(item.productPrice)}</h5>
                </td>

                <td class="quantity">
                    <h4 class="table-title text-content">Qty</h4>
                    ${item.quantity}
                </td>

                <td class="subtotal">
                    <h4 class="table-title text-content">Total</h4>
                    <h5>${formatVND(itemTotal)}</h5>
                </td>
            </tr>
        `);
    });
}