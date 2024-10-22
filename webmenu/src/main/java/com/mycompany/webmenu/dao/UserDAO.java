package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.DBUtil;
import com.mycompany.webmenu.utils.RoleUserType;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class UserDAO {

    @SneakyThrows
    public List<UserDTO> getListCategoryManager(int page, int pageSize, int roleId) {
        int offset = (page - 1) * pageSize;
        String sql = "SELECT x1.user_id,x1.username ,x1.email, x1.phone, x1.address, x1.avatar,x1.full_name FROM Users x1 " +
                "where x1.role_id = ? " +
                "ORDER BY x1.user_id DESC " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<UserDTO> list = new ArrayList<>();
        // Use try-with-resources to ensure the connection and statement are closed
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Set the parameters for the PreparedStatement
            stm.setInt(1, roleId);
            stm.setInt(2, offset);
            stm.setInt(3, pageSize);
            // Execute the query
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    UserDTO dto = new UserDTO();
                    dto.setUserID(rs.getInt("user_id"));
                    dto.setEmail(rs.getString("email"));
                    dto.setPhone(rs.getString("phone"));
                    dto.setAddress(rs.getString("address"));
                    dto.setAvatarUrl(rs.getString("avatar"));
                    dto.setUsername(rs.getString("username"));
                    dto.setFullName(rs.getString("full_name"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error for debugging
        }
        return list;
    }

    @SneakyThrows
    public int getTotalUserCount(int roleId) {
        String query = "select count(user_id) as total from Users where role_id = ?";
        Connection conn = DBUtil.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, roleId);
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
        PreparedStatement stm = conn.prepareStatement("INSERT into Users (role_id,email,avatar,username)"
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

    @SneakyThrows
    public UserDTO signUpUser(String email, String username, String password) {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO dto = null;
        try {
            // Kết nối tới cơ sở dữ liệu
            conn = DBUtil.getConnection();
            // Câu lệnh SQL để thêm người dùng mới, sử dụng `RETURN_GENERATED_KEYS` để lấy ID vừa được tạo
            String sql = "INSERT INTO Users (role_id, email, username, password) VALUES (?, ?, ?, ?)";
            // Chuẩn bị câu lệnh và chỉ định rằng chúng ta muốn lấy về các khóa được tạo ra (generated keys)
            stm = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stm.setInt(1, 2); // role_id = 2 (giả định đây là role người dùng)
            stm.setString(2, email);
            stm.setString(3, username);
            stm.setString(4, password); // Lưu mật khẩu đã mã hóa
            // Thực thi câu lệnh
            int affectedRows = stm.executeUpdate();
            if (affectedRows == 0) {
                return null;
            }
            // Lấy khóa chính (ID) vừa được tạo
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                // Sau khi thêm thành công, tạo đối tượng DTO và thiết lập ID
                dto = new UserDTO();
                dto.setUserID(rs.getInt(1)); // Lấy ID của người dùng vừa thêm
                dto.setEmail(email);
                dto.setUsername(username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            // Đảm bảo luôn đóng ResultSet, statement và connection để tránh rò rỉ tài nguyên
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        System.out.println("dto " + dto);
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

    @SneakyThrows
    public UserDTO getUserById(Integer id) {
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
                + "      ,full_name \n"
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
            u.setFullName(rs.getString("full_name"));

        }
        rs.close();
        stm.close();
        return u;
    }

    public UserDTO loginAdmin(String username, String password) {
        String sql = "SELECT user_id,role_id, email, phone, address, avatar,username, password FROM Users WHERE email = ? and password = ?";
        // Sử dụng try-with-resources để tự động đóng các tài nguyên sau khi kết thúc
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            // Thiết lập giá trị cho câu lệnh SQL
            stm.setString(1, username);
            stm.setString(2, password);
            // Thực thi câu lệnh và xử lý kết quả
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserID(rs.getInt("user_id"));
                user.setRoleID(rs.getInt("role_id"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("login err " + e);
        }
        return null;
    }

    public Boolean saveOrUpdateStaff(UserDTO staff) throws SQLException {
        String query;
        // Kiểm tra nếu userID đã tồn tại (cập nhật), nếu không thì thêm mới
        if (staff.getUserID() != null) {
            // Truy vấn cập nhật
            query = "UPDATE Users SET role_id = ?, email = ?, username = ?, full_name = ?, phone = ?, address = ? WHERE user_id = ?";
        } else {
            // Truy vấn thêm mới
            query = "INSERT INTO Users (role_id, email, username, full_name, phone, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        }
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            // Thiết lập các giá trị chung cho cả cập nhật và thêm mới
            stmt.setInt(1, RoleUserType.STAFF.getId());  // role_id
            stmt.setString(2, staff.getEmail());  // email
            stmt.setString(3, staff.getUsername());  // username
            stmt.setString(4, staff.getFullName());  // full_name
            stmt.setString(5, staff.getPhone());  // phone
            stmt.setString(6, staff.getAddress());  // address
            if (staff.getUserID() != null) {
                // Nếu là cập nhật, thiết lập giá trị cho userID (tham số cuối cùng)
                stmt.setInt(7, staff.getUserID());
            } else {
                // Nếu là thêm mới, thiết lập mật khẩu
                stmt.setString(7, generatePassword(8));  // password
            }
            // Thực thi truy vấn
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0; // Nếu thêm hoặc cập nhật thành công thì trả về true
        }
    }


    public static String generatePassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
        Random random = new Random();
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            password.append(chars.charAt(index));
        }
        return password.toString();
    }

    // Cập nhật mật khẩu mới cho người dùng
    public Boolean updatePassword(int userId, String newPassword) throws SQLException {
        String query = "UPDATE Users SET password = ? WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newPassword); // Nên mã hóa mật khẩu nếu cần
            stmt.setInt(2, userId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Nếu cập nhật thành công
        }
    }
}
