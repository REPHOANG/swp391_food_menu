/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.webmenu.dao.OrderDAO;
import com.mycompany.webmenu.dto.OrderDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
            System.out.println("orderDto: " + orderDto);
            // Tạo OrderDAO và gọi phương thức createOrder
            OrderDAO orderDao = new OrderDAO();
            boolean isOrderCreated = orderDao.createOrder(orderDto);
            // Thiết lập kiểu dữ liệu và mã hóa cho phản hồi
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Gửi phản hồi JSON tùy thuộc vào kết quả của createOrder
            if (isOrderCreated) {
                // Trả về JSON cho trường hợp thành công
                response.getWriter().write("{\"success\": true, \"message\": \"Order placed successfully\"}");
            } else {
                // Trả về JSON cho trường hợp lỗi
                response.getWriter().write("{\"success\": false, \"message\": \"Failed to place order\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Thiết lập mã trạng thái HTTP là 500 nếu có lỗi xảy ra
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // Gửi phản hồi JSON cho trường hợp lỗi ngoại lệ
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred while processing the order\"}");
        }
    }
}
