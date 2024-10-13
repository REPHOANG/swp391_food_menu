/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mycompany.webmenu.dao.CategoryDAO;
import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dto.CategoryDto;
import com.mycompany.webmenu.dto.ProductDTO;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "CategoryManagerController", urlPatterns = {"/CategoryManagerController"})
public class CategoryManagerController extends HttpServlet {
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("categoryAction");
        String message = request.getParameter("message");
        if (productAction == null) {
            productAction = "categoryListManager";
        }
        switch (productAction) {
            case "categoryListManager": {
                CategoryDAO categoryDao = new CategoryDAO();
                int pageNo = 1; // Trang mặc định
                int pageSize = 3; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<CategoryDto> categoryList = categoryDao.getListCategoryManager(pageNo, pageSize);
                int totalProducts = categoryDao.getTotalCategoryCount();
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                request.setAttribute("categorys", categoryList);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.setAttribute("message", message);
                request.getRequestDispatcher(Constants.LIST_CATEGORY_MANAGER_JSP).forward(request, response);
                break;
            }
            case "addCategory": {
                request.setAttribute("category", new CategoryDto());
                request.getRequestDispatcher(Constants.ADD_NEW_CATEGORY_JSP).forward(request, response);
                break;
            }
            case "detailCategory": {
                Integer productId = Integer.parseInt(request.getParameter("categoryId"));
                CategoryDAO categoryDao = new CategoryDAO();
                request.setAttribute("category", categoryDao.getCategoryDetail(productId));
                request.getRequestDispatcher(Constants.ADD_NEW_CATEGORY_JSP).forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryIdStr = request.getParameter("categoryId");
        Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : null;
        String name = request.getParameter("name");
        CategoryDto category = CategoryDto.builder().categoryId(categoryId).name(name).build();
        Boolean isNewProduct = category.getCategoryId() == null ? true : false;
        CategoryDAO categoryDAO = new CategoryDAO();
        Boolean isAdded = categoryDAO.insertCategory(category);
        if (isAdded) {
            String message = null;
            if (isNewProduct) {
                message = "Category added successfully!";
            } else {
                message = "Category updated successfully!";
            }
            response.sendRedirect("CategoryManagerController?message=" + message);
        } else {
            // Xử lý lỗi
            if (isNewProduct) {
                request.setAttribute("message", "Failed to add category.");
            } else {
                request.setAttribute("message", "Failed to update category.");
            }
            request.setAttribute("category", new CategoryDto());
            request.getRequestDispatcher(Constants.ADD_NEW_CATEGORY_JSP).forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
