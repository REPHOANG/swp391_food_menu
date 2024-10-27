package com.mycompany.webmenu.dto;

import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    private Integer userId;       // ID người dùng, tương ứng với user_id trong bảng
    private Integer roleId;       // ID vai trò, tương ứng với role_id trong bảng
    private String email;         // Địa chỉ email của người dùng
    private String phone;         // Số điện thoại của người dùng
    private Date birthDate;       // Ngày sinh của người dùng, tương ứng với birth_date
    private String address;       // Địa chỉ của người dùng
    private String avatarUrl;     // URL ảnh đại diện của người dùng
    private String fullName;      // Họ và tên của người dùng
    private String password;      // Mật khẩu của người dùng
}
