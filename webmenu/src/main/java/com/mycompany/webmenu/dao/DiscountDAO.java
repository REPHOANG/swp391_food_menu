package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.DiscountDTO;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountDAO {

    @SneakyThrows
    public List<DiscountDTO> getListDiscountManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT id, name, description, discount_percent, max_discount_value, min_discount_value, start_date," +
                "end_date, quantity, rm_quantity, status, created_at, updated_at " +
                "from discount x1 \n" +
                "order by x1.id desc \n" +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, offset);
        stm.setInt(2, pageSize);
        try (ResultSet rs = stm.executeQuery()) {
            List<DiscountDTO> list = new ArrayList<>();
            while (rs.next()) {
                DiscountDTO dto = DiscountDTO.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .description(rs.getString("description"))
                        .discountPercent(rs.getDouble("discount_percent"))
                        .maxDiscountValue(rs.getDouble("max_discount_value"))
                        .minDiscountValue(rs.getDouble("min_discount_value"))
                        .startDate(rs.getDate("start_date"))
                        .endDate(rs.getDate("end_date"))
                        .quantity(rs.getInt("quantity"))
                        .rmQuantity(rs.getInt("rm_quantity"))
                        .build();
                list.add(dto);
            }
            return list;
        }
    }

    @SneakyThrows
    public int getTotalDiscountCount() {
        String query = "select count(id) as total from discount";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public DiscountDTO getDiscountDetail(Integer discountId) {
        String sql = "SELECT id, name, description, discount_percent, max_discount_value, min_discount_value, start_date," +
                " end_date, quantity, rm_quantity, status, created_at, updated_at " +
                "FROM discount WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setLong(1, discountId);  // Sử dụng setLong vì id là kiểu BIGINT trong cơ sở dữ liệu
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    // Trả về đối tượng DiscountDTO từ dữ liệu của ResultSet
                    return DiscountDTO.builder()
                            .id(rs.getInt("id"))
                            .name(rs.getString("name"))
                            .description(rs.getString("description"))
                            .discountPercent(rs.getDouble("discount_percent"))
                            .maxDiscountValue(rs.getDouble("max_discount_value"))
                            .minDiscountValue(rs.getDouble("min_discount_value"))
                            .startDate(rs.getDate("start_date"))
                            .endDate(rs.getDate("end_date"))
                            .quantity(rs.getInt("quantity"))
                            .rmQuantity(rs.getInt("rm_quantity"))
                            .build();
                }
            }
        }
        return null;  // Trả về null nếu không tìm thấy bản ghi nào
    }


    @SneakyThrows
    public Boolean insertOrUpdateDiscount(DiscountDTO discountDTO) {
        String queryInsert = "INSERT INTO discount (name, description, discount_percent, max_discount_value, " +
                "min_discount_value, start_date, end_date, quantity, rm_quantity) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String queryUpdate = "UPDATE discount SET name = ?, description = ?, discount_percent = ?, max_discount_value = ?, " +
                "min_discount_value = ?, start_date = ?, end_date = ?, quantity = ?, rm_quantity = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);  // Bắt đầu transaction
            PreparedStatement stmt;
            if (discountDTO.getId() == null) {
                // Insert operation
                stmt = conn.prepareStatement(queryInsert);
                setDiscountValues(stmt, discountDTO);
            } else {
                // Update operation
                stmt = conn.prepareStatement(queryUpdate);
                setDiscountValues(stmt, discountDTO);
                stmt.setInt(10, discountDTO.getId()); // WHERE id = ?
            }
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected == 0) {
                conn.rollback(); // Rollback nếu không có dòng nào bị ảnh hưởng
                return false;
            }
            conn.commit(); // Commit transaction
            stmt.close();
            return true; // Success
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hàm để thiết lập giá trị cho PreparedStatement
    private void setDiscountValues(PreparedStatement stmt, DiscountDTO discountDTO) throws SQLException {
        stmt.setString(1, discountDTO.getName());
        stmt.setString(2, discountDTO.getDescription());
        if (discountDTO.getDiscountPercent() != null) {
            stmt.setDouble(3, discountDTO.getDiscountPercent());
        } else {
            stmt.setNull(3, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getMaxDiscountValue() != null) {
            stmt.setDouble(4, discountDTO.getMaxDiscountValue());
        } else {
            stmt.setNull(4, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getMinDiscountValue() != null) {
            stmt.setDouble(5, discountDTO.getMinDiscountValue());
        } else {
            stmt.setNull(5, java.sql.Types.DOUBLE);
        }
        if (discountDTO.getStartDate() != null) {
            stmt.setDate(6, new java.sql.Date(discountDTO.getStartDate().getTime()));
        } else {
            stmt.setNull(6, java.sql.Types.DATE);
        }
        if (discountDTO.getEndDate() != null) {
            stmt.setDate(7, new java.sql.Date(discountDTO.getEndDate().getTime()));
        } else {
            stmt.setNull(7, java.sql.Types.DATE);
        }
        if (discountDTO.getQuantity() != null) {
            stmt.setInt(8, discountDTO.getQuantity());
        } else {
            stmt.setNull(8, java.sql.Types.INTEGER);
        }
        if (discountDTO.getRmQuantity() != null) {
            stmt.setInt(9, discountDTO.getRmQuantity());
        } else {
            stmt.setNull(9, java.sql.Types.INTEGER);
        }
    }


}
