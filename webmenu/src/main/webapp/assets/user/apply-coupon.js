loadCoupons();
let orderTotal = 0;
let discountUser = null;

function loadCoupons() {
    const url = '/webmenu/DiscountManagerController?discountAction=discountUser';
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const couponList = document.getElementById('exampleFormControlInput1');
            couponList.innerHTML = ''; // Clear previous options if any
            couponList.innerHTML = '<option value="">Select a Coupon</option>'; // Add default option
            // Add each coupon to the dropdown
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item.id;
                option.text = item.discountCode;
                couponList.appendChild(option);
            });
        })
        .catch(error => console.error('Error loading coupons:', error));
}

// Hàm xử lý khi nhấn nút Apply
function applyCoupon() {
    const couponList = document.getElementById('exampleFormControlInput1');
    const selectedText = couponList.selectedOptions[0].text; // Get the text of the selected option
    discountId = couponList.value; // Get the value of the selected option
    // Check if selectedCoupon is an empty string or null
    if (discountId === "" || discountId === null) {
        alert("Please select a valid coupon code.");
        return;
    }
    const url = `/webmenu/DiscountManagerController?discountAction=checkDiscountByCode&discountCode=${encodeURIComponent(selectedText)}`;
    fetch(url)
        .then(response => {
            return response.json();
        })
        .then(data => {
            if (data === null || data === undefined) {
                alert("Coupon is invalid or out of stock.");
            } else {
                discountUser = {
                    id: data.id,
                    discountCode: data.discountCode,
                    name: data.name,
                    description: data.description,
                    discountPercent: data.discountPercent,
                    maxDiscountValue: data.maxDiscountValue,
                    minDiscountValue: data.minDiscountValue,
                    startDate: data.startDate,
                    endDate: data.endDate,
                    quantity: data.quantity,
                    rmQuantity: data.rmQuantity
                };
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                let totalPrice = 0;
                cart.forEach(item => {
                    const itemTotal = (item.price * item.quantity);
                    totalPrice += parseFloat(itemTotal);
                });
                let priceOrder = totalPrice - data.maxDiscountValue;
                document.getElementById("coupon-discount").textContent = `(-) ${formatVND(data.maxDiscountValue)}`;
                document.getElementById("price-order").textContent = formatVND(priceOrder);
            }
        })
        .catch(error => {
            console.error('Error loading coupon:', error);
            alert("An error occurred while checking the coupon.");
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

function placeOrder() {
    // Lấy các sản phẩm trong giỏ hàng từ localStorage
    const cart = JSON.parse(localStorage.getItem('cart')) || [];

    // Kiểm tra nếu giỏ hàng rỗng
    if (cart.length === 0) {
        alert("Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ trước khi đặt hàng.");
        return; // Thoát khỏi hàm nếu giỏ hàng rỗng
    }

    const orderDetails = []; // Khởi tạo mảng orderDetails để chứa chi tiết đơn hàng
    let totalPrice = 0; // Biến tổng giá trị đơn hàng

    cart.forEach((item, index) => {
        const itemTotal = item.price * item.quantity; // Tính tổng cho từng sản phẩm
        totalPrice += parseFloat(itemTotal); // Cộng vào tổng giá trị đơn hàng

        // Thêm chi tiết cho từng sản phẩm trong giỏ vào mảng orderDetails
        orderDetails.push({
            orderId: null, // Gán ID đơn hàng khi có sẵn
            orderDetailId: index + 1, // Gán ID chi tiết đơn hàng là index + 1 để duy nhất
            quantity: item.quantity, // Số lượng sản phẩm
            productId: item.productId, // ID sản phẩm
            productName: item.name, // Tên sản phẩm
            productUrl: (item.img != null && item.img != undefined) ? item.img : null, // Đường dẫn hình ảnh sản phẩm
            productPrice: item.price // Giá sản phẩm
        });
    });

    // Kiểm tra nếu có mã giảm giá
    let orderTotal = 0;
    if (typeof discountUser !== "undefined" && discountUser != null) {
        orderTotal = totalPrice - discountUser.maxDiscountValue; // Tính tổng sau khi giảm giá
    } else {
        orderTotal = totalPrice; // Không giảm giá
    }

    const tableId = null; // ID bàn, đặt là null nếu không có

    // Tạo đối tượng đơn hàng (orderDto) để gửi yêu cầu
    const orderDto = {
        orderId: null, // Thay bằng ID đơn hàng thực tế nếu có
        tableId: typeof tableId !== "undefined" ? tableId : null, // Kiểm tra tableId có xác định, nếu không đặt là null
        userId: document.getElementById("userId").value ? parseInt(document.getElementById("userId").value) : null, // Lấy userId nếu có
        discountId: (typeof discountUser !== "undefined" && discountUser !== null) ? discountUser.id : null, // ID mã giảm giá nếu có
        userName: document.getElementById("fullName").value, // Tên người dùng
        orderDate: new Date().toISOString(), // Ngày hiện tại
        deliveryAddress: document.getElementById("email").value || null, // Địa chỉ giao hàng, dùng email nếu có
        orderNote: document.getElementById("orderNote").value, // Ghi chú đơn hàng từ người dùng
        orderStatus: null, // Trạng thái đơn hàng mặc định, có thể chỉnh lại
        orderTotal: typeof orderTotal !== "undefined" ? orderTotal : 0, // Tổng giá trị đơn hàng
        shippingFee: null, // Phí vận chuyển nếu có
        orderDetailDto: Array.isArray(orderDetails) ? orderDetails : [] // Mảng chi tiết đơn hàng
    };

    // Gửi yêu cầu tới máy chủ bằng phương thức fetch
    fetch('/webmenu/OrderUserController', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' // Định dạng JSON
        },
        body: JSON.stringify(orderDto) // Chuyển đổi đối tượng orderDto thành chuỗi JSON
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("Đặt hàng thành công!"); // Thông báo khi đặt hàng thành công
            } else {
                alert("Đặt hàng thất bại: " + data.message); // Thông báo lỗi khi đặt hàng thất bại
            }
        })
        .catch(error => console.error("Lỗi khi gửi đơn hàng:", error)); // Xử lý lỗi khi gửi yêu cầu
    // Thêm các logic bổ sung cho việc xử lý đơn hàng ở đây nếu cần...
}
