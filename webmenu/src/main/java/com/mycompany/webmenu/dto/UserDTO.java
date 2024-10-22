package com.mycompany.webmenu.dto;

import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Integer userID;
    private String wardID;
    private Integer roleID;
    private String email;
    private String phone;
    private Date yob;
    private String address;
    private String avatarUrl;
    private String username;
    private String fullName;
    private String password;
}
