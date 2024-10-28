package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.DiscountDto;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO {
    public List<DiscountDto> getListDiscountUser() {
        String sql = "SELECT discount_id, discount_code, name, description, discount_percent, max_discount_value,\n" +
                "       min_discount_value, start_date, end_date, quantity, rm_quantity\n" +
                "FROM Discounts\n" +
                "where quantity > rm_quantity\n" +
                "ORDER BY discount_id DESC";
        List<DiscountDto> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    DiscountDto dto = new DiscountDto();
                    dto.setId(rs.getInt("discount_id"));
                    dto.setDiscountCode(rs.getString("discount_code"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setDiscountPercent(rs.getDouble("discount_percent"));
                    dto.setMaxDiscountValue(rs.getDouble("max_discount_value"));
                    dto.setMinDiscountValue(rs.getDouble("min_discount_value"));
                    dto.setStartDate(rs.getDate("start_date"));
                    dto.setEndDate(rs.getDate("end_date"));
                    dto.setQuantity(rs.getInt("quantity"));
                    dto.setRmQuantity(rs.getInt("rm_quantity"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching discounts", e);
        }
        return list;
    }

    public List<DiscountDto> getListDiscountManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT discount_id, discount_code, name, description, discount_percent, max_discount_value, " +
                "min_discount_value, start_date, end_date, quantity, rm_quantity " +
                "FROM Discounts " +
                "ORDER BY discount_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        List<DiscountDto> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setInt(1, offset);
            stm.setInt(2, pageSize);

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    DiscountDto dto = new DiscountDto();
                    dto.setId(rs.getInt("discount_id"));
                    dto.setDiscountCode(rs.getString("discount_code"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setDiscountPercent(rs.getDouble("discount_percent"));
                    dto.setMaxDiscountValue(rs.getDouble("max_discount_value"));
                    dto.setMinDiscountValue(rs.getDouble("min_discount_value"));
                    dto.setStartDate(rs.getDate("start_date"));
                    dto.setEndDate(rs.getDate("end_date"));
                    dto.setQuantity(rs.getInt("quantity"));
                    dto.setRmQuantity(rs.getInt("rm_quantity"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching discounts", e);
        }
        return list;
    }

    @SneakyThrows
    public int getTotalDiscountCount() {
        String query = "select count(discount_id) as total from Discounts";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public DiscountDto getDiscountDetail(Integer discountId) {
        String sql = "SELECT discount_id, discount_code, name, description, discount_percent, max_discount_value, " +
                "min_discount_value, start_date, end_date, quantity, rm_quantity " +
                "FROM Discounts WHERE discount_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, discountId);  // Sử dụng setInt vì discount_id là kiểu INT trong cơ sở dữ liệu
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Trả về đối tượng DiscountDto từ dữ liệu của ResultSet
                    DiscountDto dto = new DiscountDto();
                    dto.setId(rs.getInt("discount_id"));
                    dto.setDiscountCode(rs.getString("discount_code"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setDiscountPercent(rs.getDouble("discount_percent"));
                    dto.setMaxDiscountValue(rs.getDouble("max_discount_value"));
                    dto.setMinDiscountValue(rs.getDouble("min_discount_value"));
                    dto.setStartDate(rs.getDate("start_date"));
                    dto.setEndDate(rs.getDate("end_date"));
                    dto.setQuantity(rs.getInt("quantity"));
                    dto.setRmQuantity(rs.getInt("rm_quantity"));
                    return dto;
                }
            }
        }
        return null;  // Trả về null nếu không tìm thấy bản ghi nào
    }


    @SneakyThrows
    public Boolean insertOrUpdateDiscount(DiscountDto discountDTO) {
        String queryInsert = "INSERT INTO Discounts (discount_code, name, description, discount_percent, " +
                "max_discount_value, min_discount_value, start_date, end_date, quantity, rm_quantity) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String queryUpdate = "UPDATE Discounts SET discount_code = ?, name = ?, description = ?, discount_percent = ?, " +
                "max_discount_value = ?, min_discount_value = ?, start_date = ?, end_date = ?, quantity = ?, rm_quantity = ? " +
                "WHERE discount_id = ?";
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);  // Bắt đầu transaction
            PreparedStatement stmt;
            if (discountDTO.getId() == null) {
                // Thực hiện thêm mới
                stmt = conn.prepareStatement(queryInsert);
                discountDTO.setDiscountCode(this.generateDiscountCode());
                this.setDiscountValues(stmt, discountDTO);
                stmt.setInt(10, 0);
            } else {
                // Thực hiện cập nhật
                stmt = conn.prepareStatement(queryUpdate);
                this.setDiscountValues(stmt, discountDTO);
                stmt.setInt(11, discountDTO.getId()); // WHERE discount_id = ?
            }
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected == 0) {
                conn.rollback(); // Rollback nếu không có dòng nào bị ảnh hưởng
                return false;
            }
            conn.commit(); // Commit transaction
            stmt.close();
            return true; // Thành công
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }
    }

    public static String generateDiscountCode() {
        StringBuilder discountCode = new StringBuilder(8);
        SecureRandom random = new SecureRandom();
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(CHARACTERS.length());
            discountCode.append(CHARACTERS.charAt(index));
        }
        return discountCode.toString();
    }

    // Hàm để thiết lập giá trị cho PreparedStatement
    private void setDiscountValues(PreparedStatement stmt, DiscountDto discountDTO) throws SQLException {
        stmt.setString(1, discountDTO.getDiscountCode()); // discount_code
        stmt.setString(2, discountDTO.getName());         // name
        stmt.setString(3, discountDTO.getDescription());  // description
        if (discountDTO.getDiscountPercent() != null) {
            stmt.setDouble(4, discountDTO.getDiscountPercent()); // discount_percent
        } else {
            stmt.setNull(4, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getMaxDiscountValue() != null) {
            stmt.setDouble(5, discountDTO.getMaxDiscountValue()); // max_discount_value
        } else {
            stmt.setNull(5, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getMinDiscountValue() != null) {
            stmt.setDouble(6, discountDTO.getMinDiscountValue()); // min_discount_value
        } else {
            stmt.setNull(6, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getStartDate() != null) {
            stmt.setDate(7, new java.sql.Date(discountDTO.getStartDate().getTime())); // start_date
        } else {
            stmt.setNull(7, java.sql.Types.DATE);
        }
        if (discountDTO.getEndDate() != null) {
            stmt.setDate(8, new java.sql.Date(discountDTO.getEndDate().getTime())); // end_date
        } else {
            stmt.setNull(8, java.sql.Types.DATE);
        }
        if (discountDTO.getQuantity() != null) {
            stmt.setInt(9, discountDTO.getQuantity()); // quantity
        } else {
            stmt.setNull(9, java.sql.Types.INTEGER);
        }
        if (discountDTO.getRmQuantity() != null) {
            stmt.setInt(10, discountDTO.getRmQuantity()); // rm_quantity
        } else {
            stmt.setNull(10, java.sql.Types.INTEGER);
        }
    }

    public DiscountDto checkDiscountByCode(String discountCode) {
        String sql = "SELECT discount_id, discount_code, name, description, discount_percent, max_discount_value, " +
                "min_discount_value, start_date, end_date, quantity, rm_quantity " +
                "FROM Discounts WHERE discount_code = ? AND quantity > rm_quantity"; // Kiểm tra mã giảm giá với số lượng > 0

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Đặt discountCode cho tham số của câu lệnh SQL
            stm.setString(1, discountCode);

            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Trả về đối tượng DiscountDto từ dữ liệu của ResultSet
                    DiscountDto dto = new DiscountDto();
                    dto.setId(rs.getInt("discount_id"));
                    dto.setDiscountCode(rs.getString("discount_code"));
                    dto.setName(rs.getString("name"));
                    dto.setDescription(rs.getString("description"));
                    dto.setDiscountPercent(rs.getDouble("discount_percent"));
                    dto.setMaxDiscountValue(rs.getDouble("max_discount_value"));
                    dto.setMinDiscountValue(rs.getDouble("min_discount_value"));
                    dto.setStartDate(rs.getDate("start_date"));
                    dto.setEndDate(rs.getDate("end_date"));
                    dto.setQuantity(rs.getInt("quantity"));
                    dto.setRmQuantity(rs.getInt("rm_quantity"));
                    return dto;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Boolean applyDiscount(Integer discountId) {
        Connection connection = null;
        PreparedStatement statement = null;
        String updateQuery = "UPDATE Discounts SET rm_quantity = (rm_quantity + 1) WHERE discount_id = ?";
        try {
            // Obtain a database connection (assuming you have a method to do this)
            connection = DBUtil.getConnection();
            // Prepare the SQL update statement
            statement = connection.prepareStatement(updateQuery);
            statement.setInt(1, discountId);       // Set the new status
            // Execute the update
            int rowsAffected = statement.executeUpdate();
            // Check if the update was successful
            if (rowsAffected > 0) {
                System.out.println("Updated rm_quantity Discounts successfully.");
                return true;
            } else {
                System.out.println("Discounts not found.");
                return false;
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            System.out.println("Failed to update Discounts rm_quantity: " + e.getMessage());
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

}
