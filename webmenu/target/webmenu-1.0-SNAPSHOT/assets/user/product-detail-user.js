displayCartQuantities()

// Hàm kiểm tra và hiển thị số lượng sản phẩm trong giỏ hàng
function displayCartQuantities() {
    let cartItems = getCart();
    document.querySelectorAll('.note-box.product-packege').forEach((productElement) => {
        const productId = parseInt(productElement.getAttribute('data-product-id'));
        // Kiểm tra xem sản phẩm có trong giỏ hàng không
        const cartItem = cartItems.find(item => item.productId === productId);
        // Nếu sản phẩm đã có trong giỏ hàng, hiển thị khung số lượng và cập nhật số lượng
        if (cartItem) {
            // Nếu sản phẩm đã có trong giỏ hàng, hiển thị khung số lượng và cập nhật số lượng
            productElement.querySelector('.cart_qty').style.display = 'block';
            productElement.querySelector('.qty-input').value = cartItem.quantity;
            productElement.querySelector('.cart-button').style.display = 'none';
        } else {
            productElement.querySelector('.cart_qty').style.display = 'none';
            productElement.querySelector('.qty-input').value = 1;
            productElement.querySelector('.cart-button').style.display = 'block';
        }
    });
}

// localStorage.removeItem('cart')
function addToCartProductDetail(button) {
    const productBox = button.closest('.product-packege');
    // Lấy thông tin sản phẩm từ `data-*`
    const productId = parseInt(productBox.dataset.productId, 10); // chuyển productId về số
    const productName = productBox.dataset.productName;
    const productCategory = productBox.dataset.productCategory;
    const productPrice = parseFloat(productBox.dataset.productPrice);
    const productImg = productBox.dataset.productImg;
    // Tạo đối tượng sản phẩm
    const product = {
        productId: productId,
        name: productName,
        category: productCategory,
        price: productPrice,
        img: (productImg === null || productImg === "undefined") ? null : productImg
    };
    const quantityInput = document.getElementById(`quantity-${productId}`);
    // Gán giá trị mới cho ô input
    quantityInput.value = 1; // Gán giá trị 1 cho ô input
    addToCart(product, 1)
    viewCartHeaderDisplay()
    const qtyBox = productBox.querySelector('.cart_qty.qty-box.product-qty');
    qtyBox.style.display = 'block'; // Hiển thị phần tử sau khi nhấn "Add To Cart"
    button.style.display = 'none'; // Ẩn nút "Add To Cart" sau khi nhấn
}

function qtyLeftMinusProductDetail(productId) {
    const quantityInput = document.getElementById(`quantity-${productId}`);
    let quantity = parseInt(quantityInput.value);
    quantity -= 1;
    console.log("quantity " + quantity)
    if (quantity <= 0) {
        removeProductCart(productId)
        // Cập nhật giao diện
        const productElement = document.querySelector(`.note-box[data-product-id="${productId}"]`);
        if (productElement) {
            // Ẩn khung số lượng
            productElement.querySelector('.cart_qty').style.display = 'none';
            // Hiển thị lại nút "Add To Cart"
            productElement.querySelector('.cart-button').style.display = 'block';
        }
        const quantityInput = document.getElementById(`quantity-${productId}`);
        // Gán giá trị mới cho ô input
        quantityInput.value = 1; // Gán giá trị 1 cho ô input
    } else {
        updateCartQuantity(productId, quantity)
        viewCartHeaderDisplay()
    }
}

function qtyRightPlusProductDetail(productId) {
    const quantityInput = document.getElementById(`quantity-${productId}`);
    let quantity = parseInt(quantityInput.value);
    quantity += 1;
    updateCartQuantity(productId, quantity)
    viewCartHeaderDisplay()
    console.log("Tăng " + productId + " - " + quantity)
}