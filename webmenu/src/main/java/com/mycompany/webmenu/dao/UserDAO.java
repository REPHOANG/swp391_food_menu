package com.mycompany.webmenu.dao;

import com.mycompany.webmenu.dto.UserDto;
import com.mycompany.webmenu.utils.Constants;
import com.mycompany.webmenu.utils.DBUtil;
import com.mycompany.webmenu.enums.RoleUserType;
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
    public List<UserDto> getListUserManager(int page, int pageSize, int roleId, String email) {
        int offset = (page - 1) * pageSize;
        // Xây dựng câu truy vấn SQL động dựa trên giá trị của `email`
        StringBuilder sql = new StringBuilder("SELECT x1.user_id, x1.email, x1.phone, x1.address, x1.avatar_url AS avatarUrl, x1.full_name AS fullName, x1.accumulated_points as accumulatedPoints "
                + "FROM Users x1 "
                + "WHERE x1.role_id = ? ");

        if (email != null && !email.isEmpty()) {
            sql.append("AND x1.email LIKE ? ");
        }
        sql.append("ORDER BY x1.user_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        List<UserDto> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql.toString())) {
            // Thiết lập các tham số cho PreparedStatement
            int paramIndex = 1;
            stm.setInt(paramIndex++, roleId);
            if (email != null && !email.isEmpty()) {
                stm.setString(paramIndex++, "%" + email + "%"); // Thêm ký tự đại diện cho tìm kiếm mờ
            }
            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex, pageSize);
            // Thực thi truy vấn và xử lý kết quả
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    UserDto dto = new UserDto();
                    dto.setUserId(rs.getInt("user_id"));
                    dto.setEmail(rs.getString("email"));
                    dto.setPhone(rs.getString("phone"));
                    dto.setAddress(rs.getString("address"));
                    dto.setAvatarUrl(rs.getString("avatarUrl"));
                    dto.setFullName(rs.getString("fullName"));
                    dto.setAccumulatedPoints(rs.getDouble("accumulatedPoints"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi để dễ dàng debug
        }
        return list;
    }

    @SneakyThrows
    public int getTotalUserCount(int roleId, String email) {
        // Xây dựng câu truy vấn động
        StringBuilder query = new StringBuilder("SELECT COUNT(user_id) AS total FROM Users WHERE role_id = ?");
        // Thêm điều kiện cho email nếu có
        if (email != null && !email.isEmpty()) {
            query.append(" AND email LIKE ?");
        }
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            // Thiết lập các tham số cho PreparedStatement
            int paramIndex = 1;
            stmt.setInt(paramIndex++, roleId);
            // Thêm email vào tham số nếu có giá trị
            if (email != null && !email.isEmpty()) {
                stmt.setString(paramIndex, "%" + email + "%"); // Tìm kiếm mờ với ký tự đại diện
            }
            // Thực thi truy vấn và xử lý kết quả
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total"); // Trả về tổng số người dùng
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi để dễ dàng debug
        }
        return 0; // Trả về 0 nếu không có người dùng hoặc có lỗi
    }

    public ArrayList<UserDto> getAll() throws SQLException {
        String sql = "SELECT user_id, role_id, email, phone, birth_date AS birthDate, address, avatar_url AS avatarUrl, full_name AS fullName, accumulated_points as accumulatedPoints"
                + "FROM Users";
        ArrayList<UserDto> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                UserDto u = new UserDto();
                u.setUserId(rs.getInt("user_id"));
                u.setRoleId(rs.getInt("role_id"));
                u.setEmail(rs.getString("email"));
                // Kiểm tra và loại bỏ khoảng trắng khỏi số điện thoại
                String phone = rs.getString("phone");
                if (phone != null) {
                    phone = phone.trim();
                }
                u.setPhone(phone);
                u.setBirthDate(rs.getDate("birthDate"));    // Ngày sinh (birth_date)
                u.setAddress(rs.getString("address"));      // Địa chỉ
                u.setAvatarUrl(rs.getString("avatarUrl"));  // URL ảnh đại diện (avatar_url)
                u.setFullName(rs.getString("fullName"));    // Họ và tên (full_name)
                u.setAccumulatedPoints(rs.getDouble("accumulatedPoints"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi để debug
        }
        return list;
    }

    @SneakyThrows
    public UserDto login(String email) {
        String sql = "SELECT user_id, email, phone, address, avatar_url AS avatarUrl, role_id, full_name AS fullName ,accumulated_points as accumulatedPoints"
                + "FROM Users WHERE email = ?";

        // Sử dụng try-with-resources để tự động đóng các tài nguyên sau khi kết thúc
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {

            // Thiết lập giá trị cho câu lệnh SQL
            stm.setString(1, email);

            // Thực thi câu lệnh và xử lý kết quả
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    UserDto user = new UserDto();
                    user.setUserId(rs.getInt("user_id"));           // ID người dùng
                    user.setRoleId(rs.getInt("role_id"));           // Vai trò của người dùng
                    user.setEmail(rs.getString("email"));           // Địa chỉ email
                    user.setPhone(rs.getString("phone"));           // Số điện thoại
                    user.setAddress(rs.getString("address"));       // Địa chỉ
                    user.setAvatarUrl(rs.getString("avatarUrl"));   // URL ảnh đại diện
                    user.setFullName(rs.getString("fullName"));     // Họ và tên
                    user.setAccumulatedPoints(rs.getDouble("accumulatedPoints"));     // Họ và tên
                    return user;
                }
            }
        } catch (SQLException e) {
            System.out.println("login err " + e);  // Log lỗi để debug
        }
        return null;
    }

    //
    public UserDto insertNewUser(String email, String imageUrl) throws SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT into Users (role_id,email,avatar_url)"
                + " values (?,?,?)");
        stm.setInt(1, RoleUserType.USER.getId());
        stm.setString(2, email);
        stm.setString(3, imageUrl);
        stm.executeUpdate();
        UserDto dto = new UserDto();
        dto.setAvatarUrl(imageUrl);
        dto.setEmail(email);
        stm.close();
        return dto;
    }

    @SneakyThrows
    public UserDto signUpUser(String email, String fullName, String password) {
        String insertSql = "INSERT INTO Users (role_id, email, full_name, password) VALUES (?, ?, ?, ?)";
        String selectSql = "SELECT user_id, role_id, email, full_name, phone, address, avatar_url "
                + "FROM Users WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection(); PreparedStatement insertStm = conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Thực hiện câu lệnh INSERT
            insertStm.setInt(1, RoleUserType.USER.getId()); // role_id cho người dùng
            insertStm.setString(2, email);                  // Đặt email
            insertStm.setString(3, fullName);               // Đặt full_name
            insertStm.setString(4, password);               // Đặt mật khẩu đã mã hóa

            int affectedRows = insertStm.executeUpdate();
            if (affectedRows == 0) {
                return null;  // Nếu không có hàng nào bị ảnh hưởng, trả về null
            }

            // Lấy ID vừa được tạo
            try (ResultSet generatedKeys = insertStm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int newUserId = generatedKeys.getInt(1);  // Lấy ID của người dùng vừa thêm

                    // Truy vấn lại để lấy đầy đủ thông tin người dùng
                    try (PreparedStatement selectStm = conn.prepareStatement(selectSql)) {
                        selectStm.setInt(1, newUserId);
                        try (ResultSet rs = selectStm.executeQuery()) {
                            if (rs.next()) {
                                UserDto dto = new UserDto();
                                dto.setUserId(rs.getInt("user_id"));
                                dto.setRoleId(rs.getInt("role_id"));
                                dto.setEmail(rs.getString("email"));
                                dto.setFullName(rs.getString("full_name"));
                                dto.setPhone(rs.getString("phone"));
                                dto.setAddress(rs.getString("address"));
                                dto.setAvatarUrl(rs.getString("avatar_url"));
                                dto.setPassword(password);  // Thiết lập mật khẩu đã mã hóa
                                return dto;
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log lỗi để debug
            return null;
        }
        return null;
    }
    //Nhận trực tiếp các giá trị 
    public void updateProfile(String email, String fullName, String phone, String avatarUrl) throws SQLException {
        String sql = "UPDATE Users SET phone = ?, full_name = ?, avatar_url = ? WHERE email = ?";

        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setString(1, phone);       // Cập nhật số điện thoại
            stm.setString(2, fullName);    // Cập nhật họ và tên
            stm.setString(3, avatarUrl);   // Cập nhật URL ảnh đại diện
            stm.setString(4, email);       // Điều kiện cập nhật theo email

            stm.executeUpdate();
        }
    }

    @SneakyThrows
    public UserDto getUserById(Integer id) {
        String sql = "SELECT user_id, role_id, email, phone, birth_date AS birthDate, address, avatar_url AS avatarUrl, full_name, password,accumulated_points as accumulatedPoints "
                + "FROM Users "
                + "WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    UserDto u = new UserDto();
                    u.setUserId(rs.getInt("user_id"));            // ID người dùng
                    u.setRoleId(rs.getInt("role_id"));            // Vai trò người dùng
                    u.setEmail(rs.getString("email"));            // Địa chỉ email
                    // Kiểm tra và loại bỏ khoảng trắng khỏi số điện thoại nếu có
                    String phone = rs.getString("phone");
                    if (phone != null) {
                        phone = phone.trim();
                    }
                    u.setPhone(phone);                            // Số điện thoại
                    u.setBirthDate(rs.getDate("birthDate"));      // Ngày sinh
                    u.setAddress(rs.getString("address"));        // Địa chỉ
                    u.setAvatarUrl(rs.getString("avatarUrl"));    // URL ảnh đại diện
                    u.setFullName(rs.getString("full_name"));     // Họ và tên đầy đủ
                    u.setPassword(rs.getString("password"));      // Mật khẩu người dùng
                    u.setAccumulatedPoints(rs.getDouble("accumulatedPoints"));
                    return u;
                }
            }
        }
        return null;  // Trả về null nếu không tìm thấy người dùng với ID được cung cấp
    }

    public UserDto loginAdmin(String email, String password) {
        String sql = "SELECT user_id, role_id, email, phone, address, avatar_url AS avatarUrl, full_name AS fullName, password,accumulated_points as accumulatedPoints "
                + "FROM Users WHERE email = ? AND password = ?";
        // Sử dụng try-with-resources để tự động đóng các tài nguyên sau khi kết thúc
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {
            // Thiết lập giá trị cho câu lệnh SQL
            stm.setString(1, email);
            stm.setString(2, password);
            // Thực thi câu lệnh và xử lý kết quả
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    UserDto user = new UserDto();
                    user.setUserId(rs.getInt("user_id"));         // ID người dùng
                    user.setRoleId(rs.getInt("role_id"));         // Vai trò người dùng
                    user.setEmail(rs.getString("email"));         // Địa chỉ email
                    // Kiểm tra và loại bỏ khoảng trắng khỏi số điện thoại nếu có
                    String phone = rs.getString("phone");
                    if (phone != null) {
                        phone = phone.trim();
                    }
                    user.setPhone(phone);                         // Số điện thoại
                    user.setAddress(rs.getString("address"));     // Địa chỉ
                    user.setAvatarUrl(rs.getString("avatarUrl")); // URL ảnh đại diện
                    user.setFullName(rs.getString("fullName"));   // Họ và tên đầy đủ
                    user.setPassword(rs.getString("password"));   // Mật khẩu (đã mã hóa)
                    user.setAccumulatedPoints(rs.getDouble("accumulatedPoints"));
                    return user;
                }
            }
        } catch (SQLException e) {
            System.out.println("login err " + e);
        }
        return null;
    }

    public Boolean saveOrUpdateStaff(UserDto staff) throws SQLException {
        String query;
        Boolean isUpdate = staff.getUserId() != null;

        if (isUpdate) {
            // Truy vấn cập nhật
            query = "UPDATE Users SET role_id = ?, email = ?, full_name = ?, phone = ?, address = ?, avatar_url = ? WHERE user_id = ?";
        } else {
            // Truy vấn thêm mới
            query = "INSERT INTO Users (role_id, email, full_name, phone, address, avatar_url, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        }

        // Bắt đầu giao dịch
        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false); // Tắt chế độ auto-commit để điều khiển giao dịch thủ công

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                // Thiết lập các giá trị chung cho cả cập nhật và thêm mới
                stmt.setInt(1, staff.getRoleId() != null ? staff.getRoleId() : RoleUserType.STAFF.getId());  // role_id
                stmt.setString(2, staff.getEmail());       // email
                stmt.setString(3, staff.getFullName());    // full_name
                stmt.setString(4, staff.getPhone());       // phone
                stmt.setString(5, staff.getAddress());     // address
                stmt.setString(6, staff.getAvatarUrl());   // avatar_url

                if (isUpdate) {
                    stmt.setInt(7, staff.getUserId());       // user_id
                } else {
                    // Nếu là thêm mới, tạo và hash mật khẩu
                    String generatedPassword = this.generatePassword(8);
                    stmt.setString(7, generatedPassword);    // Đặt mật khẩu mới
                    staff.setPassword(generatedPassword);    // Lưu mật khẩu để gửi email sau
                }
                // Thực thi truy vấn
                int affectedRows = stmt.executeUpdate();
                if (affectedRows > 0) {
                    conn.commit(); // Chỉ commit nếu lưu vào DB thành công
                    // Nếu là thêm mới và thành công, gửi email
                    if (!isUpdate) {
                        this.sendEmail(staff);
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
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newPassword); // Nên mã hóa mật khẩu nếu cần
            stmt.setInt(2, userId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Nếu cập nhật thành công
        }
    }

    // Hàm gửi email
    public void sendEmail(UserDto staff) {
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
        UserDto staff = this.login(email);
        System.out.println("staff " + staff);
        String user = Constants.SENDER_EMAIL;
        String pass = Constants.SENDER_PASSWORD;
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
            this.updateTokenResetPassword(staff.getUserId(), token);
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
    public UserDto getUserByToken(String token) {
        String sql = "SELECT user_id, role_id, email, phone, birth_date AS birthDate, address, avatar_url AS avatarUrl, full_name "
                + "FROM Users "
                + "WHERE token_reset_password = ?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, token);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    UserDto u = new UserDto();
                    u.setUserId(rs.getInt("user_id"));            // ID người dùng
                    u.setRoleId(rs.getInt("role_id"));            // Vai trò người dùng
                    u.setEmail(rs.getString("email"));            // Địa chỉ email
                    // Kiểm tra và loại bỏ khoảng trắng khỏi số điện thoại nếu có
                    String phone = rs.getString("phone");
                    if (phone != null) {
                        phone = phone.trim();
                    }
                    u.setPhone(phone);                            // Số điện thoại
                    u.setBirthDate(rs.getDate("birthDate"));      // Ngày sinh
                    u.setAddress(rs.getString("address"));        // Địa chỉ
                    u.setAvatarUrl(rs.getString("avatarUrl"));    // URL ảnh đại diện
                    u.setFullName(rs.getString("full_name"));     // Họ và tên
                    return u;
                }
            }
        }
        return null;  // Trả về null nếu không tìm thấy người dùng với token được cung cấp
    }
    //Nhận một đối tượng UserDto làm tham số, trong đó chứa các thuộc tính
    public Boolean updateProfile(UserDto userDto) {
        String query = "update Users set full_name = ?,phone = ?,address = ? where user_id = ? ";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, userDto.getFullName()); // Nên mã hóa mật khẩu nếu cần
            stmt.setString(2, userDto.getPhone()); // Nên mã hóa mật khẩu nếu cần
            stmt.setString(3, userDto.getAddress()); // Nên mã hóa mật khẩu nếu cần
            stmt.setInt(4, userDto.getUserId());
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Nếu cập nhật thành công
        } catch (SQLException e) {
            return false;
        }
    }

}
