package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.TableDto;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TableDAO {
    @SneakyThrows
    public List<TableDto> getListTableManager(int page, int pageSize, String tableName, Integer statusId) {
        int offset = (page - 1) * pageSize;

        // Xây dựng câu lệnh SQL động dựa trên việc tableName và statusId có được cung cấp hay không
        StringBuilder sqlBuilder = new StringBuilder("SELECT x1.table_id AS tableId, x1.table_name AS tableName, x1.status, x1.capacity " +
                "FROM Tables x1 WHERE x1.is_deleted = 0 ");

        // Thêm điều kiện cho tableName và statusId nếu chúng được cung cấp
        if (tableName != null && !tableName.isEmpty()) {
            sqlBuilder.append("AND x1.table_name LIKE ? ");
        }
        if (statusId != null) {
            sqlBuilder.append("AND x1.status = ? ");
        }

        sqlBuilder.append("ORDER BY x1.table_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        // Chuẩn bị câu lệnh SQL
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sqlBuilder.toString())) {

            int paramIndex = 1;

            // Thiết lập tham số tableName nếu có
            if (tableName != null && !tableName.isEmpty()) {
                stm.setString(paramIndex++, "%" + tableName + "%");  // Sử dụng LIKE cho tableName
            }

            // Thiết lập tham số statusId nếu có
            if (statusId != null) {
                stm.setInt(paramIndex++, statusId);
            }

            // Thiết lập các tham số phân trang
            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex++, pageSize);

            // Thực thi câu lệnh và xử lý kết quả trả về
            try (ResultSet rs = stm.executeQuery()) {
                List<TableDto> list = new ArrayList<>();
                while (rs.next()) {
                    TableDto dto = new TableDto();
                    dto.setTableId(rs.getInt("tableId"));
                    dto.setTableName(rs.getString("tableName"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setCapacity(rs.getInt("capacity"));
                    list.add(dto);
                }
                return list;
            }
        }
    }


    public List<TableDto> getListAllTable() {
        String sql = "SELECT x1.table_id AS tableId, x1.table_name AS tableName, x1.status, x1.capacity " +
                "FROM Tables x1 where x1.is_deleted = 0 " +
                "ORDER BY x1.table_id DESC";
        List<TableDto> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql);
             ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                TableDto dto = new TableDto();
                dto.setTableId(rs.getInt("tableId"));         // Thiết lập ID của bàn
                dto.setTableName(rs.getString("tableName"));  // Thiết lập tên bàn
                dto.setStatus(rs.getInt("status"));           // Thiết lập trạng thái bàn
                dto.setCapacity(rs.getInt("capacity"));       // Thiết lập sức chứa bàn
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Có thể thay bằng log.error nếu bạn sử dụng framework logging
            System.out.println(e);
        }
        return list;
    }

    @SneakyThrows
    public int getTotalTableCount(String tableName, Integer statusId) {
        // Xây dựng câu lệnh SQL động
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(table_id) AS total FROM Tables WHERE is_deleted = 0");
        // Thêm điều kiện cho tableName và statusId nếu chúng được cung cấp
        if (tableName != null && !tableName.isEmpty()) {
            queryBuilder.append(" AND table_name LIKE ?");
        }
        if (statusId != null) {
            queryBuilder.append(" AND status = ?");
        }
        // Chuẩn bị câu lệnh SQL
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(queryBuilder.toString())) {
            int paramIndex = 1;
            // Thiết lập tham số tableName nếu có
            if (tableName != null && !tableName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + tableName + "%");  // Sử dụng LIKE cho tableName
            }
            // Thiết lập tham số statusId nếu có
            if (statusId != null) {
                stmt.setInt(paramIndex++, statusId);
            }
            // Thực thi câu lệnh và lấy kết quả
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");  // Trả về tổng số bàn
                }
            }
        }
        return 0;
    }

    public void updateStatusTable(Integer tableId, Integer status) {
        String queryUpdate = "update Tables set status = ? where table_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Giả định rằng bạn có một phương thức để lấy kết nối cơ sở dữ liệu
            conn = DBUtil.getConnection();
            // Tạo PreparedStatement với câu truy vấn
            pstmt = conn.prepareStatement(queryUpdate);
            // Gán giá trị cho từng tham số trong câu truy vấn
            pstmt.setInt(1, status);
            pstmt.setInt(2, tableId);
            // Thực hiện câu truy vấn cập nhật
            int rowsUpdated = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi cập nhật trạng thái bảng: " + e.getMessage());
        } finally {
            // Đóng PreparedStatement và Connection để giải phóng tài nguyên
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @SneakyThrows
    public Boolean insertOrUpdateTable(TableDto tableDTO) {
        String queryInsert = "INSERT INTO Tables (table_name, status, capacity) VALUES (?, ?, ?)";
        String queryUpdate = "UPDATE Tables SET table_name = ?, status = ?, capacity = ? WHERE table_id = ?";
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);  // Bắt đầu transaction
            PreparedStatement stmt;

            if (tableDTO.getTableId() == null) {
                // Thực hiện thêm mới
                stmt = conn.prepareStatement(queryInsert);
                stmt.setString(1, tableDTO.getTableName());
                stmt.setInt(2, tableDTO.getStatus());
                stmt.setInt(3, tableDTO.getCapacity());
            } else {
                // Thực hiện cập nhật
                stmt = conn.prepareStatement(queryUpdate);
                stmt.setString(1, tableDTO.getTableName());
                stmt.setInt(2, tableDTO.getStatus());
                stmt.setInt(3, tableDTO.getCapacity());
                stmt.setInt(4, tableDTO.getTableId());
            }

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                conn.rollback();  // Rollback nếu không có dòng nào bị ảnh hưởng
                return false;
            }

            conn.commit();  // Commit transaction nếu thành công
            stmt.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @SneakyThrows
    public TableDto getTableDetail(Integer tableId) {
        String sql = "SELECT x1.table_id AS tableId, x1.table_name AS tableName, x1.status, x1.capacity " +
                "FROM Tables x1 WHERE x1.table_id = ? and x1.is_deleted = 0 ";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, tableId);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    TableDto dto = new TableDto();
                    dto.setTableId(rs.getInt("tableId"));
                    dto.setTableName(rs.getString("tableName"));
                    dto.setStatus(rs.getInt("status"));
                    dto.setCapacity(rs.getInt("capacity"));
                    return dto;
                }
            }
        }
        return null;
    }

    public Boolean markTableAsDeleted(int tableId) {
        String sql = "update Tables set is_deleted = 1 where table_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Thiết lập giá trị cho tham số `category_id`
            pstmt.setInt(1, tableId);
            // Thực hiện truy vấn cập nhật
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật thành công, tableId = " + tableId + " đã được đánh dấu là bị xóa.");
                return true;
            } else {
                System.out.println("Không tìm thấy table với tableId = " + tableId);
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi cập nhật dữ liệu: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
