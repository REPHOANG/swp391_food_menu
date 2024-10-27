/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.OrderDAO;
import com.mycompany.webmenu.dto.OrderDto;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "OrderManagerController", urlPatterns = {"/OrderManagerController"})
public class OrderManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("orderAction");
        String message = request.getParameter("message");
        if (productAction == null) {
            productAction = "orderListManager";
        }
        switch (productAction) {
            case "orderListManager": {
                request.setAttribute("orderAction", "orderListManager");

                OrderDAO orderDAO = new OrderDAO();
                int pageNo = 1; // Trang mặc định
                int pageSize = 10; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<OrderDto> categoryList = orderDAO.getListOrderManager(pageNo, pageSize);
                int totalProducts = orderDAO.getTotalOrderCount();
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                request.setAttribute("orders", categoryList);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.setAttribute("message", message);
                request.getRequestDispatcher(Constants.LIST_ORDER_MANAGER).forward(request, response);
                break;
            }
            case "detailOrderAdmin": {
                Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDAO orderDAO = new OrderDAO();
                OrderDto orderDetail = orderDAO.getOrderDetail(orderId);
                request.setAttribute("orderDetail", orderDetail);
                String orderDetailJson = new Gson().toJson(orderDetail.getOrderDetailDto());
                request.setAttribute("orderDetailDtoList", orderDetailJson);
                request.getRequestDispatcher(Constants.ORDER_DETAIL_MANAGER).forward(request, response);
                break;
            }
            case "orderListUser": {
                request.setAttribute("orderAction", "orderListUser");
                Integer userId = Integer.parseInt(request.getParameter("userId"));
                OrderDAO orderDAO = new OrderDAO();
                int pageNo = 1;
                int pageSize = 10;
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<OrderDto> categoryList = orderDAO.getListOrderUserManager(userId, pageNo, pageSize);
                System.out.println("categoryList " + categoryList);
                int totalProducts = orderDAO.getTotalOrderUserCount(userId);
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                request.setAttribute("userId", userId);
                request.setAttribute("orders", categoryList);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.getRequestDispatcher(Constants.LIST_ORDER_MANAGER).forward(request, response);
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
