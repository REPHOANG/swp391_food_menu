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
        // Lấy userId từ tham số yêu cầu HTTP GET và chuyển thành Integer
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        // Lấy tableId từ tham số yêu cầu HTTP GET và chuyển thành Integer
        Integer tableId = Integer.parseInt(request.getParameter("tableId"));
        // chỉ lấy userId và tableId từ request
    }   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Tạo một đối tượng ObjectMapper để xử lý JSON
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // Chuyển đổi JSON từ request thành đối tượng OrderDto
            OrderDto orderDto = objectMapper.readValue(request.getReader(), OrderDto.class);

            // Kiểm tra nếu TableId trong orderDto không null
            if (orderDto.getTableId() != null) {
                // Lấy session hiện tại của người dùng
                HttpSession session = request.getSession();
                // Tạo đối tượng TableDAO để truy xuất thông tin bàn từ cơ sở dữ liệu
                TableDAO tableDao = new TableDAO();
                // Lưu thông tin chi tiết bàn được chọn vào session với key "userSelectedTable"
                session.setAttribute("userSelectedTable", tableDao.getTableDetail(orderDto.getTableId()));
            }

            // Tạo đối tượng OrderDAO để thực hiện các thao tác với đơn hàng trong cơ sở dữ liệu
            OrderDAO orderDao = new OrderDAO();
            // Gọi phương thức createOrder để tạo đơn hàng mới và lưu kết quả vào biến isOrderCreated
            boolean isOrderCreated = orderDao.createOrder(orderDto);

            // Thiết lập kiểu nội dung phản hồi là JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Kiểm tra nếu tạo đơn hàng thành công
            if (isOrderCreated) {
                // Đặt trạng thái HTTP là 200 OK
                response.setStatus(HttpServletResponse.SC_OK);
                // Ghi JSON phản hồi về thành công và thông tin đơn hàng mới
                response.getWriter().write("{\"success\": true, \"status\": \"Order Placed\", \"message\": \"Order placed successfully\", \"orderId\": " + orderDto.getOrderId() + "}");
            } else {
                // Đặt trạng thái HTTP là 400 Bad Request nếu tạo đơn hàng thất bại
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                // Ghi JSON phản hồi về thất bại và lý do có thể dẫn đến lỗi
                response.getWriter().write("{\"success\": false, \"status\": \"Order Failed\", \"message\": \"Failed to place order. Possible reasons: insufficient stock, invalid table selection, or database error.\"}");
            }
        } catch (Exception e) {
            // Ghi lỗi ngoại lệ ra log
            e.printStackTrace();
            // Đặt trạng thái HTTP là 500 Internal Server Error nếu xảy ra lỗi
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // Ghi JSON phản hồi về lỗi ngoại lệ
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": false, \"status\": \"Processing Error\", \"message\": \"An error occurred while processing the order\", \"error\": \"" + e.getMessage() + "\"}");
        }
    }
}
