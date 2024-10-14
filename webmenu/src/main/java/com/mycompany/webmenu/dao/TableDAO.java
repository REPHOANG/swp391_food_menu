package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.TableDTO;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TableDAO {
    @SneakyThrows
    public List<TableDTO> getListTableManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "select x1.table_id as tableId,x1.table_name as tableName,status,capacity from Tables x1 \n" +
                "ORDER BY x1.table_id desc \n" +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, offset);
        stm.setInt(2, pageSize);
        try (ResultSet rs = stm.executeQuery()) {
            List<TableDTO> list = new ArrayList<>();
            while (rs.next()) {
                TableDTO dto = new TableDTO();
                dto.setTableId(rs.getInt("tableId"));
                dto.setTableName(rs.getString("tableName"));
                dto.setStatus(rs.getString("status"));
                dto.setCapacity(rs.getInt("capacity"));
                list.add(dto);
            }
            return list;
        }
    }

    @SneakyThrows
    public int getTotalTableCount() {
        String query = "select count(table_id) as total from Tables";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    @SneakyThrows
    public Boolean insertOrUpdateTable(TableDTO tableDTO) {
        String queryInsert = "INSERT INTO Tables (table_name, status, capacity) VALUES (?, ?, ?)";
        String queryUpdate = "UPDATE Tables SET table_name = ?, status = ?, capacity = ? WHERE table_id = ?";
        Connection conn = DBUtil.getConnection();  // Kết nối tới cơ sở dữ liệu
        PreparedStatement stmt = null;
        conn.setAutoCommit(false);  // Bắt đầu transaction
        if (tableDTO.getTableId() == null) {
            // Thêm mới bàn (Insert operation)
            stmt = conn.prepareStatement(queryInsert);
            stmt.setString(1, tableDTO.getTableName());
            stmt.setString(2, tableDTO.getStatus());
            stmt.setInt(3, tableDTO.getCapacity());
        } else {
            // Cập nhật bàn (Update operation)
            stmt = conn.prepareStatement(queryUpdate);
            stmt.setString(1, tableDTO.getTableName());
            stmt.setString(2, tableDTO.getStatus());
            stmt.setInt(3, tableDTO.getCapacity());
            stmt.setInt(4, tableDTO.getTableId());
        }
        int rowsAffected = stmt.executeUpdate();
        conn.commit();
        if (rowsAffected == 0) {
            conn.rollback();  // Rollback nếu không có dòng nào bị ảnh hưởng
            return false;
        }
        stmt.close();
        conn.close();
        return true;  // Thành công
    }

    @SneakyThrows
    public TableDTO getTableDetail(Integer tableId) {
        String sql = "select x1.table_id as tableId,x1.table_name as tableName,status,capacity from Tables x1 where x1.table_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(sql);
        stm.setInt(1, tableId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            TableDTO dto = new TableDTO();
            dto.setTableId(rs.getInt("tableId"));
            dto.setTableName(rs.getString("tableName"));
            dto.setStatus(rs.getString("status"));
            dto.setCapacity(rs.getInt("capacity"));
            return dto;
        }
        return null;
    }

}
