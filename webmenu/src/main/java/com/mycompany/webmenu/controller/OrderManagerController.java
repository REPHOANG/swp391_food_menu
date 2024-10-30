/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        OrderDAO orderDAO = new OrderDAO();
        switch (productAction) {
            case "viewOrderListManager": {
                int pageNo = 1; // Trang mặc định
                int pageSize = 10; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                String pageSizeStr = request.getParameter("pageSize");
                if (pageSizeStr != null) {
                    pageSize = Integer.parseInt(pageSizeStr);
                }
                String userNameParam = request.getParameter("userName");
                String userName = (userNameParam != null && !userNameParam.isEmpty() && !Objects.equals(userNameParam, "null")) ? userNameParam : null;

                String orderStatusParam = request.getParameter("orderStatus");
                Integer orderStatus = (orderStatusParam != null && !orderStatusParam.isEmpty() && !Objects.equals(orderStatusParam, "null"))
                        ? Integer.parseInt(orderStatusParam) : null;

                String userIdParam = request.getParameter("userId");
                Integer userId = (userIdParam != null && !userIdParam.isEmpty() && !Objects.equals(userIdParam, "null"))
                        ? Integer.parseInt(userIdParam) : null;


                List<OrderDto> categoryList = orderDAO.getListOrderManager(pageNo, pageSize, userName, orderStatus, userId);
                int totalProducts = orderDAO.getTotalOrderCount(userName, orderStatus, userId);
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

                Map<String, Object> result = new HashMap<>();
                result.put("items", categoryList);
                result.put("totalPages", totalPages);
                // Chuyển danh sách món ăn thành JSON
                Gson gson = new Gson();
                String menuJson = gson.toJson(result);
                // Trả về JSON cho client
                response.getWriter().write(menuJson);
                break;
            }
            case "orderListManager": {
                String userId = request.getParameter("userId");
                if (userId != null) {
                    request.setAttribute("userId", Integer.parseInt(userId));
                } else {
                    request.setAttribute("userId", null);
                }
                request.getRequestDispatcher(Constants.LIST_ORDER_MANAGER).forward(request, response);
                break;
            }
            case "detailOrderAdmin": {
                Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDto orderDetail = orderDAO.getOrderDetail(orderId);
                request.setAttribute("orderDetail", orderDetail);
                String orderDetailJson = new Gson().toJson(orderDetail.getOrderDetailDto());
                request.setAttribute("orderDetailDtoList", orderDetailJson);
                request.getRequestDispatcher(Constants.ORDER_DETAIL_MANAGER).forward(request, response);
                break;
            }
            case "detailOrderUser": {
                Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDto orderDetail = orderDAO.getOrderDetail(orderId);
                request.setAttribute("orderDetail", orderDetail);
                String orderDetailJson = new Gson().toJson(orderDetail.getOrderDetailDto());
                request.setAttribute("orderDetailDtoList", orderDetailJson);
                request.getRequestDispatcher(Constants.ORDER_DETAIL_USER_JSP).forward(request, response);
                break;
            }
            case "orderHistoryUser": {
                request.getRequestDispatcher(Constants.ORDER_HISTORY_USER_JSP).forward(request, response);
                break;
            }
            case "staffUpdateStatusOrder": {
                try {
                    // Lấy orderId và statusId từ request
                    Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                    Integer statusId = Integer.parseInt(request.getParameter("statusId"));
                    Integer tableId = Integer.parseInt(request.getParameter("tableId"));

                    // Gọi phương thức cập nhật trạng thái đơn hàng
                    Boolean isUpdated = orderDAO.updateStatusOrder(orderId, statusId, tableId);
                    // Kiểm tra nếu cập nhật thành công
                    if (isUpdated) {
                        // Trả về phản hồi JSON cho client với thông báo thành công
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("{\"message\": \"Status updated successfully\", \"status\": \"success\"}");
                    } else {
                        // Trả về thông báo lỗi nếu cập nhật thất bại
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("{\"message\": \"Failed to update status\", \"status\": \"error\"}");
                    }

                } catch (NumberFormatException e) {
                    // Xử lý lỗi nếu orderId hoặc statusId không phải là số hợp lệ
                    e.printStackTrace();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"message\": \"Invalid orderId or statusId\", \"status\": \"error\"}");
                } catch (Exception e) {
                    // Xử lý lỗi chung
                    e.printStackTrace();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("{\"message\": \"An error occurred\", \"status\": \"error\"}");
                }
                return;
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
