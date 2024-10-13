package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.CategoryDto;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    @SneakyThrows
    public List<CategoryDto> getListAllCategory() {
        String sql = "select category_id,name from Category";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();
        ArrayList<CategoryDto> list = new ArrayList<>();
        while (rs.next()) {
            CategoryDto dto = new CategoryDto();
            dto.setCategoryId(rs.getInt("category_id"));
            dto.setName(rs.getString("name"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    @SneakyThrows
    public List<CategoryDto> getListCategoryManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "select x1.category_id as categoryId,x1.name as categoryName from Category x1 \n" +
                "ORDER BY x1.category_id desc \n" +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, offset);
        stm.setInt(2, pageSize);
        try (ResultSet rs = stm.executeQuery()) {
            List<CategoryDto> list = new ArrayList<>();
            while (rs.next()) {
                CategoryDto dto = new CategoryDto();
                dto.setCategoryId(rs.getInt("categoryId"));
                dto.setName(rs.getString("categoryName"));
                list.add(dto);
            }
            return list;
        }
    }

    @SneakyThrows
    public CategoryDto getCategoryDetail(Integer categoryId) {
        String sql = "select x1.category_id as categoryId,x1.name as categoryName from Category x1 where x1.category_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, categoryId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return CategoryDto.builder()
                    .categoryId(rs.getInt("categoryId"))
                    .name(rs.getString("categoryName"))
                    .build();
        }
        return null;
    }

    @SneakyThrows
    public int getTotalCategoryCount() {
        String query = "select count(category_id) as total from Category";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public Boolean insertCategory(CategoryDto categoryDto) {
        String queryInsert = "INSERT INTO Category (name) VALUES (?)";
        String queryUpdate = "UPDATE Category SET name = ? WHERE category_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = null;
        conn.setAutoCommit(false);  // Bắt đầu transaction
        if (categoryDto.getCategoryId() == null) {
            // Insert operation
            stmt = conn.prepareStatement(queryInsert);
            stmt.setString(1, categoryDto.getName());
        } else {
            // Update operation
            stmt = conn.prepareStatement(queryUpdate);
            stmt.setString(1, categoryDto.getName());
            stmt.setInt(2, categoryDto.getCategoryId());
        }
        int categoryRowsAffected = stmt.executeUpdate();
        conn.commit();
        if (categoryRowsAffected == 0) {
            conn.rollback(); // Rollback nếu có lỗi
            return false;
        }
        stmt.close();
        conn.close();
        return true; // Success
    }

}
