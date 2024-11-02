// Cấu hình mặc định
let currentPage = 1;
let itemsPerPage = 10;  // Số sản phẩm mỗi trang
const maxVisiblePages = 5; // Số lượng trang tối đa hiển thị
loadMenu(currentPage)
listCategory()

// Hàm tải và hiển thị menu
function loadMenu(page) {
    currentPage = page;
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
    console.log("url " + url)
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
                                <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}">
                                    <img src="${item.mainImg.url}" class="img-fluid blur-up lazyload" alt="${item.name}">
                                </a>
                            </div>
                        </div>
                        <div class="product-footer">
                            <div class="product-detail">
                                <input type="hidden" value="${item.productId}">
                                <span class="span-name">${item.categoryName}</span>
                                <a href="/webmenu/ProductManagerController?productAction=productDetailUser&productId=${item.productId}">
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

function applyQuantityAdjustment() {
    $(".addcart-button").off('click').on('click', function () {
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');
        const productName = productElement.data('product-name');
        const productCategory = productElement.data('product-category');
        const productPrice = parseFloat(productElement.data('product-price'));
        const productImg = productElement.data('product-img');
        const product = {
            productId: productId,
            name: productName,
            category: productCategory,
            price: productPrice,
            img: (productImg === null || productImg === "undefined") ? null : productImg
        };
        const $qtyInput = productElement.find('.qty-input');
        let quantity = parseInt($qtyInput.val());
        if (isNaN(quantity) || quantity <= 0) {
            $qtyInput.val(1);
            quantity = 1; // Khởi tạo số lượng là 1 nếu không hợp lệ
        }
        productElement.find('.cart_qty').addClass("open");
        // Thêm sản phẩm vào giỏ hàng với số lượng
        addToCart(product, quantity);
        viewCartHeaderDisplay()
    });

    // Xử lý sự kiện khi nhấn nút tăng số lượng (plus)
    $('.qty-right-plus').off('click').on('click', function () {
        const $qty = $(this).siblings(".qty-input");
        let currentVal = parseInt($qty.val());
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');

        if (!isNaN(currentVal)) {
            $qty.val(currentVal + 1); // Tăng số lượng lên 1
            // Cập nhật số lượng trong giỏ hàng
            updateCartQuantity(productId, currentVal + 1);
            viewCartHeaderDisplay()
        }
    });

    // Xử lý sự kiện khi nhấn nút giảm số lượng (minus)
    $('.qty-left-minus').off('click').on('click', function () {
        const $qty = $(this).siblings(".qty-input");
        let currentVal = parseInt($qty.val());
        const productElement = $(this).closest('.product-box-3');
        const productId = productElement.data('product-id');

        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1); // Giảm số lượng đi 1
            // Cập nhật số lượng trong giỏ hàng
            updateCartQuantity(productId, currentVal - 1);
        } else {
            $qty.val(""); // Xóa giá trị nếu số lượng là 1
            $(this).closest('.cart_qty').removeClass("open"); // Ẩn bộ điều khiển số lượng
            // Xóa sản phẩm khỏi giỏ hàng nếu số lượng là 0
            removeFromCart(productId);
        }
        viewCartHeaderDisplay()
    });
}

function formatVND(price) {
    return price.toLocaleString('vi-VN', {
        style: 'currency', currency: 'VND', minimumFractionDigits: 0, maximumFractionDigits: 2
    });
}

function listCategory() {
    const url = `/webmenu/CategoryManagerController?categoryAction=filterCategory`;
    fetch(url, {
        method: "GET"
    })
        .then(response => response.json())
        .then(data => {
            const categoryList = document.querySelector(".category-list");
            categoryList.innerHTML = ""; // Clear the existing list

            data.forEach(category => {
                const listItem = document.createElement("li");
                listItem.innerHTML = `
                    <div class="form-check ps-0 m-0 category-list-box">
                        <input class="checkbox_animated" type="checkbox" id="flexCheck${category.categoryId}" data-category-id="${category.categoryId}">
                        <label class="form-check-label" for="flexCheck${category.categoryId}">
                            <span class="name">${category.name}</span>
                        </label>
                    </div>
                `;
                categoryList.appendChild(listItem);
                const checkbox = listItem.querySelector(`#flexCheck${category.categoryId}`);
                // Gắn sự kiện cho mỗi checkbox
                checkbox.addEventListener("change", () => handleCategorySelection(category, checkbox.checked));
            });
        })
        .catch(error => {
            console.error("Error fetching categories:", error);
        });
}

function handleCategorySelection(category, isChecked) {
    // Gọi hàm để lấy danh sách ID của các category đã chọn
    categoryIds = getSelectedCategoryIds();
    loadMenu(1)
}

function getSelectedCategoryIds() {
    const selectedCategoryIds = [];
    const checkboxes = document.querySelectorAll(".category-list .checkbox_animated:checked"); // Tìm các checkbox được chọn
    checkboxes.forEach(checkbox => {
        selectedCategoryIds.push(checkbox.getAttribute("data-category-id"));
    });
    return selectedCategoryIds;
}

// Lấy phần tử input
const productNameInput = document.getElementById('searchProductName');
// Lắng nghe sự kiện input
productNameInput.addEventListener('input', function (event) {
    // Lấy giá trị mới từ input
    const newValue = event.target.value;
    // Kiểm tra nếu newValue có giá trị
    if (newValue) {
        productName = newValue;
        loadMenu(1)
        console.log("Product name changed to:", newValue);
    } else {
        productName = null;
        loadMenu(1)
        console.log("Product name is empty, not updating productName.");
    }
});

function filterProduct() {
    loadMenu(1)
}