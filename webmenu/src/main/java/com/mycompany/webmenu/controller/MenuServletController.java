/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dto.ProductDTO;
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
        // Danh sách các món ăn
        List<ProductDTO> productDTO = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        int totalPages = 0;
        try {
            productDTO = productDAO.getListALlProduct(currentPage, itemsPerPage);
            int totalProducts = productDAO.getTotalProductCount();
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
