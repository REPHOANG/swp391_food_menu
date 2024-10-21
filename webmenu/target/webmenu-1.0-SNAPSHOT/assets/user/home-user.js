let currentPage = 1;
const itemsPerPage = 10;
const maxVisiblePages = 5; // Giới hạn số trang hiển thị
let isMenuVisible = false;  // Biến trạng thái để kiểm tra danh sách món ăn có đang hiển thị hay không
function loadMenu(page) {
    currentPage = page;
    const url = "/webmenu/MenuServletController?page=" + currentPage + "&itemsPerPage=" + itemsPerPage;
    fetch(url)
        .then(response => response.json())
        .then(data => {
            // In ra dữ liệu nhận được từ API
            console.log("Data received:", data);
            const menuContainer = document.getElementById('menu-container');
            const paginationContainer = document.getElementById('pagination');
            // Xóa nội dung cũ
            menuContainer.innerHTML = '';
            paginationContainer.innerHTML = '';
            // Hiển thị sản phẩm
            data.items.forEach(item => {
                const menuItem = document.createElement('div');
                menuItem.classList.add('menu-item');
                menuItem.innerHTML = `
                    <img src="${item.mainImg.url}" alt="${item.name}">
                    <h3>${item.name}</h3>
                    <p>Giá: ${item.price} VND</p>
                    <input type="number" id="quantity-${item.productId}" min="1" value="1" style="width: 60px;">
                    <button onclick='order("${encodeURIComponent(JSON.stringify(item))}", ${item.productId})'>Gọi món</button>
                `;
                menuContainer.appendChild(menuItem);
            });
            // Tạo nút phân trang
            const totalPages = data.totalPages;

            // Nút "Trang trước"
            if (currentPage > 1) {
                const prevBtn = document.createElement('button');
                prevBtn.textContent = '<<';
                prevBtn.onclick = () => loadMenu(currentPage - 1);
                paginationContainer.appendChild(prevBtn);
            }

            // Hiển thị tối đa 5 trang, với trang hiện tại ở giữa nếu có thể
            let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
            let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

            // Điều chỉnh lại nếu không đủ trang để hiển thị 5 nút
            if (endPage - startPage + 1 < maxVisiblePages) {
                startPage = Math.max(1, endPage - maxVisiblePages + 1);
            }

            // Hiển thị các nút trang từ startPage đến endPage
            for (let i = startPage; i <= endPage; i++) {
                const btn = document.createElement('button');
                btn.textContent = i;
                if (i === currentPage) {
                    btn.classList.add('disabled');
                    btn.disabled = true;
                }
                btn.onclick = () => loadMenu(i);
                paginationContainer.appendChild(btn);
            }

            // Nút "Trang tiếp theo"
            if (currentPage < totalPages) {
                const nextBtn = document.createElement('button');
                nextBtn.textContent = '>>';
                nextBtn.onclick = () => loadMenu(currentPage + 1);
                paginationContainer.appendChild(nextBtn);
            }
            // Hiển thị menu và pagination
            menuContainer.style.display = 'flex'; // Sử dụng flexbox để hiển thị sản phẩm theo hàng
            paginationContainer.style.display = 'block'; // Hiển thị phân trang
        })
        .catch(error => console.error('Error:', error));
}

// Thêm sự kiện click cho nút "Xem Menu - Gọi món"
document.getElementById('view-menu-btn').addEventListener('click', function () {
    const menuContainer = document.getElementById('menu-container');
    const paginationContainer = document.getElementById('pagination');
    if (!isMenuVisible) {
        // Nếu menu đang ẩn, gọi hàm loadMenu để hiển thị menu
        loadMenu(currentPage);
        isMenuVisible = true;  // Cập nhật trạng thái là menu đã hiển thị
    } else {
        // Nếu menu đang hiển thị, ẩn menu và phân trang
        menuContainer.style.display = 'none';
        paginationContainer.style.display = 'none';
        isMenuVisible = false;  // Cập nhật trạng thái là menu đã ẩn
    }
});



