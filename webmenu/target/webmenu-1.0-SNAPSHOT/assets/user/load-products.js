// Cấu hình mặc định
import { applyQuantityAdjustment } from './cart-local-storage.js';


let currentPage = 1;
const itemsPerPage = 10;  // Số sản phẩm mỗi trang
const maxVisiblePages = 5; // Số lượng trang tối đa hiển thị
// Hàm xử lý sự kiện cho product options
function handleProductOptions(item) {
    // Xem chi tiết sản phẩm
    const viewProduct = (e) => {
        e.preventDefault();
        // TODO: Implement view product logic
        console.log('Viewing product:', item.name);
        // Có thể thêm logic để hiển thị modal với thông tin chi tiết sản phẩm
    };
    // So sánh sản phẩm
    const compareProduct = (e) => {
        e.preventDefault();
        // TODO: Implement compare logic
        console.log('Adding to compare:', item.name);
        // Có thể thêm logic để thêm vào danh sách so sánh
    };

    // Thêm vào wishlist
    const addToWishlist = (e) => {
        e.preventDefault();
        // TODO: Implement wishlist logic
        console.log('Adding to wishlist:', item.name);
        // Có thể thêm logic để thêm vào wishlist
    };

    return `
        <ul class="product-option">
            <li data-bs-toggle="tooltip" data-bs-placement="top" title="View">
                <a href="#" class="view-product" data-product-id="${item.id}">
                    <i data-feather="eye"></i>
                </a>
            </li>
            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Compare">
                <a href="#" class="compare-product" data-product-id="${item.id}">
                    <i data-feather="refresh-cw"></i>
                </a>
            </li>
            <li data-bs-toggle="tooltip" data-bs-placement="top" title="Wishlist">
                <a href="#" class="wishlist-product" data-product-id="${item.id}">
                    <i data-feather="heart"></i>
                </a>
            </li>
        </ul>
    `;
}

// Hàm tải và hiển thị menu
function loadMenu(page) {
    currentPage = page;
    const url = `/webmenu/MenuServletController?page=${currentPage}&itemsPerPage=${itemsPerPage}`;

    // Lấy giỏ hàng từ localStorage
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const menuContainer = document.getElementById('product-list-section');
            const paginationContainer = document.getElementById('custome-pagination').querySelector('ul');
            menuContainer.innerHTML = '';
            paginationContainer.innerHTML = '';

            // Hiển thị sản phẩm
            data.items.forEach(item => {
                const cartItem = cart.find(cartProduct => cartProduct.productId === item.productId);
                const quantityInCart = cartItem ? cartItem.quantity : 0; // Lấy số lượng từ giỏ hàng hoặc 0 nếu chưa có

                const menuItem = document.createElement('div');
                menuItem.innerHTML = `
                    <div class="product-box-3 h-100 wow fadeInUp" 
                        data-product-id="${item.productId}" 
                        data-product-name="${item.name}"
                        data-product-category="${item.categoryName}"
                        data-product-price="${item.price}"
                        data-product-img="${item.mainImg.url}">
                        
                        <div class="product-header">
                            <div class="product-image">
                                <a href="product-left-thumbnail.html">
                                    <img src="${item.mainImg.url}" class="img-fluid blur-up lazyload" alt="${item.name}">
                                </a>
                            </div>
                        </div>
                        <div class="product-footer">
                            <div class="product-detail">
                                <input type="hidden" value="${item.productId}">
                                <span class="span-name">${item.categoryName}</span>
                                <a href="product-left-thumbnail.html">
                                    <h5 class="name">${item.name}</h5>
                                </a>
                                <p class="text-content mt-1 mb-2 product-content"></p>
                                <div class="product-rating mt-2">
                                    <ul class="rating">
                                        <li><i data-feather="star" class="fill"></i></li>
                                        <li><i data-feather="star" class="fill"></i></li>
                                        <li><i data-feather="star" class="fill"></i></li>
                                        <li><i data-feather="star" class="fill"></i></li>
                                        <li><i data-feather="star"></i></li>
                                    </ul>
                                    <span></span>
                                </div>
                                <h6 class="unit"></h6>
                                <h5 class="price"><span class="theme-color">${formatVND(item.price)}</span>
                                    <del>$0</del>
                                </h5>
                                <div class="add-to-cart-box bg-white">
                                    <button class="btn btn-add-cart addcart-button">Add
                                        <span class="add-icon bg-light-gray">
                                            <i class="fa-solid fa-plus"></i>
                                        </span>
                                    </button>
                                    <div class="cart_qty qty-box ${quantityInCart > 0 ? 'open' : ''}">
                                        <div class="input-group bg-white">
                                            <button type="button" class="qty-left-minus bg-gray" data-type="minus">
                                                <i class="fa fa-minus" aria-hidden="true"></i>
                                            </button>
                                            <input class="form-control input-number qty-input" type="text" name="quantity" value="${quantityInCart}">
                                            <button type="button" class="qty-right-plus bg-gray" data-type="plus">
                                                <i class="fa fa-plus" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                menuContainer.appendChild(menuItem);

                // Initialize Feather icons
                if (window.feather) {
                    feather.replace();
                }
            });

            // Tạo nút phân trang
            const totalPages = data.totalPages;

            // Nút "Trang trước"
            const prevDisabled = (currentPage === 1) ? 'disabled' : '';
            const prevPageItem = document.createElement('li');
            prevPageItem.className = `page-item ${prevDisabled}`;
            prevPageItem.innerHTML = `
                <a class="page-link" tabindex="-1" aria-disabled="${prevDisabled}"><i class="fa-solid fa-angles-left"></i></a>
            `;
            prevPageItem.addEventListener('click', () => {
                if (currentPage > 1) loadMenu(currentPage - 1);
            });
            paginationContainer.appendChild(prevPageItem);

            // Hiển thị các trang
            let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
            let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

            if (endPage - startPage + 1 < maxVisiblePages) {
                startPage = Math.max(1, endPage - maxVisiblePages + 1);
            }

            for (let i = startPage; i <= endPage; i++) {
                const pageItem = document.createElement('li');
                pageItem.className = `page-item ${i === currentPage ? 'active' : ''}`;
                pageItem.innerHTML = `
                    <a class="page-link">${i}</a>
                `;
                pageItem.addEventListener('click', () => loadMenu(i));
                paginationContainer.appendChild(pageItem);
            }

            // Nút "Trang tiếp theo"
            const nextDisabled = (currentPage === totalPages) ? 'disabled' : '';
            const nextPageItem = document.createElement('li');
            nextPageItem.className = `page-item ${nextDisabled}`;
            nextPageItem.innerHTML = `
                <a class="page-link" tabindex="-1" aria-disabled="${nextDisabled}"><i class="fa-solid fa-angles-right"></i></a>
            `;
            nextPageItem.addEventListener('click', () => {
                if (currentPage < totalPages) loadMenu(currentPage + 1);
            });
            paginationContainer.appendChild(nextPageItem);

            // Gọi hàm applyQuantityAdjustment để xử lý sự kiện cho các sản phẩm
            applyQuantityAdjustment()

        })
        .catch(error => console.error('Error:', error));
}
// Gọi hàm loadMenu khi trang đã tải xong
window.onload = () => loadMenu(currentPage);

function formatVND(price) {
    return price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND', minimumFractionDigits: 0, maximumFractionDigits: 2 });
}