/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.mycompany.webmenu.dao.CategoryDAO;
import com.mycompany.webmenu.dao.OrderDAO;
import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.enums.RoleUserType;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        OrderDAO orderDao = new OrderDAO();
        ProductDAO productDao = new ProductDAO();
        UserDAO userDao = new UserDAO();
        CategoryDAO categoryDao = new CategoryDAO();
        request.setAttribute("totalRevenue", orderDao.getTotalRevenue());
        request.setAttribute("totalOrders", orderDao.getTotalOrders());
        request.setAttribute("totalProducts", productDao.getTotalProductCount());
        request.setAttribute("totalCustomers", userDao.getTotalUserCount(RoleUserType.USER.getId(), null));
        request.setAttribute("listAllCategory", categoryDao.getListAllCategory());
        request.setAttribute("bestSellingProduct", orderDao.getTop5BestSellingProducts());
        request.setAttribute("recentOrders", orderDao.getRecentOrders());
        request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
