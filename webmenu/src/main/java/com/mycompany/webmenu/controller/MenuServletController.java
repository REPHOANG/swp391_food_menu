/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dto.ProductDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "MenuServletController", urlPatterns = {"/MenuServletController"})
public class MenuServletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập kiểu nội dung phản hồi là JSON và mã hóa UTF-8
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy tham số `page` và `itemsPerPage` từ request và chuyển đổi thành số nguyên
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage"));

        // Lấy và kiểm tra tham số `productName` từ request
        String productNameParam = request.getParameter("productName");
        String productName = (productNameParam != null && !productNameParam.isEmpty() && !Objects.equals(productNameParam, "null"))
                ? productNameParam : null;

        // Lấy và kiểm tra tham số `priceFrom` từ request, chuyển đổi thành kiểu `Double`
        String priceFromParam = request.getParameter("priceFrom");
        Double priceFrom = (priceFromParam != null && !priceFromParam.isEmpty() && !Objects.equals(priceFromParam, "null"))
                ? Double.valueOf(priceFromParam) : null;

        // Lấy và kiểm tra tham số `priceTo` từ request, chuyển đổi thành kiểu `Double`
        String priceToParam = request.getParameter("priceTo");
        Double priceTo = (priceToParam != null && !priceToParam.isEmpty() && !Objects.equals(priceToParam, "null"))
                ? Double.valueOf(priceToParam) : null;

        // Khởi tạo danh sách `categoryIds` từ các tham số
        List<Integer> listCategoryIds = new ArrayList<>();
        String[] categoryIdsParam = request.getParameterValues("categoryIds");
        if (categoryIdsParam != null) {
            for (String id : categoryIdsParam) {
                if (id != null && !id.isEmpty()) {
                    try {
                        // Thêm `categoryId` vào danh sách sau khi chuyển đổi
                        listCategoryIds.add(Integer.valueOf(id));
                    } catch (NumberFormatException e) {
                        // Ghi log lỗi nếu không chuyển đổi được
                        System.err.println("Không thể chuyển đổi categoryId: " + id);
                    }
                }
            }
        }

        // Khởi tạo danh sách để lưu trữ sản phẩm và biến tổng số trang
        List<ProductDto> productDTO = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        int totalPages = 0;

        try {
            // Lấy danh sách tất cả sản phẩm theo phân trang và các tiêu chí lọc
            productDTO = productDAO.getListAllProduct(currentPage, itemsPerPage, productName, priceFrom, priceTo, listCategoryIds);

            // Tính toán tổng số sản phẩm để tính tổng số trang
            int totalProducts = productDAO.getTotalProductCount(productName, priceFrom, priceTo, listCategoryIds);
            totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);

        } catch (SQLException e) {
            // Xử lý ngoại lệ SQL bằng cách ném ra lỗi `RuntimeException`
            throw new RuntimeException(e);
        }

        // Đóng gói dữ liệu kết quả vào một `Map` để chuyển đổi thành JSON
        Map<String, Object> result = new HashMap<>();
        result.put("items", productDTO);
        result.put("totalPages", totalPages);

        // Sử dụng `Gson` để chuyển đổi `result` thành chuỗi JSON
        Gson gson = new Gson();
        String menuJson = gson.toJson(result);

        // Ghi chuỗi JSON vào phản hồi cho client
        response.getWriter().write(menuJson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
