handleSearchInput()
// Gọi hàm xử lý tìm kiếm khi trang được tải

let email = null; // Khởi tạo biến email để lưu giá trị tìm kiếm
let currentPage = 1; // Trang hiện tại bắt đầu từ 1
let itemsPerPage = 10;  // Số sản phẩm mỗi trang hiển thị
const maxVisiblePages = 5; // Số lượng trang tối đa hiển thị trong phân trang
loadUserList(currentPage) // Tải danh sách người dùng lần đầu tiên khi trang được mở

// Hàm xử lý khi nhập vào ô tìm kiếm
function handleSearchInput() {
    const searchInput = document.getElementById("search"); // Lấy thẻ input với id là "search"
    searchInput.addEventListener("input", function () {
        const newValue = this.value; // Lấy giá trị mới từ ô input
        if (newValue) {
            email = newValue; // Cập nhật giá trị email nếu có input
            loadUserList(1) // Tải lại danh sách từ trang đầu tiên khi có tìm kiếm
        } else {
            email = null; // Đặt lại email là null nếu input trống
            loadUserList(1) // Tải lại danh sách từ trang đầu tiên khi xóa input
        }
    });
}

// Hàm tải và hiển thị danh sách người dùng
function loadUserList(page) {
    currentPage = page; // Cập nhật số trang hiện tại
    let url = `/webmenu/UserController?userAction=userManagerAdminApi&page=` + currentPage + `&itemsPerPage=` + itemsPerPage; // URL API để lấy danh sách người dùng
    if (email) {
        url += `&email=` + email; // Thêm tham số email vào URL nếu có
    }
    console.log("url " + url) // In URL ra console để kiểm tra

    // Lấy giỏ hàng từ localStorage (không dùng trong hàm này)
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    
    fetch(url) // Gọi API với URL đã tạo
        .then(response => response.json()) // Chuyển đổi phản hồi thành JSON
        .then(data => {
            const tbody = document.querySelector("tbody"); // Lấy phần tử tbody của bảng
            tbody.innerHTML = ""; // Xóa nội dung cũ của bảng

            data.items.forEach(user => {
                const row = document.createElement("tr"); // Tạo một hàng mới cho mỗi người dùng
                // Lấy các giá trị email, phone, address từ đối tượng user, nếu không có thì để chuỗi rỗng
                const emailCell = user.email ? user.email : '';
                const phoneCell = user.phone ? user.phone : '';
                const addressCell = user.address ? user.address : '';

                row.innerHTML = `
                    <td>${emailCell}</td>
                    <td>${phoneCell}</td>
                    <td>${addressCell}</td>
                    <td>
                        <ul>
                            <li>
                                <a href="/webmenu/OrderManagerController?orderAction=orderListManager&userId=${user.userId}">
                                    <i class="ri-eye-line"></i> <!-- Icon mắt để xem -->
                                </a>
                            </li>
                        </ul>
                    </td>
                `;
                tbody.appendChild(row); // Thêm hàng vào tbody
            });

            // Tạo các nút phân trang
            createPagination(data.totalPages);
        })
        .catch(error => console.error('Error:', error)); // Xử lý lỗi khi gọi API
}

// Hàm tạo các nút phân trang
function createPagination(totalPages) {
    const pagination = document.getElementById("pagination"); // Lấy phần tử pagination
    pagination.innerHTML = ""; // Xóa các nút phân trang cũ

    // Nút "Previous" (trước)
    if (currentPage > 1) {
        const prevButton = document.createElement("button");
        prevButton.textContent = "Previous"; // Gán nội dung cho nút
        prevButton.onclick = () => {
            currentPage -= 1; // Giảm giá trị currentPage khi nhấn nút trước
            loadUserList(currentPage); // Tải lại danh sách người dùng
        };
        pagination.appendChild(prevButton); // Thêm nút vào phân trang
    }

    // Tính toán `startPage` và `endPage` để giới hạn tối đa 5 trang hiển thị
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2)); // Tính trang bắt đầu
    let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1); // Tính trang kết thúc

    // Điều chỉnh `startPage` nếu `endPage` ít hơn 5 trang
    if (endPage - startPage + 1 < maxVisiblePages) {
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    // Tạo các nút trang từ `startPage` đến `endPage`
    for (let i = startPage; i <= endPage; i++) {
        const pageButton = document.createElement("button");
        pageButton.textContent = i; // Gán số trang vào nội dung nút
        pageButton.onclick = () => {
            currentPage = i; // Cập nhật currentPage khi chọn trang mới
            loadUserList(currentPage); // Tải lại danh sách người dùng
        };

        if (i === currentPage) {
            pageButton.disabled = true; // Vô hiệu hóa nút của trang hiện tại
            pageButton.classList.add("active"); // Thêm lớp CSS để đánh dấu trang hiện tại
        }
        pagination.appendChild(pageButton); // Thêm nút vào phân trang
    }

    // Nút "Next" (tiếp)
    if (currentPage < totalPages) {
        const nextButton = document.createElement("button");
        nextButton.textContent = "Next"; // Gán nội dung cho nút
        nextButton.onclick = () => {
            currentPage += 1; // Tăng currentPage khi nhấn nút tiếp
            loadUserList(currentPage); // Tải lại danh sách người dùng
        };
        pagination.appendChild(nextButton); // Thêm nút vào phân trang
    }
}
