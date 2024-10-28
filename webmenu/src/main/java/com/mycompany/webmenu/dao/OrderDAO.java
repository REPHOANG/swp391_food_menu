package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.OrderDto;
import com.mycompany.webmenu.dto.OrderDetailDto;
import com.mycompany.webmenu.enums.StatusOrderType;
import com.mycompany.webmenu.enums.StatusTablesType;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    @SneakyThrows
    public List<OrderDto> getListOrderManager(int page, int pageSize, String userName, Integer orderStatus) {
        int offset = (page - 1) * pageSize;

        // Xây dựng câu truy vấn SQL động
        StringBuilder sql = new StringBuilder("SELECT x1.order_id AS orderId, x1.user_id AS userId, ")
                .append("COALESCE(x2.full_name, x1.user_name) AS userName, ")
                .append("x1.table_id AS tableId, x1.discount_id AS discountId, ")
                .append("x1.order_date AS orderDate, x1.order_status AS orderStatus, ")
                .append("x1.delivery_address AS deliveryAddress, x1.order_note AS orderNote, ")
                .append("x1.order_total AS orderTotal, x1.shipping_fee AS shippingFee ")
                .append("FROM Orders x1 ")
                .append("LEFT JOIN Users x2 ON x2.user_id = x1.user_id ")
                .append("WHERE 1=1 ");

        // Chỉ thêm điều kiện tìm kiếm khi có giá trị tương ứng
        if (userName != null && !userName.isEmpty()) {
            sql.append("AND COALESCE(x2.full_name, x1.user_name) LIKE ? ");
        }
        if (orderStatus != null) {
            sql.append("AND x1.order_status = ? ");
        }

        // Thêm điều kiện phân trang
        sql.append("ORDER BY x1.order_date DESC ")
                .append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        // Thiết lập kết nối và câu lệnh PreparedStatement
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            // Thiết lập giá trị cho các điều kiện tìm kiếm nếu có
            if (userName != null && !userName.isEmpty()) {
                stm.setString(paramIndex++, "%" + userName + "%"); // Sử dụng LIKE với ký tự `%`
            }
            if (orderStatus != null) {
                stm.setInt(paramIndex++, orderStatus);
            }

            // Thiết lập giá trị LIMIT và OFFSET cho phân trang
            stm.setInt(paramIndex++, offset); // OFFSET cho trang hiện tại
            stm.setInt(paramIndex, pageSize); // Số lượng bản ghi mỗi trang (LIMIT)

            // Thực thi truy vấn và xử lý kết quả
            try (ResultSet rs = stm.executeQuery()) {
                List<OrderDto> list = new ArrayList<>();

                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    OrderDto dto = new OrderDto();
                    dto.setOrderId(rs.getInt("orderId"));
                    dto.setUserId(rs.getInt("userId"));
                    dto.setUserName(rs.getString("userName"));
                    dto.setTableId(rs.getInt("tableId"));
                    dto.setDiscountId(rs.getInt("discountId"));
                    dto.setOrderDate(rs.getDate("orderDate"));
                    dto.setOrderStatus(rs.getInt("orderStatus"));
                    dto.setDeliveryAddress(rs.getString("deliveryAddress"));
                    dto.setOrderNote(rs.getString("orderNote"));
                    dto.setOrderTotal(rs.getDouble("orderTotal"));
                    dto.setShippingFee(rs.getDouble("shippingFee"));

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

    public int getTotalOrderCount(String userName, Integer orderStatus) {
        StringBuilder query = new StringBuilder("SELECT COUNT(x1.order_id) AS total ")
                .append("FROM Orders x1 ")
                .append("LEFT JOIN Users x2 ON x2.user_id = x1.user_id ")
                .append("WHERE 1=1 ");

        // Xây dựng câu truy vấn động để thêm điều kiện tìm kiếm
        if (userName != null && !userName.isEmpty()) {
            query.append("AND COALESCE(x2.full_name, x1.user_name) LIKE ? ");
        }
        if (orderStatus != null) {
            query.append("AND x1.order_status = ? ");
        }
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            // Thiết lập tham số cho câu lệnh SQL
            if (userName != null && !userName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + userName + "%"); // Sử dụng LIKE với ký tự `%`
            }
            if (orderStatus != null) {
                stmt.setInt(paramIndex, orderStatus);
            }
            // Thực thi truy vấn và trả về tổng số bản ghi
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total"); // Trả về tổng số bản ghi
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
        }
        return 0; // Trả về 0 nếu có lỗi hoặc không tìm thấy bản ghi nào
    }

    @SneakyThrows
    public List<OrderDto> getListOrderUserManager(int userId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.order_id AS orderId, x1.user_id AS userId, " +
                "COALESCE(x2.full_name, x1.user_name) AS userName, " +
                "x1.table_id AS tableId, x1.discount_id AS discountId, " +
                "x1.order_date AS orderDate, x1.order_status AS orderStatus, " +
                "x1.delivery_address AS deliveryAddress, x1.order_note AS orderNote, " +
                "x1.order_total AS orderTotal, x1.shipping_fee AS shippingFee " +
                "FROM Orders x1 " +
                "LEFT JOIN Users x2 ON x2.user_id = x1.user_id " +
                "WHERE x1.user_id = ? " +
                "ORDER BY x1.order_date DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {

            // Thiết lập tham số cho câu lệnh SQL
            stm.setInt(1, userId);
            stm.setInt(2, offset);
            stm.setInt(3, pageSize);

            try (ResultSet rs = stm.executeQuery()) {
                List<OrderDto> list = new ArrayList<>();

                // Lặp qua kết quả truy vấn
                while (rs.next()) {
                    OrderDto dto = new OrderDto();
                    dto.setOrderId(rs.getInt("orderId"));                 // ID đơn hàng
                    dto.setUserId(rs.getInt("userId"));                   // ID người dùng
                    dto.setUserName(rs.getString("userName"));            // Tên người dùng hoặc tên từ user_name trong Orders
                    dto.setTableId(rs.getInt("tableId"));                 // ID bàn
                    dto.setDiscountId(rs.getInt("discountId"));           // ID mã giảm giá
                    dto.setOrderDate(rs.getDate("orderDate"));            // Ngày đặt hàng
                    dto.setOrderStatus(rs.getInt("orderStatus"));         // Trạng thái đơn hàng
                    dto.setDeliveryAddress(rs.getString("deliveryAddress")); // Địa chỉ giao hàng
                    dto.setOrderNote(rs.getString("orderNote"));          // Ghi chú cho đơn hàng
                    dto.setOrderTotal(rs.getDouble("orderTotal"));        // Tổng tiền của đơn hàng
                    dto.setShippingFee(rs.getDouble("shippingFee"));      // Phí vận chuyển

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
    public OrderDto getOrderDetail(Integer orderId) {
        String sql = "SELECT x1.order_id AS orderId, x1.user_id AS userId, " +
                "x1.table_id AS tableId, x1.discount_id AS discountId, " +
                "x1.order_date AS orderDate, x1.order_status AS orderStatus, " +
                "x1.delivery_address AS deliveryAddress, x1.order_note AS orderNote, " +
                "x1.order_total AS orderTotal, x1.shipping_fee AS shippingFee, " +
                "COALESCE(x2.full_name, x1.user_name) AS userName," +
                "x3.max_discount_value as maxDiscountValue " +
                "FROM Orders x1 " +
                "LEFT JOIN Users x2 ON x2.user_id = x1.user_id " +
                "LEFT JOIN Discounts x3 ON x3.discount_id = x1.discount_id " +
                "WHERE x1.order_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, orderId);  // Đặt tham số cho câu lệnh SQL
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Tạo đối tượng OrderDTO từ dữ liệu truy vấn
                    OrderDto orderDto = new OrderDto();
                    orderDto.setOrderId(rs.getInt("orderId"));                // ID đơn hàng
                    orderDto.setUserId(rs.getInt("userId"));                  // ID người dùng
                    orderDto.setUserName(rs.getString("userName"));           // Tên người dùng hoặc từ user_name trong Orders
                    orderDto.setTableId(rs.getInt("tableId"));                // ID bàn
                    orderDto.setDiscountId(rs.getInt("discountId"));          // ID mã giảm giá
                    orderDto.setOrderDate(rs.getDate("orderDate"));           // Ngày đặt hàng
                    orderDto.setOrderStatus(rs.getInt("orderStatus"));        // Trạng thái đơn hàng
                    orderDto.setDeliveryAddress(rs.getString("deliveryAddress")); // Địa chỉ giao hàng
                    orderDto.setOrderNote(rs.getString("orderNote"));         // Ghi chú cho đơn hàng
                    orderDto.setOrderTotal(rs.getDouble("orderTotal"));       // Tổng tiền của đơn hàng
                    orderDto.setShippingFee(rs.getDouble("shippingFee"));     // Phí vận chuyển
                    orderDto.setMaxDiscountValue(rs.getDouble("maxDiscountValue")); // Giá trị giảm giá tối đa
                    orderDto.setOrderDetailDto(this.getAllOrderDetails(conn, orderId)); // Lấy danh sách chi tiết đơn hàng
                    return orderDto;
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return null;  // Trả về null nếu không tìm thấy đơn hàng
    }

    private List<OrderDetailDto> getAllOrderDetails(Connection conn, Integer orderId) throws SQLException {
        List<OrderDetailDto> orderDetails = new ArrayList<>();
        String sql = "SELECT x1.order_detail_id AS orderDetailId, x1.order_id AS orderId, " +
                "x1.product_id AS productId, x2.name AS productName, x3.url AS productUrl, " +
                "x1.quantity AS quantity, x2.price AS productPrice " +
                "FROM OrderDetails x1 " +
                "JOIN Products x2 ON x2.product_id = x1.product_id " +
                "LEFT JOIN ImageProducts x3 ON x3.product_id = x2.product_id " +
                "WHERE x1.order_id = ? AND (x3.image_id IS NULL OR x3.is_main_image = 1)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);  // Đặt tham số cho câu lệnh SQL
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Tạo đối tượng OrderDetailDTO từ dữ liệu truy vấn
                    OrderDetailDto orderDetail = OrderDetailDto.builder()
                            .orderDetailId(rs.getInt("orderDetailId"))   // ID chi tiết đơn hàng
                            .orderId(rs.getInt("orderId"))               // ID đơn hàng
                            .productId(rs.getInt("productId"))           // ID sản phẩm
                            .productName(rs.getString("productName"))    // Tên sản phẩm
                            .productUrl(rs.getString("productUrl"))      // URL hình ảnh sản phẩm
                            .productPrice(rs.getDouble("productPrice"))  // Giá sản phẩm
                            .quantity(rs.getInt("quantity"))             // Số lượng sản phẩm
                            .build();

                    orderDetails.add(orderDetail);  // Thêm vào danh sách chi tiết đơn hàng
                }
            }
        }
        return orderDetails;  // Trả về danh sách chi tiết đơn hàng
    }

    public Boolean updateStatusOrder(Integer orderId, Integer status, Integer tableId) {
        Connection connection = null;
        PreparedStatement statement = null;

        String updateQuery = "UPDATE Orders SET order_status = ? WHERE order_id = ?";

        try {
            // Obtain a database connection (assuming you have a method to do this)
            connection = DBUtil.getConnection();

            // Prepare the SQL update statement
            statement = connection.prepareStatement(updateQuery);
            statement.setInt(1, status);       // Set the new status
            statement.setInt(2, orderId);      // Specify which order to update
            // Execute the update
            int rowsAffected = statement.executeUpdate();
            if (status == StatusOrderType.TABLE_CLEARED.getId()) {
                TableDAO tableDAO = new TableDAO();
                System.out.println("tableId " + tableId);
                tableDAO.updateStatusTable(tableId, StatusTablesType.AVAILABLE.getId());
            }
            // Check if the update was successful
            if (rowsAffected > 0) {
                System.out.println("Order status updated successfully.");
                return true;
            } else {
                System.out.println("Order not found.");
                return false;
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            System.out.println("Failed to update order status: " + e.getMessage());
            return false;
        } finally {
            // Close resources to prevent memory leaks
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Failed to close resources: " + e.getMessage());
            }
        }
    }

    public Boolean createOrder(OrderDto order) {
        Connection conn = null;
        PreparedStatement pstmtOrder = null;
        PreparedStatement pstmtOrderDetail = null;
        ResultSet generatedKeys = null;

        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // 1. Thêm vào bảng Orders
            String insertOrderQuery = "INSERT INTO Orders (table_id, user_id, discount_id, user_name, order_date" +
                    ", delivery_address, order_note, order_status, order_total) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmtOrder = conn.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);

            pstmtOrder.setObject(1, order.getTableId(), Types.INTEGER);
            pstmtOrder.setObject(2, order.getUserId(), Types.INTEGER);
            pstmtOrder.setObject(3, order.getDiscountId(), Types.INTEGER);
            pstmtOrder.setString(4, order.getUserName());
            pstmtOrder.setTimestamp(5, new Timestamp(order.getOrderDate().getTime()));
            pstmtOrder.setString(6, order.getDeliveryAddress());
            pstmtOrder.setString(7, order.getOrderNote());
            pstmtOrder.setInt(8, StatusOrderType.INITIALIZED.getId()); // Mặc định trạng thái là PREPARING
            BigDecimal orderTotal = order.getOrderTotal() != null
                    ? BigDecimal.valueOf(order.getOrderTotal()).setScale(2, RoundingMode.HALF_UP)
                    : null;
            pstmtOrder.setBigDecimal(9, orderTotal);

            int affectedRows = pstmtOrder.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            // Lấy order_id của đơn hàng mới được tạo
            generatedKeys = pstmtOrder.getGeneratedKeys();
            int orderId;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            // 2. Thêm các chi tiết đơn hàng vào bảng OrderDetails
            String insertOrderDetailQuery = "INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (?, ?, ?)";
            pstmtOrderDetail = conn.prepareStatement(insertOrderDetailQuery);

            for (OrderDetailDto detail : order.getOrderDetailDto()) {
                pstmtOrderDetail.setInt(1, orderId);
                pstmtOrderDetail.setInt(2, detail.getProductId());
                pstmtOrderDetail.setInt(3, detail.getQuantity());
                pstmtOrderDetail.addBatch();
            }
            pstmtOrderDetail.executeBatch();

            // 3. Cập nhật trạng thái bàn sau khi đơn hàng và chi tiết đã được tạo thành công
            if (order.getTableId() != null) {
                TableDAO tableDAO = new TableDAO();
                tableDAO.updateStatusTable(order.getTableId(), StatusTablesType.IN_USE.getId());
            }

            // 3. Cập nhật trạng thái bàn sau khi đơn hàng và chi tiết đã được tạo thành công
            if (order.getDiscountId() != null) {
                DiscountDAO discountDao = new DiscountDAO();
                discountDao.applyDiscount(order.getDiscountId());
            }

            conn.commit(); // Commit transaction nếu tất cả các thao tác đều thành công

            System.out.println("Đơn hàng đã được tạo thành công");
            return true; // Trả về true nếu thành công
        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback(); // Rollback nếu xảy ra lỗi
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi xảy ra
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (pstmtOrder != null) pstmtOrder.close();
                if (pstmtOrderDetail != null) pstmtOrderDetail.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
