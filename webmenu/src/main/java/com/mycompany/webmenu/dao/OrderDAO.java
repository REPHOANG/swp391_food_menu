package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.BestSellingProductDto;
import com.mycompany.webmenu.dto.OrderDto;
import com.mycompany.webmenu.dto.OrderDetailDto;
import com.mycompany.webmenu.dto.RecentOrders;
import com.mycompany.webmenu.enums.StatusOrderType;
import com.mycompany.webmenu.enums.StatusTablesType;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAO {

    @SneakyThrows
    public List<OrderDto> getListOrderManager(int page, int pageSize, String userName, Integer orderStatus, Integer userId, String sortColumn, String sortDirection) {
        int offset = (page - 1) * pageSize;

        // Xây dựng câu truy vấn SQL động
        StringBuilder sql = new StringBuilder("SELECT x1.order_id AS orderId, x1.user_id AS userId, ")
                .append("COALESCE(x2.full_name, x1.user_name) AS userName, ")
                .append("x1.table_id AS tableId, x3.table_name AS tableName, x1.discount_id AS discountId, ")
                .append("x1.order_date AS orderDate, x1.order_status AS orderStatus, ")
                .append("x1.delivery_address AS deliveryAddress, x1.order_note AS orderNote, ")
                .append("x1.order_total AS orderTotal, x1.shipping_fee AS shippingFee ")
                .append("FROM Orders x1 ")
                .append("LEFT JOIN Users x2 ON x2.user_id = x1.user_id ")
                .append("LEFT JOIN Tables x3 ON x3.table_id = x1.table_id ")
                .append("WHERE 1=1 ");

        // Chỉ thêm điều kiện tìm kiếm khi có giá trị tương ứng
        if (userName != null && !userName.isEmpty()) {
            sql.append("AND COALESCE(x2.full_name, x1.user_name) LIKE ? ");
        }
        if (orderStatus != null) {
            sql.append("AND x1.order_status = ? ");
        }
        if (userId != null) {
            sql.append("AND x1.user_id = ? ");
        }

        // Thêm câu lệnh sắp xếp dựa trên tham số `sortColumn` và `sortDirection`
        if (sortColumn != null && !sortColumn.isEmpty()) {
            sql.append("ORDER BY ").append(sortColumn).append(" ");
            if ("DESC".equalsIgnoreCase(sortDirection)) {
                sql.append("DESC ");
            } else {
                sql.append("ASC ");
            }
        } else {
            // Sắp xếp mặc định nếu không có cột sắp xếp được chỉ định
            sql.append("ORDER BY x1.order_date DESC ");
        }

        // Thêm điều kiện phân trang
        sql.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

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
            if (userId != null) {
                stm.setInt(paramIndex++, userId);
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
                    dto.setTableName(rs.getString("tableName"));
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


    public int getTotalOrderCount(String userName, Integer orderStatus, Integer userId) {
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
        if (userId != null) {
            query.append("AND x1.user_id = ? "); // Thêm điều kiện tìm kiếm cho userId
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;

            // Thiết lập tham số cho câu lệnh SQL
            if (userName != null && !userName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + userName + "%"); // Sử dụng LIKE với ký tự `%`
            }
            if (orderStatus != null) {
                stmt.setInt(paramIndex++, orderStatus); // Cập nhật paramIndex++
            }
            if (userId != null) {
                stmt.setInt(paramIndex++, userId); // Thiết lập giá trị cho userId
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
    public OrderDto getOrderDetail(Integer orderId) {
        String sql = "SELECT x1.order_id AS orderId, x1.user_id AS userId, " +
                "x1.table_id AS tableId,x4.table_name AS tableName, x1.discount_id AS discountId, " +
                "x1.order_date AS orderDate, x1.order_status AS orderStatus, " +
                "x1.delivery_address AS deliveryAddress, x1.order_note AS orderNote, " +
                "x1.order_total AS orderTotal, x1.shipping_fee AS shippingFee, " +
                "COALESCE(x2.full_name, x1.user_name) AS userName," +
                "x3.max_discount_value as maxDiscountValue " +
                "FROM Orders x1 " +
                "LEFT JOIN Users x2 ON x2.user_id = x1.user_id " +
                "LEFT JOIN Discounts x3 ON x3.discount_id = x1.discount_id " +
                "LEFT JOIN Tables x4 ON x4.table_id = x1.table_id " +
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
                    orderDto.setTableName(rs.getString("tableName"));                // Name bàn
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
                tableDAO.updateStatusTable(tableId, StatusTablesType.AVAILABLE.getId());
            }
            OrderDto dto = this.getOrderDetail(orderId);
            this.updateAccumulatedPoints(dto.getUserId());
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

    public void updateAccumulatedPoints(Integer userId) {
        String updateQuery = "UPDATE Users " +
                "SET accumulated_points = COALESCE((SELECT SUM(x1.order_total) " +
                "FROM Orders x1 " +
                "WHERE x1.user_id = ? " +
                "AND x1.order_status IN (4, 5, 6) " +
                "GROUP BY x1.user_id), 0) " +
                "WHERE user_id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            // Thiết lập giá trị cho các tham số trong câu lệnh SQL
            preparedStatement.setInt(1, userId); // Tham số đầu tiên cho truy vấn con
            preparedStatement.setInt(2, userId); // Tham số thứ hai cho mệnh đề WHERE
            // Thực thi lệnh cập nhật
            int rowsUpdated = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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

    public Double getTotalRevenue() {
        String query = "select sum(x1.order_total) as total from Orders x1 where x1.order_status in (4,5,6)";
        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) { // Tự động đóng statement và result set
            if (rs.next()) {
                return rs.getDouble("total"); // Trả về tổng số sản phẩm ngay lập tức
            }
        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            return 0.0;
        }
        return 0.0;
    }

    public Integer getTotalOrders() {
        String query = "select count(x1.order_id) as total from Orders x1 where x1.order_status in (4,5,6)";
        try (Connection conn = DBUtil.getConnection(); // Sử dụng try-with-resources để tự động đóng kết nối
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) { // Tự động đóng statement và result set
            if (rs.next()) {
                return rs.getInt("total"); // Trả về tổng số sản phẩm ngay lập tức
            }
        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            return 0;
        }
        return 0;
    }

    public List<BestSellingProductDto> getTop5BestSellingProducts(String startDate, String endDate) {
        List<BestSellingProductDto> bestSellingProducts = new ArrayList<>();
        String query = "SELECT x1.name            AS productName,\n" +
                "       x1.price,\n" +
                "       COUNT(x2.order_id) AS orders,\n" +
                "       SUM(x2.quantity)   AS amount\n" +
                "FROM Products x1\n" +
                "JOIN OrderDetails x2 ON x2.product_id = x1.product_id\n" +
                "JOIN Orders x3 ON x3.order_id = x2.order_id\n" +
                "WHERE FORMAT(x3.order_date, 'yyyy-MM-dd') BETWEEN ? AND ?\n" + // Lọc theo ngày bắt đầu và kết thúc
                "GROUP BY x1.product_id, x1.name, x1.price\n" +
                "ORDER BY amount DESC, orders DESC, x1.name DESC\n" +
                "OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Định dạng lại startDate và endDate thành yyyy-MM-dd
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedStartDate = startDate;
            String formattedEndDate = endDate;

            // Chuyển đổi sang java.sql.Date
            stmt.setDate(1, java.sql.Date.valueOf(formattedStartDate));
            stmt.setDate(2, java.sql.Date.valueOf(formattedEndDate));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BestSellingProductDto dto = new BestSellingProductDto();
                    dto.setProductName(rs.getString("productName"));
                    dto.setPrice(rs.getDouble("price"));
                    dto.setOrders(rs.getInt("orders"));
                    dto.setAmount(rs.getInt("amount"));
                    bestSellingProducts.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi để debug
        }
        return bestSellingProducts;
    }

    public List<RecentOrders> getRecentOrders(String startDate, String endDate) {
        List<RecentOrders> recentOrdersList = new ArrayList<>();

        // Cập nhật câu truy vấn SQL với điều kiện WHERE để lọc theo ngày
        String query = "SELECT COALESCE(x2.full_name, x1.user_name) AS userName, " +
                "       x1.order_date, " +
                "       x1.order_total, " +
                "       x1.order_status " +
                "FROM Orders x1 " +
                "LEFT JOIN Users x2 ON x2.user_id = x1.user_id " +
                "WHERE FORMAT(x1.order_date, 'yyyy-MM-dd') BETWEEN ? AND ? " +  // Lọc theo ngày trong khoảng startDate và endDate
                "ORDER BY x1.order_date DESC " +
                "OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Chuyển startDate và endDate sang định dạng chuẩn của SQL (yyyy-MM-dd)
            stmt.setString(1, startDate);  // Thiết lập tham số đầu tiên là startDate
            stmt.setString(2, endDate);    // Thiết lập tham số thứ hai là endDate

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RecentOrders recentOrder = new RecentOrders();
                    recentOrder.setUserName(rs.getString("userName"));
                    recentOrder.setOrderDate(rs.getDate("order_date"));
                    recentOrder.setOrderTotal(rs.getDouble("order_total"));
                    recentOrder.setOrderStatus(rs.getInt("order_status"));

                    recentOrdersList.add(recentOrder);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi để debug
        }

        return recentOrdersList;
    }
}
