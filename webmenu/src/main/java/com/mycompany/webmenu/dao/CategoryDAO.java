package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.CategoryDto;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    @SneakyThrows
    public List<CategoryDto> getListAllCategory() {
        String sql = "SELECT category_id, name,description FROM Categories where is_deleted = 0";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        List<CategoryDto> list = new ArrayList<>();
        while (rs.next()) {
            CategoryDto dto = new CategoryDto();
            dto.setCategoryId(rs.getInt("category_id"));  // Thiết lập ID danh mục
            dto.setName(rs.getString("name"));            // Thiết lập tên danh mục
            dto.setDescription(rs.getString("description"));            // Thiết lập mô tả danh mục sản phẩm
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    @SneakyThrows
    public List<CategoryDto> getListCategoryManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.category_id AS categoryId, x1.name AS categoryName, x1.description AS categoryDescription " +
                "FROM Categories x1 where x1.is_deleted = 0" +
                "ORDER BY x1.category_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, offset);
        stm.setInt(2, pageSize);
        try (ResultSet rs = stm.executeQuery()) {
            List<CategoryDto> list = new ArrayList<>();
            while (rs.next()) {
                CategoryDto dto = new CategoryDto();
                dto.setCategoryId(rs.getInt("categoryId"));               // Thiết lập ID danh mục
                dto.setName(rs.getString("categoryName"));                // Thiết lập tên danh mục
                dto.setDescription(rs.getString("categoryDescription"));  // Thiết lập mô tả danh mục
                list.add(dto);
            }
            return list;
        }
    }

    @SneakyThrows
    public CategoryDto getCategoryDetail(Integer categoryId) {
        String sql = "SELECT x1.category_id AS categoryId, x1.name AS categoryName, x1.description AS categoryDescription " +
                "FROM Categories x1 WHERE x1.category_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, categoryId);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    return CategoryDto.builder()
                            .categoryId(rs.getInt("categoryId"))
                            .name(rs.getString("categoryName"))
                            .description(rs.getString("categoryDescription"))
                            .build();
                }
            }
        }
        return null;
    }

    @SneakyThrows
    public int getTotalCategoryCount() {
        String query = "SELECT COUNT(category_id) AS total FROM Categories where is_deleted = 0";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");  // Trả về tổng số danh mục
            }
        }
        return 0;
    }

    @SneakyThrows
    public Boolean insertCategory(CategoryDto categoryDto) {
        String queryInsert = "INSERT INTO Categories (name, description) VALUES (?, ?)";
        String queryUpdate = "UPDATE Categories SET name = ?, description = ? WHERE category_id = ?";
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);  // Bắt đầu transaction
            PreparedStatement stmt;
            if (categoryDto.getCategoryId() == null) {
                // Thực hiện thêm mới
                stmt = conn.prepareStatement(queryInsert);
                stmt.setString(1, categoryDto.getName());
                stmt.setString(2, categoryDto.getDescription());
            } else {
                // Thực hiện cập nhật
                stmt = conn.prepareStatement(queryUpdate);
                stmt.setString(1, categoryDto.getName());
                stmt.setString(2, categoryDto.getDescription());
                stmt.setInt(3, categoryDto.getCategoryId());
            }
            int categoryRowsAffected = stmt.executeUpdate();
            if (categoryRowsAffected == 0) {
                conn.rollback(); // Rollback nếu không có dòng nào bị ảnh hưởng
                return false;
            }
            conn.commit(); // Commit transaction nếu thành công
            stmt.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Boolean markCategoryAsDeleted(int categoryId) {
        String sql = "UPDATE Categories SET is_deleted = 1 WHERE category_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Thiết lập giá trị cho tham số `category_id`
            pstmt.setInt(1, categoryId);
            // Thực hiện truy vấn cập nhật
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật thành công, category_id = " + categoryId + " đã được đánh dấu là bị xóa.");
                return true;
            } else {
                System.out.println("Không tìm thấy category với category_id = " + categoryId);
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi cập nhật dữ liệu: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
