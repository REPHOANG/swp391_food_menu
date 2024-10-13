package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.OrderDTO;
import com.mycompany.webmenu.dto.OrderDetailDTO;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    @SneakyThrows
    public List<OrderDTO> getListOrderManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.order_id AS orderId, x2.user_id AS userId, x2.email AS userName, " +
                "x1.order_date AS orderDate, x1.status, x1.address " +
                "FROM Orders x1 " +
                "JOIN Users x2 ON x2.user_id = x1.user_id " +
                "ORDER BY x1.order_date DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        // Sử dụng try-with-resources để tự động đóng Connection và PreparedStatement
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Thiết lập tham số cho câu lệnh SQL
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            try (ResultSet rs = stm.executeQuery()) {
                List<OrderDTO> list = new ArrayList<>();
                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    OrderDTO dto = new OrderDTO();
                    dto.setOrderId(rs.getInt("orderId"));
                    dto.setUserId(rs.getInt("userId"));
                    dto.setUserName(rs.getString("userName"));
                    dto.setOrderDate(rs.getDate("orderDate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddress(rs.getString("address"));
                    // Thêm đối tượng OrderDTO vào danh sách
                    list.add(dto);
                }
                System.out.println("list " + list);
                return list; // Trả về danh sách đơn hàng
            }
        } catch (SQLException e) {
            // In ra lỗi SQL để gỡ lỗi
            System.err.println("SQL error: " + e.getMessage());
            return new ArrayList<>(); // Trả về danh sách rỗng trong trường hợp có lỗi
        }
    }


    @SneakyThrows
    public int getTotalOrderCount() {
        String query = "select count(order_id) as total from Orders";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public List<OrderDTO> getListOrderUserManager(int userId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.order_id AS orderId, x2.user_id AS userId, x2.email AS userName, " +
                "x1.order_date AS orderDate, x1.status, x1.address " +
                "FROM Orders x1 " +
                "JOIN Users x2 ON x2.user_id = x1.user_id " +
                "where x2.user_id = ? " +
                "ORDER BY x1.order_date DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        // Sử dụng try-with-resources để tự động đóng Connection và PreparedStatement
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {
            // Thiết lập tham số cho câu lệnh SQL
            stm.setInt(1, userId);
            stm.setInt(2, offset);
            stm.setInt(3, pageSize);
            try (ResultSet rs = stm.executeQuery()) {
                List<OrderDTO> list = new ArrayList<>();
                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    OrderDTO dto = new OrderDTO();
                    dto.setOrderId(rs.getInt("orderId"));
                    dto.setUserId(rs.getInt("userId"));
                    dto.setUserName(rs.getString("userName"));
                    dto.setOrderDate(rs.getDate("orderDate"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setAddress(rs.getString("address"));
                    // Thêm đối tượng OrderDTO vào danh sách
                    list.add(dto);
                }
                return list; // Trả về danh sách đơn hàng
            }
        } catch (SQLException e) {
            // In ra lỗi SQL để gỡ lỗi
            System.err.println("SQL error: " + e.getMessage());
            return new ArrayList<>(); // Trả về danh sách rỗng trong trường hợp có lỗi
        }
    }

    @SneakyThrows
    public int getTotalOrderUserCount(Integer userId) {
        String query = "select count(order_id) as total from Orders where user_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public OrderDTO getOrderDetail(Integer orderId) {
        String sql = "SELECT x1.order_id AS orderId, x1.order_date AS orderDate, x1.status, x1.address " +
                "FROM Orders x1 WHERE x1.order_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, orderId);  // Đặt tham số cho câu lệnh SQL
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Sử dụng builder() của OrderDTO
                    return OrderDTO.builder()
                            .orderId(rs.getInt("orderId"))
                            .orderDate(rs.getDate("orderDate"))
                            .address(rs.getString("address"))
                            .status(rs.getInt("status"))  // Đảm bảo có trường status
                            .orderDetailDto(getAllOrderDetails(conn, orderId))  // Lấy danh sách chi tiết đơn hàng
                            .build();
                }
            }
        }
        return null;  // Trả về null nếu không tìm thấy đơn hàng
    }

    private List<OrderDetailDTO> getAllOrderDetails(Connection conn, Integer orderId) throws SQLException {
        List<OrderDetailDTO> orderDetails = new ArrayList<>();
        String sqlImgs = "SELECT x2.product_id AS productId, x2.name AS productName, x3.url AS url, " +
                "x1.quantity AS quantity, x1.price AS price " + // Bỏ status nếu không cần
                "FROM OrderDetails x1 " +
                "JOIN Product x2 ON x2.product_id = x1.product_id " +
                "LEFT JOIN image_product x3 ON x3.product_id = x2.product_id " +
                "WHERE x1.order_id = ? AND (x3.image_id IS NULL OR x3.is_main_img = 1)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlImgs)) {
            stmt.setInt(1, orderId);  // Đặt tham số cho câu lệnh SQL
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Sử dụng builder() của OrderDetailDTO
                    OrderDetailDTO orderDetail = OrderDetailDTO.builder()
                            .productId(rs.getInt("productId"))
                            .productName(rs.getString("productName"))
                            .url(rs.getString("url"))
                            .price(rs.getDouble("price"))
                            .quantity(rs.getInt("quantity"))
                            .build();

                    orderDetails.add(orderDetail);  // Thêm vào danh sách chi tiết đơn hàng
                }
            }
        }
        return orderDetails;  // Trả về danh sách chi tiết đơn hàng
    }

}
