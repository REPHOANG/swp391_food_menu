package com.mycompany.webmenu.utils;

import lombok.Getter;

@Getter
public enum StatusOrderType {
    PENDING(1, "Pending"),
    PREPARING(2, "Preparing "),
    TRANSACTION_EXECUTED(3, "Transaction executed"),
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
