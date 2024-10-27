package com.mycompany.webmenu.enums;

import lombok.Getter;

@Getter
public enum StatusOrderType {
    INITIALIZED(1, "Initialized"),
    CONFIRMED(2, "Confirmed"),
    PREPARING(3, "Preparing"),
    DELIVERED(4, "Delivered"),
    PAID(5, "Paid"),
    TABLE_CLEARED(6, "Table Cleared"),
    ;
    private final Integer id;
    private final String name;

    StatusOrderType(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static String getStatusNameByCode(int code) {
        for (StatusOrderType status : StatusOrderType.values()) {
            if (status.getId() == code) {
                return status.getName();
            }
        }
        return "Unknown"; // default if no match found
    }
}
