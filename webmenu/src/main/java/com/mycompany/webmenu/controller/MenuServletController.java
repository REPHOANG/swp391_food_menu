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
        // Thiết lập tiêu đề phản hồi JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage"));


        String productNameParam = request.getParameter("productName");
        String productName = (productNameParam != null && !productNameParam.isEmpty() && !Objects.equals(productNameParam, "null")) ? productNameParam : null;

        String priceFromParam = request.getParameter("priceFrom");
        Double priceFrom = (priceFromParam != null && !priceFromParam.isEmpty() && !Objects.equals(priceFromParam, "null"))
                ? Double.valueOf(priceFromParam) : null;

        String priceToParam = request.getParameter("priceTo");
        Double priceTo = (priceToParam != null && !priceToParam.isEmpty() && !Objects.equals(priceToParam, "null"))
                ? Double.valueOf(priceToParam) : null;

        // Lấy danh sách categoryIds
        List<Integer> listCategoryIds = new ArrayList<>();
        String[] categoryIdsParam = request.getParameterValues("categoryIds");
        if (categoryIdsParam != null) {
            for (String id : categoryIdsParam) {
                if (id != null && !id.isEmpty()) {
                    try {
                        listCategoryIds.add(Integer.valueOf(id));
                    } catch (NumberFormatException e) {
                        // Ghi lại lỗi nếu không chuyển đổi được
                        System.err.println("Không thể chuyển đổi categoryId: " + id);
                    }
                }
            }
        }

        // Danh sách các món ăn
        List<ProductDto> productDTO = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        int totalPages = 0;
        try {
            productDTO = productDAO.getListAllProduct(currentPage, itemsPerPage, productName, priceFrom, priceTo, listCategoryIds);
            int totalProducts = productDAO.getTotalProductCount(productName, priceFrom, priceTo, listCategoryIds);
            totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // Chuyển đổi danh sách sản phẩm thành JSON và thêm tổng số trang
        Map<String, Object> result = new HashMap<>();
        result.put("items", productDTO);
        result.put("totalPages", totalPages);
        // Chuyển danh sách món ăn thành JSON
        Gson gson = new Gson();
        String menuJson = gson.toJson(result);
        // Trả về JSON cho client
        response.getWriter().write(menuJson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
