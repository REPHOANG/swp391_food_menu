// Cấu hình mặc định
let currentPage = 1; // Trang hiện tại
let itemsPerPage = 10;  // Số sản phẩm mỗi trang
const maxVisiblePages = 5; // Số lượng trang tối đa hiển thị

let priceFrom = null; // Giá bắt đầu
let priceTo = null; // Giá kết thúc
let productName = null; // Tên sản phẩm
let categoryIds = []; // Danh sách ID danh mục
loadMenu(currentPage) // Tải menu của trang hiện tại
handleSearchInput()

function loadMenu(page) {
    currentPage = page; // Cập nhật trang hiện tại
    let url = `/webmenu/MenuServletController?page=` + currentPage + `&itemsPerPage=` + itemsPerPage;
    if (priceFrom) {
        url += `&priceFrom=` + priceFrom;
    }
    if (priceTo) {
        url += `&priceTo=` + priceTo;
    }
    if (productName) {
        url += `&productName=` + productName;
    }
    if (categoryIds.length > 0) {
        categoryIds.forEach(id => {
            url += `&categoryIds=${id}`;
        });
    }
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const orderTableBody = $('#table_id tbody');
            orderTableBody.empty(); // Xóa nội dung trước đó

            // Hiển thị dữ liệu sản phẩm
            data.items.forEach(item => {
                const orderRow = `
                    <tr>
                        <td>
                            <div class="table-image">
                                ${item.mainImg && item.mainImg.url ? `<img src="${item.mainImg.url}" class="img-fluid" alt="">` : ''}
                            </div>
                        </td>
                        <td>${item.name}</td>
                        <td>${item.categoryName}</td>
                        <td>${item.price}</td>
                        <td>
                            <ul>
                                <li>
                                    <a href="ProductManagerController?productAction=detailProduct&productId=${item.productId}">
                                        <i class="ri-eye-line"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="ProductManagerController?productAction=deleteProduct&productId=${item.productId}">
                                        <i class="ri-delete-bin-line"></i>
                                    </a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                `;
                orderTableBody.append(orderRow); // Thêm dòng vào bảng
            });

            updatePagination(data.totalPages, currentPage); // Cập nhật phân trang
        })
        .catch(error => console.error('Error:', error));
}

function updatePagination(totalPages, currentPage) {
    const paginationContainer = $('#pagination');
    paginationContainer.empty(); // Xóa nội dung cũ của phân trang
    // Nút "Trước" với biểu tượng
    if (currentPage > 1) {
        const prevButton = `
            <button class="page-btn" onclick="goToPage(${currentPage - 1})">
                <i class="fas fa-chevron-left"></i> <!-- Biểu tượng "Trước" -->
            </button>
        `;
        paginationContainer.append(prevButton);
    }

    // Tính toán số trang hiển thị
    let startPage, endPage;
    if (totalPages <= 5) {
        // Nếu tổng số trang nhỏ hơn hoặc bằng 5, hiển thị tất cả các trang
        startPage = 1;
        endPage = totalPages;
    } else {
        // Nếu tổng số trang lớn hơn 5, chỉ hiển thị 5 trang xung quanh trang hiện tại
        if (currentPage <= 3) {
            // Nếu trang hiện tại là 1, 2, hoặc 3
            startPage = 1;
            endPage = 5;
        } else if (currentPage + 2 >= totalPages) {
            // Nếu trang hiện tại gần cuối (còn lại 2 trang)
            startPage = totalPages - 4;
            endPage = totalPages;
        } else {
            // Ở giữa, hiển thị trang hiện tại và 2 trang xung quanh
            startPage = currentPage - 2;
            endPage = currentPage + 2;
        }
    }

    // Hiển thị các nút số trang
    for (let i = startPage; i <= endPage; i++) {
        const pageButton = `
            <button 
                class="page-btn ${i === currentPage ? 'active' : ''}" 
                onclick="goToPage(${i})">
                ${i}
            </button>
        `;
        paginationContainer.append(pageButton);
    }

    // Nút "Sau" với biểu tượng
    if (currentPage < totalPages) {
        const nextButton = `
            <button class="page-btn" onclick="goToPage(${currentPage + 1})">
                <i class="fas fa-chevron-right"></i> <!-- Biểu tượng "Sau" -->
            </button>
        `;
        paginationContainer.append(nextButton);
    }
}

function goToPage(page) {
    loadMenu(page); // Chuyển đến trang được chỉ định
}

// Hàm xử lý khi nhập vào ô tìm kiếm
function handleSearchInput() {
    const searchInput = document.getElementById("search");
    searchInput.addEventListener("input", function () {
        productName = this.value;
        searchInput.value = productName;
        loadMenu(1)
        // Gọi hàm xử lý khác nếu cần, ví dụ: loadOrdersList(searchValue);
    });
}

listCategory()

function listCategory() {
    const url = `/webmenu/CategoryManagerController?categoryAction=filterCategory`;
    fetch(url, {
        method: "GET"
    })
        .then(response => response.json())
        .then(data => {
            const categorySelect = document.getElementById("category-selection");
            categorySelect.innerHTML = ""; // Xóa các lựa chọn hiện tại trong select

            // Tạo một tùy chọn mặc định "Vui lòng chọn một danh mục"
            const defaultOption = document.createElement("option");
            defaultOption.value = "";
            defaultOption.textContent = "Vui lòng chọn một danh mục";
            categorySelect.appendChild(defaultOption);

            data.forEach(category => {
                const option = document.createElement("option");
                option.value = category.categoryId;
                option.textContent = category.name;
                categorySelect.appendChild(option);
            });

            // Thêm sự kiện lắng nghe để bắt sự thay đổi lựa chọn
            categorySelect.addEventListener("change", (event) => {
                const selectedCategoryId = event.target.value; // Lấy giá trị của danh mục được chọn
                if (selectedCategoryId) {
                    categoryIds = []
                    categoryIds.push(selectedCategoryId)
                } else {
                    categoryIds = []
                }
                loadMenu(1)
            });
        })
        .catch(error => {
            console.error("Lỗi khi lấy danh mục:", error);
        });
}
