// Cấu hình mặc định
let currentPage = 1; // Trang hiện tại
let itemsPerPage = 10;  // Số sản phẩm mỗi trang
let tableName = null; // Giá bắt đầu
let statusId = null; // Giá kết thúc
loadTable(currentPage) // Tải menu của trang hiện tại
handleSearchInput()

function loadTable(page) {
    currentPage = page; // Cập nhật trang hiện tại
    let url = `/webmenu/TableManagerController?tableAction=tableListManagerApi&page=` + currentPage + `&itemsPerPage=` + itemsPerPage;
    if (tableName) {
        url += `&tableName=` + tableName;
    }
    if (statusId) {
        url += `&statusId=` + statusId;
    }
    console.log("url " + url)
    fetch(url)
        .then(response => response.json())
        .then(data => {
            // Lấy phần tử tbody của bảng
            const tbody = document.querySelector('#table_id tbody');
            // Xóa tất cả các dòng cũ trong tbody (nếu có)
            tbody.innerHTML = '';
            // Duyệt qua mỗi item trong data.items và tạo các dòng mới cho bảng
            data.items.forEach(item => {
                // Tạo dòng tr mới
                const tr = document.createElement('tr');
                // Tạo các ô td cho mỗi cột và điền dữ liệu
                const tdName = document.createElement('td');
                tdName.textContent = item.tableName;
                tr.appendChild(tdName);

                const tdStatus = document.createElement('td');
                tdStatus.textContent = item.status == 0 ? 'Available' : item.status == 1 ? 'In Use' : item.status == 2 ? 'Reserved' : 'Unknown';
                tr.appendChild(tdStatus);

                const tdCapacity = document.createElement('td');
                tdCapacity.textContent = item.capacity;
                tr.appendChild(tdCapacity);

                const tdOption = document.createElement('td');
                const ul = document.createElement('ul');

                const liView = document.createElement('li');
                const aView = document.createElement('a');
                aView.href = `TableManagerController?tableAction=detailTable&tableId=${item.tableId}`;
                const iView = document.createElement('i');
                iView.classList.add('ri-eye-line');
                aView.appendChild(iView);
                liView.appendChild(aView);

                const liDelete = document.createElement('li');
                const aDelete = document.createElement('a');
                aDelete.href = `TableManagerController?tableAction=deleteTable&tableId=${item.tableId}`;
                const iDelete = document.createElement('i');
                iDelete.classList.add('ri-delete-bin-line');
                aDelete.appendChild(iDelete);
                liDelete.appendChild(aDelete);
                ul.appendChild(liView);
                ul.appendChild(liDelete);
                tdOption.appendChild(ul);
                tr.appendChild(tdOption);
                // Thêm dòng tr vào tbody
                tbody.appendChild(tr);
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
    loadTable(page); // Chuyển đến trang được chỉ định
}

// Hàm xử lý khi nhập vào ô tìm kiếm
function handleSearchInput() {
    const searchInput = document.getElementById("search");
    searchInput.addEventListener("input", function () {
        tableName = this.value;
        searchInput.value = tableName;
        loadTable(1)
        // Gọi hàm xử lý khác nếu cần, ví dụ: loadOrdersList(searchValue);
    });
}

// Lấy phần tử select
const statusSelection = document.getElementById("status-selection");
// Bắt sự kiện khi người dùng thay đổi giá trị chọn
statusSelection.addEventListener("change", function () {
    // Lấy giá trị đã chọn
    const selectedValue = statusSelection.value;
    // Xử lý theo giá trị đã chọn
    if (selectedValue == "0") {
        statusId = "0";
        console.log("Selected status: Available");
    } else if (selectedValue == "1") {
        statusId = "1";
        console.log("Selected status: In Use");
    } else {
        statusId = null;
        console.log("Không có giá trị")
    }
    console.log("statusId " + statusId)
    loadTable(1)
});