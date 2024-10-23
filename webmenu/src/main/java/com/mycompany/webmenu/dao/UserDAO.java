package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.Constants;
import com.mycompany.webmenu.utils.DBUtil;
import com.mycompany.webmenu.utils.RoleUserType;
import lombok.SneakyThrows;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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
        String sql = "SELECT user_id, email, phone, address, avatar,username,role_id,full_name FROM Users WHERE email = ?";
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
                user.setRoleID(rs.getInt("role_id"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setAvatarUrl(rs.getString("avatar"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
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
        stm.setInt(1, RoleUserType.USER.getId());
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
        Boolean isUpdate = staff.getUserID() != null ? true : false;

        if (isUpdate) {
            // Truy vấn cập nhật
            query = "UPDATE Users SET role_id = ?, email = ?, username = ?, full_name = ?, phone = ?, address = ? WHERE user_id = ?";
        } else {
            // Truy vấn thêm mới
            query = "INSERT INTO Users (role_id, email, username, full_name, phone, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        }

        // Bắt đầu giao dịch
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false); // Tắt chế độ auto-commit để điều khiển giao dịch thủ công

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                // Thiết lập các giá trị chung cho cả cập nhật và thêm mới
                stmt.setInt(1, RoleUserType.STAFF.getId());  // role_id
                stmt.setString(2, staff.getEmail());  // email
                stmt.setString(3, staff.getUsername());  // username
                stmt.setString(4, staff.getFullName());  // full_name
                stmt.setString(5, staff.getPhone());  // phone
                stmt.setString(6, staff.getAddress());  // address

                if (isUpdate) {
                    // Nếu là cập nhật, thiết lập giá trị cho userID (tham số cuối cùng)
                    stmt.setInt(7, staff.getUserID());
                } else {
                    // Nếu là thêm mới, tạo và hash mật khẩu
                    String generatedPassword = this.generatePassword(8);
                    stmt.setString(7, generatedPassword);

                    // Chưa gửi email ở đây, chờ lưu thành công trước
                    staff.setPassword(generatedPassword); // Lưu mật khẩu chưa mã hóa để gửi email sau
                }

                // Thực thi truy vấn
                int affectedRows = stmt.executeUpdate();
                if (affectedRows > 0) {
                    conn.commit(); // Chỉ commit nếu lưu vào DB thành công

                    // Nếu thành công và thêm mới, gửi email
                    if (!isUpdate) {
                        sendEmail(staff);
                    }
                    return true;
                } else {
                    conn.rollback(); // Rollback nếu không có dòng nào bị ảnh hưởng
                    return false;
                }
            } catch (Exception e) {
                conn.rollback(); // Rollback tất cả các thay đổi nếu có bất kỳ lỗi nào xảy ra
                e.printStackTrace();
                throw new SQLException("Lỗi khi lưu thông tin nhân viên: " + e.getMessage(), e);
            }
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

    // Hàm gửi email
    public void sendEmail(UserDTO staff) {
        // Email người gửi
        String senderEmail = Constants.SENDER_EMAIL;  // Email người gửi
        String senderPassword = Constants.SENDER_PASSWORD;      // Mật khẩu email người gửi
        // Cấu hình thuộc tính email (SMTP server)
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        // Tạo session với thông tin xác thực
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });
        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);
            // Cài đặt thông tin cho email
            message.setFrom(new InternetAddress(senderEmail));                // Địa chỉ người gửi
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(staff.getEmail())); // Địa chỉ người nhận
            message.setSubject("Thông Báo Tạo Tài Khoản", "utf-8");                                      // Tiêu đề email

            // Nội dung HTML cho email
            String content = "<h3>Xin chào " + staff.getFullName() + ",</h3>"
                    + "<p>Bạn đã được tạo một tài khoản. Dưới đây là thông tin đăng nhập của bạn:</p>"
                    + "<p><strong>Tên đăng nhập: </strong>" + staff.getEmail() + "</p>"
                    + "<p><strong>Mật khẩu: </strong>" + staff.getPassword() + "</p>"
                    + "<p>Vui lòng đăng nhập và thay đổi mật khẩu của bạn sau khi đăng nhập lần đầu.</p>"
                    + "<br><p>Trân trọng,</p>"
                    + "<p>Đội ngũ quản lý</p>";

            // Cài đặt nội dung email với định dạng HTML
            message.setContent(content, "text/html; charset=UTF-8");
            message.setText(content, "utf-8", "html");                                         // Nội dung email
            // Gửi email
            Transport.send(message);
            System.out.println("Email đã được gửi thành công!");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Gửi email thất bại.");
        }
    }

    public void forgotPassword(String email) {
        UserDTO staff = this.login(email);
        System.out.println("staff " + staff);
        final String user = "anhndph09827@fpt.edu.vn";
        final String pass = "osas qszb tcic rzer";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        //
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        // đăng nhập được email
        String emailTo = staff.getEmail();//mail nhận
        String emailSubject = "Thông Báo Quân Mật Khẩu";//tiêu đề
        String token = UUID.randomUUID().toString();
        String resetLink = "http://localhost:8080/webmenu/ForgotPasswordController?token=" + token;
        // Nội dung HTML cho email
        String emailContent = "<h3>Xin chào " + staff.getFullName() + ",</h3>"
                + "<p>Vui lòng truy cập vào link dưới đây để đặt lại mật khẩu của bạn:</p>"
                + "<p><a href='" + resetLink + "'>Đặt lại mật khẩu</a></p>";
        try {
            MimeMessage messge = new MimeMessage(session);
            messge.setFrom(new InternetAddress(user));
            messge.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            messge.setSubject(emailSubject);
            messge.setText(emailContent, "utf-8", "html");
            messge.setReplyTo(messge.getFrom());
            Transport.send(messge);
            this.updateTokenResetPassword(staff.getUserID(), token);
            System.out.println("Gửi email thành công.");
        } catch (Exception e) {
            System.out.println("Gửi email thất bại.");
            System.err.println(e);
        }
    }

    public void resetPassword(Integer userId, String password) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("update Users set password = ? where user_id = ?");
        stm.setString(1, password);
        stm.setInt(2, userId);
        stm.executeUpdate();
        stm.close();
    }

    public void updateTokenResetPassword(Integer userId, String token) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("update Users set token_reset_password = ? where user_id = ?");
        stm.setString(1, token);
        stm.setInt(2, userId);
        stm.executeUpdate();
        stm.close();
    }

    @SneakyThrows
    public UserDTO getUserByToken(String token) {
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
                + " where token_reset_password = ?");
        stm.setString(1, token);
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

}
