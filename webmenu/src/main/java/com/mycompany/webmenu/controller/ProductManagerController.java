/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mycompany.webmenu.dao.CategoryDAO;
import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dto.ImageProductDto;
import com.mycompany.webmenu.dto.ProductDto;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "ProductManagerController", urlPatterns = {"/ProductManagerController"})
public class ProductManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("productAction");
        String message = request.getParameter("message");
        if (productAction == null) {
            productAction = "productListManager";
        }
        switch (productAction) {
            case "productListManager": {
                ProductDAO productDAO = new ProductDAO();
                int pageNo = 1; // Trang mặc định
                int pageSize = 5; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                try {
                    List<ProductDto> productList = productDAO.getListAllProduct(pageNo, pageSize);
                    int totalProducts = productDAO.getTotalProductCount();
                    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                    request.setAttribute("products", productList);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", pageNo);
                    request.setAttribute("message", message);
                    request.getRequestDispatcher(Constants.LIST_PRODUCT_MANAGER_JSP).forward(request, response);
                    break;
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
                }
            }
            case "addProduct": {
                CategoryDAO categoryDao = new CategoryDAO();
                request.setAttribute("listCategory", categoryDao.getListAllCategory());
                request.setAttribute("product", new ProductDto());
                request.setAttribute("imgs", new ArrayList<>());
                request.getRequestDispatcher(Constants.ADD_NEW_PRODUCT_JSP).forward(request, response);
                break;
            }
            case "detailProduct": {
                Integer productId = Integer.parseInt(request.getParameter("productId"));
                ProductDAO productDAO = new ProductDAO();
                CategoryDAO categoryDao = new CategoryDAO();
                request.setAttribute("listCategory", categoryDao.getListAllCategory());
                ProductDto productDto = productDAO.getProductDetail(productId);
                request.setAttribute("product", productDAO.getProductDetail(productId));
                request.setAttribute("imgs", productDto != null ? productDto.getImgs() : new ArrayList<>());
                request.getRequestDispatcher(Constants.ADD_NEW_PRODUCT_JSP).forward(request, response);
                break;
            }
            default:
                throw new AssertionError();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các giá trị từ form
        String productIdStr = request.getParameter("productId");
        Integer productId = (productIdStr != null && !productIdStr.isEmpty()) ? Integer.parseInt(productIdStr) : null;
        String name = request.getParameter("name");
        Integer categoryId = request.getParameter("categoryId") != null ? Integer.parseInt(request.getParameter("categoryId")) : null;
        Double price = request.getParameter("price") != null ? Double.parseDouble(request.getParameter("price")) : null;
        String description = request.getParameter("description");
        String userAdminIdStr = request.getParameter("userAdminId");
        Integer userAdminId = (userAdminIdStr != null && !userAdminIdStr.isEmpty()) ? Integer.parseInt(userAdminIdStr) : null;

        // Xử lý dữ liệu ảnh
        String mainImgIdStr = request.getParameter("mainImgId");
        Integer mainImgId = (mainImgIdStr != null && !mainImgIdStr.isEmpty()) ? Integer.parseInt(mainImgIdStr) : null;
        String mainImgUrl = request.getParameter("mainImgUrl");

        String[] imageIds = request.getParameterValues("imageIds[]");
        String[] imageUrls = request.getParameterValues("imageUrls[]");
        List<ImageProductDto> imageList = new ArrayList<>();
        if (imageIds != null && imageUrls != null) {
            for (int i = 0; i < imageIds.length; i++) {
                String imageId = imageIds[i].trim();
                String imageUrl = imageUrls[i].trim();
                if (!imageId.isEmpty() || !imageUrl.isEmpty()) {
                    ImageProductDto img = ImageProductDto.builder()
                            .imageId(imageId.isEmpty() ? null : Integer.parseInt(imageId))
                            .url(imageUrl)
                            .build();
                    imageList.add(img);
                }
            }
        }

        // Tạo đối tượng ProductDTO
        ProductDto product = new ProductDto();
        product.setProductId(productId);
        product.setName(name);
        product.setCategoryId(categoryId);
        product.setPrice(price);
        product.setDescription(description);
        product.setCreatedBy(userAdminId);

        // Tạo đối tượng ImageProductDto cho mainImg và sử dụng setter
        ImageProductDto mainImg = new ImageProductDto();
        mainImg.setImageId(mainImgId);
        mainImg.setUrl(mainImgUrl);
        product.setMainImg(mainImg); // Gán mainImg vào product

        // Gán danh sách hình ảnh cho product
        product.setImgs(imageList);


        ProductDAO productDAO = new ProductDAO();
        Boolean isAdded;
        Boolean isNewProduct;

        // Xử lý thêm hoặc cập nhật sản phẩm
        if (productId == null) {
            isAdded = productDAO.insertProductAndImages(product);
            isNewProduct = true;
        } else {
            isAdded = productDAO.updateProductWithImages(product);
            isNewProduct = false;
        }

        // Gửi thông báo và chuyển hướng
        if (isAdded) {
            String message = null;
            if (isNewProduct) {
                message = "Product added successfully!";
            } else {
                message = "Product updated successfully!";
            }
            response.sendRedirect("ProductManagerController?message=" + message);
        } else {
            // Xử lý lỗi
            if (isNewProduct) {
                request.setAttribute("message", "Failed to add product.");
            } else {
                request.setAttribute("message", "Failed to update product.");
            }
            CategoryDAO categoryDao = new CategoryDAO();
            request.setAttribute("listCategory", categoryDao.getListAllCategory());
            request.setAttribute("product", product);
            request.getRequestDispatcher(Constants.ADD_NEW_PRODUCT_JSP).forward(request, response);
        }
    }

}
