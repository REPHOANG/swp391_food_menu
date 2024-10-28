/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webmenu.dao.OrderDAO;
import com.mycompany.webmenu.dao.TableDAO;
import com.mycompany.webmenu.dto.OrderDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author nguye
 */
@WebServlet(name = "OrderUserController", urlPatterns = {"/OrderUserController"})
public class OrderUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer tableId = Integer.parseInt(request.getParameter("tableId"));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // Chuyển đổi JSON request thành đối tượng OrderDto
            OrderDto orderDto = objectMapper.readValue(request.getReader(), OrderDto.class);
            // Kiểm tra nếu TableId không null, lấy thông tin bàn từ TableDAO
            if (orderDto.getTableId() != null) {
                HttpSession session = request.getSession();
                TableDAO tableDao = new TableDAO();
                session.setAttribute("userSelectedTable", tableDao.getTableDetail(orderDto.getTableId()));
            }

            // Tạo OrderDAO và gọi phương thức createOrder
            OrderDAO orderDao = new OrderDAO();
            boolean isOrderCreated = orderDao.createOrder(orderDto);

            // Thiết lập kiểu dữ liệu và mã hóa cho phản hồi
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            if (isOrderCreated) {
                // Trả về trạng thái 200 OK và JSON cho trường hợp thành công
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"success\": true, \"status\": \"Order Placed\", \"message\": \"Order placed successfully\", \"orderId\": " + orderDto.getOrderId() + "}");
            } else {
                // Trả về trạng thái 400 Bad Request và JSON cho trường hợp thất bại
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"status\": \"Order Failed\", \"message\": \"Failed to place order. Possible reasons: insufficient stock, invalid table selection, or database error.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Thiết lập mã trạng thái HTTP là 500 nếu có lỗi xảy ra
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // Phản hồi JSON cho trường hợp lỗi ngoại lệ với trạng thái "Processing Error"
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": false, \"status\": \"Processing Error\", \"message\": \"An error occurred while processing the order\", \"error\": \"" + e.getMessage() + "\"}");
        }
    }
}
