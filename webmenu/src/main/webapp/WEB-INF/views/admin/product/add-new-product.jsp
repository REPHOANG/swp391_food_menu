<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <!-- meta data -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
          content="Fastkart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
    <meta name="keywords"
          content="admin template, Fastkart admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link type="image/x-icon" rel="icon" href="<c:url value="/assets/admin/images/favicon.png"/>"/>
    <link rel="shortcut icon" href="<c:url value="/assets/admin/images/favicon.png"/>" type="image/x-icon">
    <title>Fastkart - Add New Product</title>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <!-- Linear Icon css -->
    <link rel="stylesheet" href="<c:url value="/assets/admin/css/linearicon.css"/>"/>
    <!-- Fontawesome css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/font-awesome.css"/>"/>
    <!-- Themify icon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/themify.css"/>"/>
    <!--Dropzon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/dropzone.css"/>"/>
    <!-- Feather icon css-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/feather-icon.css"/>"/>
    <!-- remixicon css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/remixicon.css"/>"/>
    <!-- Select2 css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/select2.min.css"/>"/>
    <!-- Plugins css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/scrollbar.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/animate.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/chartist.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/date-picker.css"/>"/>
    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap.css"/>"/>
    <!-- Bootstrap-tag input css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/vendors/bootstrap-tagsinput.css"/>"/>
    <!-- App css -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/style.css"/>"/>
</head>

<body>
<!-- tap on top start -->
<div class="tap-top">
    <span class="lnr lnr-chevron-up"></span>
</div>
<!-- tap on tap end -->

<!-- page-wrapper start -->
<div class="page-wrapper compact-wrapper" id="pageWrapper">
    <!-- Page Header Start-->
    <jsp:include page="../page-header.jsp"/>
    <!-- Page Header Ends-->
    <!-- Page Body start -->
    <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
        <div class="sidebar-wrapper">
            <div id="sidebarEffect"></div>
            <div>
                <jsp:include page="../logo.jsp"/>
                <nav class="sidebar-main">
                    <jsp:include page="../sidebar-main.jsp"/>
                </nav>
            </div>
        </div>
        <!-- Page Sidebar Ends-->
        <div class="page-body">
            <!-- New Product Add Start -->
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-8 m-auto">
                            <div class="card">
                                <div class="card-body">
                                    <c:if test="${not empty message}">
                                        <p>${message}</p>
                                    </c:if>
                                    <div class="card-header-2">
                                        <h5>Product Information</h5>
                                    </div>
                                    <form id="productForm" class="theme-form theme-form-2 mega-form" action="./ProductManagerController"
                                          method="post">
                                        <input class="form-control" type="hidden" name="productId"
                                               value="${product.productId}">
                                        <input type="hidden" id="discount" name="userAdminId"
                                               value="${sessionScope.user.userId}"/><br/>

                                        <!-- Product Name -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Product Name</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" placeholder="Product Name"
                                                       name="name" value="${product.name}" id="productName">
                                                <div class="invalid-feedback" style="color:red;"></div>
                                            </div>
                                        </div>

                                        <!-- Category -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="col-sm-3 col-form-label form-label-title">Category</label>
                                            <div class="col-sm-9">
                                                <select class="js-example-basic-single w-100" name="categoryId"
                                                        id="categoryId">
                                                    <c:forEach var="category" items="${listCategory}">
                                                        <option value="${category.categoryId}" ${category.categoryId == product.categoryId ? 'selected' : ''}>
                                                                ${category.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <div class="invalid-feedback" style="color:red;"></div>
                                            </div>
                                        </div>

                                        <!-- Price -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Price</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="number" placeholder="Product Price"
                                                       step="0.01" min="0" name="price" value="${product.price}"
                                                       id="price">
                                                <div class="invalid-feedback" style="color:red;"></div>
                                            </div>
                                        </div>

                                        <!-- Description -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" placeholder="Product description"
                                                          name="description"
                                                          id="description">${product.description}</textarea>
                                                <div class="invalid-feedback" style="color:red;"></div>
                                            </div>
                                        </div>

                                        <!-- Main Image -->
                                        <div class="mb-4 row align-items-center">
                                            <label class="form-label-title col-sm-3 mb-0">Main Image</label>
                                            <div class="col-sm-9">
                                                <div class="d-flex align-items-center">
                                                    <img src="${product.mainImg.url}" alt="Main Image"
                                                         class="img-thumbnail"
                                                         style="max-width: 150px; max-height: 150px; margin-right: 20px;">
                                                    <div>
                                                        <input class="form-control mt-2" type="hidden" name="mainImgId"
                                                               value="${product.mainImg.imageId}">
                                                        <input class="form-control mt-2" type="text" name="mainImgUrl"
                                                               placeholder="Main Image URL"
                                                               value="${product.mainImg.url}" id="mainImgUrl">
                                                        <div class="invalid-feedback" style="color:red;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="container mt-5">
                                            <h2>Product Images</h2>
                                            <div id="imageFieldsContainer"></div>
                                            <button class="btn btn-primary mt-3" type="button"
                                                    onclick="addImageField()">Add Image
                                            </button>
                                        </div>

                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-success" value="Save">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- New Product Add End -->
            <!-- footer Start -->
            <!-- footer En -->
        </div>
        <div class="container-fluid">
            <jsp:include page="../container-fluid.jsp"/>
        </div>
        <!-- Container-fluid End -->
    </div>
    <!-- Page Body End -->
</div>
<!-- page-wrapper End -->

<!-- Modal Start -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <jsp:include page="../staticBackdrop.jsp"/>
</div>
<!-- Modal End -->

<!-- latest js -->
<script src="<c:url value="/assets/admin/js/jquery-3.6.0.min.js"/>"></script>
<!-- Bootstrap js -->
<script src="<c:url value="/assets/admin/js/bootstrap/bootstrap.bundle.min.js"/>"></script>
<!-- feather icon js -->
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/icons/feather-icon/feather-icon.js"/>"></script>
<!-- scrollbar simplebar js -->
<script src="<c:url value="/assets/admin/js/scrollbar/simplebar.js"/>"></script>
<script src="<c:url value="/assets/admin/js/scrollbar/custom.js"/>"></script>
<!-- Sidebar js -->
<script src="<c:url value="/assets/admin/js/config.js"/>"></script>
<!-- bootstrap tag-input js -->
<script src="<c:url value="/assets/admin/js/bootstrap-tagsinput.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/sidebar-menu.js"/>"></script>
<!-- customizer js -->
<script src="<c:url value="/assets/admin/js/customizer.js"/>"></script>
<!--Dropzon js -->
<script src="<c:url value="/assets/admin/js/dropzone/dropzone.js"/>"></script>
<script src="<c:url value="/assets/admin/js/dropzone/dropzone-script.js"/>"></script>
<!-- Plugins js -->
<script src="<c:url value="/assets/admin/js/notify/bootstrap-notify.min.js"/>"></script>
<%--<script src="<c:url value="/assets/admin/js/notify/index.js"/>"></script>--%>
<!-- ck editor js -->
<script src="<c:url value="/assets/admin/js/ckeditor.js"/>"></script>
<script src="<c:url value="/assets/admin/js/ckeditor-custom.js"/>"></script>
<!-- select2 js -->
<script src="<c:url value="/assets/admin/js/select2.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/select2-custom.js"/>"></script>
<!-- sidebar effect -->
<script src="<c:url value="/assets/admin/js/sidebareffect.js"/>"></script>
<!-- Theme js -->
<script src="<c:url value="/assets/admin/js/script.js"/>"></script>
<script>
    // Validate form inputs before submission
    document.getElementById('productForm').addEventListener('submit', function (event) {
        let isValid = true;
        // Validate each input field
        const requiredFields = ['productName', 'price', 'mainImgUrl'];
        requiredFields.forEach(fieldId => {
            const field = document.getElementById(fieldId);
            const errorDiv = field.nextElementSibling; // Get the invalid-feedback div
            if (!field.value.trim()) {
                // Show error message if field is empty
                errorDiv.textContent = 'This field is required';
                field.style.borderColor = 'red';
                isValid = false;
            } else {
                // Clear error message if valid
                errorDiv.textContent = '';
                field.style.borderColor = '';
            }
        });
        // Validate each image URL field
        const imageUrlFields = document.querySelectorAll('input[name="imageUrls[]"]');
        imageUrlFields.forEach((field) => {
            const errorDiv = field.nextElementSibling; // Next sibling is the invalid-feedback div
            if (!field.value.trim()) {
                errorDiv.textContent = 'Image URL is required';
                field.style.borderColor = 'red';
                isValid = false;
            } else {
                errorDiv.textContent = '';
                field.style.borderColor = '';
            }
        });
        // If any validation fails, prevent form submission
        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
<script th:inline="javascript">
    // Construct the product object from server-side data
    const product = {
        productId: '${product.productId}',
        imgs: [
            <c:forEach items="${product.imgs}" var="img" varStatus="status">
            {
                imageId: '${img.imageId}',
                url: '${img.url}'
            }<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ]
    };
</script>
<script src="<c:url value="/assets/admin/product-list-manager.js"/>"></script>
</body>
</html>