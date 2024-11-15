let orderTotal = 0;
let discountUser = null;
let selectedTables = []; // Khởi tạo biến để lưu danh sách bàn
loadCoupons();
loadTable()

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

function loadTable() {
    const url = '/webmenu/TableManagerController?tableAction=listSelectedTableUser';
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            selectedTables = data; // Lưu danh sách bàn từ server
            populateCapacityDropdown(data); // Gọi hàm điền dropdown sức chứa
            addDropdownChangeListener(); // Thêm sự kiện thay đổi cho dropdown
        })
        .catch(error => console.error('Error loading tables:', error));
}

// Hàm điền dropdown với các giá trị sức chứa duy nhất
function populateCapacityDropdown(data) {
    const uniqueCapacities = new Set();
    data.forEach(table => {
        uniqueCapacities.add(table.capacity); // Thêm sức chứa duy nhất vào Set
    });
    const selectElement = document.getElementById("capacity-table-selection");
    selectElement.innerHTML = ''; // Xóa các tùy chọn hiện tại nếu có
    uniqueCapacities.forEach(capacity => {
        const option = document.createElement("option");
        option.value = capacity;
        option.textContent = capacity;
        if (userSelectedTableCart && parseInt(userSelectedTableCart.capacity) === parseInt(capacity)) {
            option.selected = true;
        }
        selectElement.appendChild(option);
    });
    populateTableDropdown(parseInt(selectElement.value)); // Gọi hàm điền dropdown bàn với sức chứa ban đầu
}

// Hàm thêm sự kiện thay đổi cho dropdown
function addDropdownChangeListener() {
    const selectElement = document.getElementById("capacity-table-selection");
    // Kiểm tra nếu sự kiện chưa được thêm
    if (!selectElement.hasAttribute('data-listener')) {
        selectElement.setAttribute('data-listener', 'true'); // Đánh dấu đã thêm sự kiện
        selectElement.addEventListener("change", () => {
            const selectedCapacity = parseInt(selectElement.value);
            populateTableDropdown(selectedCapacity); // Gọi hàm điền dropdown bàn khi thay đổi sức chứa
        });
    }
}

// Hàm điền dropdown bàn với sức chứa được chọn
function populateTableDropdown(capacity) {
    const tableSelect = document.getElementById("table-selection");
    tableSelect.innerHTML = ''; // Xóa các tùy chọn hiện tại nếu có
    selectedTables.forEach(table => {
        if ((userSelectedTableCart && parseInt(userSelectedTableCart.tableId) === parseInt(table.tableId)) || (parseInt(table.status) === 0 && parseInt(table.capacity) === capacity)) {
            const option = document.createElement("option");
            option.value = table.tableId;
            option.textContent = `${table.tableName} - Capacity: ${table.capacity} - Status: ${table.status === 0 ? 'Available' : table.status === 1 ? 'In Use' : ''}`;
            // Đặt bàn đã chọn của người dùng làm tùy chọn mặc định
            if (userSelectedTableCart && parseInt(userSelectedTableCart.tableId) === parseInt(table.tableId)) {
                option.selected = true;
            }
            tableSelect.appendChild(option);
        }
    });
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
                let cart = getCart();
                let totalPrice = 0;
                cart.forEach(item => {
                    const itemTotal = (item.price * item.quantity);
                    totalPrice += parseFloat(itemTotal);
                });
                let couponDiscount = 0;
                if (totalPrice <= data.maxDiscountValue) {
                    couponDiscount = totalPrice * (data.discountPercent / 100);
                } else {
                    couponDiscount = data.maxDiscountValue;
                }
                let priceOrder = totalPrice - couponDiscount;
                document.getElementById("coupon-discount").textContent = `(-) ${formatVND(couponDiscount)}`;
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
    const cart = getCart();

    // Kiểm tra nếu giỏ hàng rỗng
    if (cart.length === 0) {
        alert("Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ trước khi đặt hàng.");
        return; // Thoát khỏi hàm nếu giỏ hàng rỗng
    }

    // Lấy các giá trị cần kiểm tra
    const tableId = document.getElementById("table-selection").value;
    const fullName = document.getElementById("fullName").value.trim();
    // Xóa thông báo lỗi cũ
    document.getElementById("table-error").style.display = "none";
    document.getElementById("name-error").style.display = "none";
    // Biến kiểm soát lỗi
    let hasError = false;
    // Kiểm tra trường "Table"
    if (!tableId) {
        document.getElementById("table-error").style.display = "block";
        hasError = true;
    }
    // Kiểm tra trường "Full Name"
    if (!fullName) {
        document.getElementById("name-error").style.display = "block";
        hasError = true;
    }
    // Nếu có lỗi, ngăn không cho gửi đơn hàng
    if (hasError) {
        return;
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

    // Tạo đối tượng đơn hàng (orderDto) để gửi yêu cầu
    const orderDto = {
        orderId: null, // Thay bằng ID đơn hàng thực tế nếu có
        tableId: typeof tableId !== "undefined" ? tableId : null, // Kiểm tra tableId có xác định, nếu không đặt là null
        tableName: null,
        userId: document.getElementById("userId").value ? parseInt(document.getElementById("userId").value) : null, // Lấy userId nếu có
        discountId: (typeof discountUser !== "undefined" && discountUser !== null) ? discountUser.id : null, // ID mã giảm giá nếu có
        discountCode: null,
        userName: document.getElementById("fullName").value, // Tên người dùng
        orderDate: new Date().toISOString(), // Ngày hiện tại
        deliveryAddress: null, // Địa chỉ giao hàng, dùng email nếu có
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
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(orderDto)
    }).then(response => {
        if (!response.ok) {
            // Kiểm tra mã trạng thái HTTP nếu có lỗi
            if (response.status === 400) {
                throw new Error("Bad Request: Đặt hàng thất bại do dữ liệu không hợp lệ.");
            } else if (response.status === 500) {
                throw new Error("Internal Server Error: Có sự cố khi xử lý đơn hàng.");
            } else {
                throw new Error("Có sự cố không xác định xảy ra.");
            }
        }
        // Nếu phản hồi thành công, chuyển đổi sang JSON
        return response.json();
    }).then(data => {
        if (data.success) {
            alert("Đặt hàng thành công!"); // Thông báo khi đặt hàng thành công
            localStorage.removeItem('cart')
            if (userSelectedTableCart && userSelectedTableCart.tableId) {
                window.location.href = "/webmenu/MainController?tableId=" + userSelectedTableCart.tableId;
            } else {
                window.location.href = "/webmenu/MainController";
            }
        } else {
            alert("Đặt hàng thất bại: " + data.message); // Thông báo lỗi khi đặt hàng thất bại
        }
    }).catch(error => {
        console.error("Lỗi khi gửi đơn hàng:", error);
        alert(error.message); // Hiển thị thông báo lỗi chi tiết cho người dùng
    });
}
