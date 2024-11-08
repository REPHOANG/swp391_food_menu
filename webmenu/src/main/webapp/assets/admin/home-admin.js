let startDateBestSelling = null;
let endDateBestSelling = null;

let startDateRecentOrders = null;
let endDateRecentOrders = null;

function getTodayDate() {
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0'); // Đảm bảo ngày có 2 chữ số
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
    const year = today.getFullYear();
    // Trả về ngày theo định dạng YYYY-MM-DD
    return year + `-` + month + `-` + day;
}

document.getElementById("start-date-best-selling").value = getTodayDate();
document.getElementById("end-date-best-selling").value = getTodayDate();
// Đặt giá trị max cho Start Date và End Date để không chọn ngày lớn hơn ngày hiện tại
document.getElementById("start-date-best-selling").setAttribute("max", getTodayDate());
document.getElementById("end-date-best-selling").setAttribute("max", getTodayDate());
// Lắng nghe sự kiện thay đổi của Start Date và End Date
document.getElementById("start-date-best-selling").addEventListener("change", validateDatesBestSelling);
document.getElementById("end-date-best-selling").addEventListener("change", validateDatesBestSelling);

document.getElementById("start-date-recent-orders").value = getTodayDate();
document.getElementById("end-date-recent-orders").value = getTodayDate();
// Đặt giá trị max cho Start Date và End Date để không chọn ngày lớn hơn ngày hiện tại
document.getElementById("start-date-recent-orders").setAttribute("max", getTodayDate());
document.getElementById("end-date-recent-orders").setAttribute("max", getTodayDate());
// Lắng nghe sự kiện thay đổi của Start Date và End Date
document.getElementById("start-date-recent-orders").addEventListener("change", validateDatesRecentOrders);
document.getElementById("end-date-recent-orders").addEventListener("change", validateDatesRecentOrders);


validateDatesBestSelling()

function validateDatesBestSelling() {
    const startDateValue = document.getElementById("start-date-best-selling").value;
    const endDateValue = document.getElementById("end-date-best-selling").value;
    startDateBestSelling = startDateValue;
    endDateBestSelling = endDateValue;
    // Kiểm tra nếu Start Date lớn hơn End Date
    if (startDateValue && endDateValue && startDateValue > endDateValue) {
        document.getElementById("end-date-best-selling").setCustomValidity("End Date không thể nhỏ hơn Start Date");
        document.getElementById("end-date-best-selling").value = ""; // Đặt lại End Date nếu không hợp lệ
    } else {
        document.getElementById("end-date-best-selling").setCustomValidity(""); // Xóa lỗi nếu hợp lệ
    }
    loadBestSellingProduct()
}

validateDatesRecentOrders()
function validateDatesRecentOrders() {
    const startDateValue = document.getElementById("start-date-recent-orders").value;
    const endDateValue = document.getElementById("end-date-recent-orders").value;
    startDateRecentOrders = startDateValue;
    endDateRecentOrders = endDateValue;

    // Kiểm tra nếu Start Date lớn hơn End Date
    if (startDateValue && endDateValue && startDateValue > endDateValue) {
        // Nếu Start Date lớn hơn End Date, hiển thị thông báo lỗi và không cho nhập
        document.getElementById("end-date-recent-orders").setCustomValidity("End Date không thể nhỏ hơn Start Date");
        document.getElementById("end-date-recent-orders").value = ""; // Đặt lại End Date nếu không hợp lệ
    } else {
        document.getElementById("end-date-recent-orders").setCustomValidity(""); // Xóa lỗi nếu hợp lệ
    }

    // Nếu Start Date không được nhập, hiển thị thông báo lỗi
    if (startDateValue && !endDateValue) {
        document.getElementById("end-date-recent-orders").setCustomValidity("End Date phải được chọn.");
    } else {
        document.getElementById("end-date-recent-orders").setCustomValidity(""); // Xóa lỗi nếu hợp lệ
    }

    // Gọi hàm loadRecentOrders để tải lại dữ liệu
    loadRecentOrders();
}

loadBestSellingProduct()

function loadBestSellingProduct() {
    let url = `/webmenu/AdminController?adminAction=bestSellingProduct&startDate=` + startDateBestSelling + `&endDate=` + endDateBestSelling;
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const orderTableBody = $('#table-best-selling-product tbody');
            orderTableBody.empty(); // Xóa nội dung trước đó trong tbody
            data.forEach(item => {
                // Tạo dòng mới cho bảng
                const tr = $('<tr></tr>');

                // Tạo các ô dữ liệu cho mỗi thuộc tính của sản phẩm và thêm vào dòng
                const tdProductName = $('<td></td>').html(`<div class="product-name"><h5>${item.productName}</h5></div>`);
                const tdPrice = $('<td></td>').html(`<div class="product-detail-box"><h6>Price</h6><h5>${item.price}</h5></div>`);
                const tdOrders = $('<td></td>').html(`<div class="product-detail-box"><h6>Orders</h6><h5>${item.orders}</h5></div>`);
                const tdAmount = $('<td></td>').html(`<div class="product-detail-box"><h6>Amount</h6><h5>${item.amount}</h5></div>`);

                // Thêm các ô vào dòng
                tr.append(tdProductName, tdPrice, tdOrders, tdAmount);

                // Thêm dòng vào tbody
                orderTableBody.append(tr);
            })
        })
        .catch(error => console.error('Error:', error));
}
loadRecentOrders()
function loadRecentOrders() {
    let url = `/webmenu/AdminController?adminAction=recentOrders&startDate=` + startDateRecentOrders + `&endDate=` + endDateRecentOrders;
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const orderTableBody = $('#table-recent-orders tbody');  // Chọn tbody của bảng
            orderTableBody.empty(); // Xóa nội dung trước đó trong tbody
            const statusMap = {
                1: "Initialized",
                2: "Confirmed",
                3: "Preparing",
                4: "Delivered",
                5: "Paid",
                6: "Table Cleared"
            };
            // Duyệt qua mỗi đơn hàng trong dữ liệu trả về
            data.forEach(item => {
                // Tạo dòng mới cho bảng
                const tr = $('<tr></tr>');

                // Tạo các ô dữ liệu cho mỗi thuộc tính của đơn hàng và thêm vào dòng
                const tdUserName = $('<td></td>').html(`<div class="best-product-box"><h5>${item.userName}</h5></div>`);
                const tdOrderDate = $('<td></td>').html(`<div class="product-detail-box"><h6>Date Placed</h6><h5>${item.orderDate}</h5></div>`);
                const tdPrice = $('<td></td>').html(`<div class="product-detail-box"><h6>Price</h6><h5>${item.orderTotal.toLocaleString()} ₫</h5></div>`);
                const tdOrderStatus = $('<td></td>').html(`<div class="product-detail-box"><h6>Order Status</h6><h5>${statusMap[item.orderStatus]}</h5></div>`);

                // Thêm các ô vào dòng
                tr.append(tdUserName, tdOrderDate, tdPrice, tdOrderStatus);

                // Thêm dòng vào tbody
                orderTableBody.append(tr);
            });
        })
        .catch(error => console.error('Error:', error));  // Log lỗi nếu có
}
