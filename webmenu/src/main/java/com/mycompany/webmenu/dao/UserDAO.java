package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.common.AbstractDAO;
import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.DBUtil;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

    @SneakyThrows
    public List<UserDTO> getListCategoryManager(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.user_id, x1.email, x1.phone, x1.address, x1.avatar FROM Users x1 " +
                "ORDER BY x1.user_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<UserDTO> list = new ArrayList<>();
        // Use try-with-resources to ensure the connection and statement are closed
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Set the parameters for the PreparedStatement
            stm.setInt(1, offset);
            stm.setInt(2, pageSize);
            // Execute the query
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    UserDTO dto = new UserDTO();
                    dto.setUserID(rs.getInt("user_id"));
                    dto.setEmail(rs.getString("email"));
                    dto.setPhone(rs.getString("phone"));
                    dto.setAddress(rs.getString("address"));
                    dto.setAvatarUrl(rs.getString("avatar"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error for debugging
        }
        return list;
    }

    @SneakyThrows
    public int getTotalUserCount() {
        String query = "select count(user_id) as total from Users";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }

    public ArrayList<UserDTO> getAll() throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT "
                + "user_id\n"
                + "      ,ward_id\n"
                + "      ,role_id\n"
                + "      ,email\n"
                + "      ,phone\n"
                + "      ,yob\n"
                + "      ,address\n"
                + "      ,avatar\n"
                + "      ,username\n"
                + "  FROM Users ");
        ResultSet rs = stm.executeQuery();
        ArrayList<UserDTO> list = new ArrayList<>();
        while (rs.next()) {
            UserDTO u = new UserDTO();
            u.setUserID(rs.getInt("user_id"));
            u.setWardID(rs.getString("ward_id"));
            u.setRoleID(rs.getInt("role_id"));
            u.setEmail(rs.getString("email"));
            String phone = rs.getString("phone");
            if (phone != null) {
                phone = phone.trim();
            }
            u.setPhone(phone);
            u.setYob(rs.getDate("yob"));
            u.setAddress(rs.getString("address"));
            u.setAvatarUrl(rs.getString("avatar"));
            u.setUsername(rs.getString("username"));
            list.add(u);
        }
        rs.close();
        stm.close();
        return list;
    }

    @SneakyThrows
    public UserDTO login(String email) {
        String sql = "SELECT user_id, email, phone, address, avatar,username FROM Users WHERE email = ?";
        // Sử dụng try-with-resources để tự động đóng các tài nguyên sau khi kết thúc
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Thiết lập giá trị cho câu lệnh SQL
            stm.setString(1, email);
            // Thực thi câu lệnh và xử lý kết quả
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserID(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar"));
                user.setUsername(rs.getString("username"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("login err " + e);
        }
        return null;
    }

    //
    public UserDTO insertNewUser(String email, String imageUrl, String username) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT into Users ( role_id ,email  ,avatar,username)"
                + " values (?,?,?,?)");

        stm.setInt(1, 2);
        stm.setString(2, email);
        stm.setString(3, imageUrl);
        stm.setString(4, username);
        stm.executeUpdate();

        UserDTO dto = new UserDTO();
        dto.setAvatarUrl(imageUrl);
        dto.setEmail(email);
        dto.setUsername(username);

        stm.close();
        return dto;

    }

    public void updateProfile(String email, String username, String phone, String avatarURL) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("update Users \n"
                + "  set phone = ?,username=?, avatar=? where email = ?");
        stm.setString(1, phone);
        stm.setString(2, username);
        stm.setString(3, avatarURL);
        stm.setString(4, email);
        stm.executeUpdate();
        stm.close();
    }

    public void updateWardAndAddress(String email, String wardID, String address) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("update Users \n"
                + "  set ward_id = ?,address=? where email = ?");
        stm.setString(1, wardID);
        stm.setString(2, address);
        stm.setString(3, email);
        stm.executeUpdate();
        stm.close();
    }

    public UserDTO get(int id) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT "
                + "user_id \n"
                + "      ,ward_id \n"
                + "      ,role_id \n"
                + "      ,email \n"
                + "      ,phone \n"
                + "      ,yob \n"
                + "      ,address \n"
                + "      ,avatar \n"
                + "      ,username \n"
                + "  FROM Users \n"
                + " where user_id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        UserDTO u = new UserDTO();
        if (rs.next()) {
            u.setUserID(rs.getInt("user_id"));
            u.setWardID(rs.getString("ward_id"));
            u.setRoleID(rs.getInt("role_id"));
            u.setEmail(rs.getString("email"));
            String phone = rs.getString("phone");
            if (phone != null) {
                phone = phone.trim();
            }
            u.setPhone(phone);
            u.setYob(rs.getDate("yob"));
            u.setAddress(rs.getString("address"));
            u.setAvatarUrl(rs.getString("avatar"));
            u.setUsername(rs.getString("username"));

        }
        rs.close();
        stm.close();
        return u;
    }

}
