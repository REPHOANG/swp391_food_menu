handleSearchInput()
let email = null;
let status = null;
let currentPage = 1;
let itemsPerPage = 10;  // Số sản phẩm mỗi trang
const maxVisiblePages = 5; // Số lượng trang tối đa hiển thị
loadUserList(currentPage)

// Hàm xử lý khi nhập vào ô tìm kiếm
function handleSearchInput() {
    const searchInput = document.getElementById("search");
    searchInput.addEventListener("input", function () {
        const newValue = this.value;
        if (newValue) {
            email = newValue;
            loadUserList(1)
        } else {
            email = null;
            loadUserList(1)
        }
    });
}

// Hàm tải và hiển List User
function loadUserList(page) {
    currentPage = page;
    let url = `/webmenu/UserController?userAction=userManagerAdminApi&page=` + currentPage + `&itemsPerPage=` + itemsPerPage;
    if (email) {
        url += `&email=` + email;
    }
    if (status) {
        url += `&status=` + status;
    }
    console.log("url " + url)
    // Lấy giỏ hàng từ localStorage
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const tbody = document.querySelector("tbody");
            tbody.innerHTML = ""; // Xóa nội dung cũ của bảng
            data.items.forEach(user => {
                const row = document.createElement("tr");
                // Chỉ hiển thị dữ liệu nếu có giá trị, nếu không thì để trống
                const emailCell = user.email ? user.email : '';
                const fullName = user.fullName ? user.fullName : '';
                const phoneCell = user.phone ? user.phone : '';
                const addressCell = user.address ? user.address : '';
                const isDeleted = user.isDeleted ? user.isDeleted : '';
                row.innerHTML = `
                    <td>${emailCell}</td>
                    <td>${fullName}</td>
                    <td>${phoneCell}</td>
                    <td>${addressCell}</td>
                     <td>${isDeleted === true ? 'Deleted' : 'Active'}</td>  <!-- Show "Deleted" or "Active" text -->
                    <td>
                        <ul>
                            <li>
                                <a href="/webmenu/OrderManagerController?orderAction=orderListManager&userId=${user.userId}">
                                    <i class="ri-eye-line"></i>
                                </a>
                            </li>
                        </ul>
                    </td>
                `;
                tbody.appendChild(row);
            });

            // Tạo các nút phân trang
            createPagination(data.totalPages);
        })
        .catch(error => console.error('Error:', error));
}

// Hàm tạo các nút phân trang
function createPagination(totalPages) {
    const pagination = document.getElementById("pagination");
    pagination.innerHTML = ""; // Xóa phân trang cũ

    // Nút "Previous"
    if (currentPage > 1) {
        const prevButton = document.createElement("button");
        prevButton.textContent = "Previous";
        prevButton.onclick = () => {
            currentPage -= 1; // Giảm currentPage khi nhấn Previous
            loadUserList(currentPage);
        };
        pagination.appendChild(prevButton);
    }

    // Tính toán `startPage` và `endPage` để giới hạn tối đa 5 trang hiển thị
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

    // Điều chỉnh `startPage` nếu `endPage` ít hơn 5 trang
    if (endPage - startPage + 1 < maxVisiblePages) {
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    // Tạo các nút trang từ `startPage` đến `endPage`
    for (let i = startPage; i <= endPage; i++) {
        const pageButton = document.createElement("button");
        pageButton.textContent = i;
        pageButton.onclick = () => {
            currentPage = i; // Cập nhật currentPage khi chọn trang mới
            loadUserList(currentPage);
        };

        if (i === currentPage) {
            pageButton.disabled = true; // Vô hiệu hóa nút của trang hiện tại
            pageButton.classList.add("active"); // Thêm lớp CSS để đánh dấu trang hiện tại
        }
        pagination.appendChild(pageButton);
    }

    // Nút "Next"
    if (currentPage < totalPages) {
        const nextButton = document.createElement("button");
        nextButton.textContent = "Next";
        nextButton.onclick = () => {
            currentPage += 1; // Tăng currentPage khi nhấn Next
            loadUserList(currentPage);
        };
        pagination.appendChild(nextButton);
    }
}

// Lấy phần tử select bằng ID
const statusSelection = document.getElementById("status-selection");

// Thêm một sự kiện để phát hiện thay đổi trong lựa chọn
statusSelection.addEventListener("change", function () {
    // Lấy giá trị đã chọn
    const selectedValue = statusSelection.value;
    // Thực hiện các hành động dựa trên giá trị đã chọn
    if (selectedValue === "true") {
        status = 'true';
        console.log("Trạng thái: Kích hoạt");
        // Thêm logic cho trạng thái 'Kích hoạt' tại đây
    } else if (selectedValue === "false") {
        console.log("Trạng thái: Vô hiệu hóa");
        status = 'false';
        // Thêm logic cho trạng thái 'Vô hiệu hóa' tại đây
    } else {
        status = null;
        console.log("Trạng thái: Không xác định");
        // Thêm logic cho trạng thái 'Không xác định' tại đây
    }
    loadUserList(1)
});