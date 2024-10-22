package com.mycompany.webmenu.utils;

import lombok.Getter;

@Getter
public enum RoleUserType {
    ADMIN(1, "Admin"),
    USER(2, "User"),
    STAFF(3, "Staff"),
    ;
    private final Integer id;
    private final String name;

    RoleUserType(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}
