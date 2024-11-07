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
        // Thiết lập kiểu dữ liệu trả về là HTML với mã hóa UTF-8
        response.setContentType("text/html;charset=UTF-8");

        // Lấy tham số `productAction` từ request để xác định hành động
        String productAction = request.getParameter("orderAction");
        // Lấy tham số `message` nếu có
        String message = request.getParameter("message");

        // Nếu `productAction` không được truyền, thiết lập giá trị mặc định là "orderListManager"
        if (productAction == null) {
            productAction = "orderListManager";
        }

        // Khởi tạo đối tượng `OrderDAO` để thao tác với dữ liệu đơn hàng
        OrderDAO orderDAO = new OrderDAO();

        // Kiểm tra giá trị của `productAction` để xác định hành động cần thực hiện
        switch (productAction) {

            case "viewOrderListManager": {
                // Cài đặt trang và số lượng sản phẩm mặc định
                int pageNo = 1; // Trang mặc định
                int pageSize = 10; // Số sản phẩm trên mỗi trang

                // Lấy số trang từ request, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }

                // Lấy kích thước trang từ request nếu có
                String pageSizeStr = request.getParameter("pageSize");
                if (pageSizeStr != null) {
                    pageSize = Integer.parseInt(pageSizeStr);
                }

                // Lấy tên người dùng, trạng thái đơn hàng, và ID người dùng nếu có từ request
                String userNameParam = request.getParameter("userName");
                String userName = (userNameParam != null && !userNameParam.isEmpty() && !Objects.equals(userNameParam, "null"))
                        ? userNameParam : null;

                String orderStatusParam = request.getParameter("orderStatus");
                Integer orderStatus = (orderStatusParam != null && !orderStatusParam.isEmpty() && !Objects.equals(orderStatusParam, "null"))
                        ? Integer.parseInt(orderStatusParam) : null;

                String userIdParam = request.getParameter("userId");
                Integer userId = (userIdParam != null && !userIdParam.isEmpty() && !Objects.equals(userIdParam, "null"))
                        ? Integer.parseInt(userIdParam) : null;

                // Lấy danh sách đơn hàng từ database với các tham số phân trang
                List<OrderDto> categoryList = orderDAO.getListOrderManager(pageNo, pageSize, userName, orderStatus, userId);
                int totalProducts = orderDAO.getTotalOrderCount(userName, orderStatus, userId);
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

                // Đưa kết quả vào Map để dễ dàng chuyển sang JSON
                Map<String, Object> result = new HashMap<>();
                result.put("items", categoryList);
                result.put("totalPages", totalPages);

                // Sử dụng `Gson` để chuyển đổi `result` thành chuỗi JSON
                Gson gson = new Gson();
                String menuJson = gson.toJson(result);

                // Ghi JSON ra response để gửi về cho client
                response.getWriter().write(menuJson);
                break;
            }

            case "orderListManager": {
                // Xử lý hiển thị trang quản lý danh sách đơn hàng
                String userId = request.getParameter("userId");
                if (userId != null) {
                    request.setAttribute("userId", Integer.parseInt(userId));
                } else {
                    request.setAttribute("userId", null);
                }
                // Chuyển tiếp request tới trang `LIST_ORDER_MANAGER`
                request.getRequestDispatcher(Constants.LIST_ORDER_MANAGER).forward(request, response);
                break;
            }

            case "detailOrderAdmin": {
                // Hiển thị chi tiết đơn hàng cho admin
                Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDto orderDetail = orderDAO.getOrderDetail(orderId);
                request.setAttribute("orderDetail", orderDetail);

                // Chuyển `orderDetail` thành JSON để gửi về cho view
                String orderDetailJson = new Gson().toJson(orderDetail.getOrderDetailDto());
                request.setAttribute("orderDetailDtoList", orderDetailJson);

                // Chuyển tiếp request tới trang chi tiết đơn hàng cho admin
                request.getRequestDispatcher(Constants.ORDER_DETAIL_MANAGER).forward(request, response);
                break;
            }

            case "detailOrderUser": {
                // Hiển thị chi tiết đơn hàng cho người dùng
                Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                OrderDto orderDetail = orderDAO.getOrderDetail(orderId);
                request.setAttribute("orderDetail", orderDetail);

                // Chuyển `orderDetail` thành JSON để gửi về cho view
                String orderDetailJson = new Gson().toJson(orderDetail.getOrderDetailDto());
                request.setAttribute("orderDetailDtoList", orderDetailJson);

                // Chuyển tiếp request tới trang chi tiết đơn hàng cho người dùng
                request.getRequestDispatcher(Constants.ORDER_DETAIL_USER_JSP).forward(request, response);
                break;
            }

            case "orderHistoryUser": {
                // Chuyển tiếp đến trang lịch sử đơn hàng của người dùng
                request.getRequestDispatcher(Constants.ORDER_HISTORY_USER_JSP).forward(request, response);
                break;
            }

            case "staffUpdateStatusOrder": {
                try {
                    // Lấy `orderId`, `statusId`, và `tableId` từ request
                    Integer orderId = Integer.parseInt(request.getParameter("orderId"));
                    Integer statusId = Integer.parseInt(request.getParameter("statusId"));
                    Integer tableId = Integer.parseInt(request.getParameter("tableId"));

                    // Cập nhật trạng thái đơn hàng trong database
                    Boolean isUpdated = orderDAO.updateStatusOrder(orderId, statusId, tableId);

                    // Thiết lập kiểu dữ liệu trả về là JSON
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Trả về JSON xác nhận nếu cập nhật thành công
                    if (isUpdated) {
                        response.getWriter().write("{\"message\": \"Status updated successfully\", \"status\": \"success\"}");
                    } else {
                        // Trả về JSON lỗi nếu cập nhật thất bại
                        response.getWriter().write("{\"message\": \"Failed to update status\", \"status\": \"error\"}");
                    }

                } catch (NumberFormatException e) {
                    // Xử lý lỗi nếu `orderId` hoặc `statusId` không hợp lệ
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
                // Trường hợp không có hành động nào phù hợp, ném ngoại lệ
                throw new AssertionError();
        }
    }

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
