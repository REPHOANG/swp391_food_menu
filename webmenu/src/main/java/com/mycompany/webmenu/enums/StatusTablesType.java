package com.mycompany.webmenu.enums;

import lombok.Getter;

@Getter
public enum StatusTablesType {
    AVAILABLE(0, "Available"), //Còn trống
    IN_USE(1, "In Use"),//Đang sử dụng
    RESERVED(2, "Reserved"),//Đã đặt trước
    ;
    private final Integer id;
    private final String name;

    StatusTablesType(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static String getStatusNameById(int code) {
        for (StatusTablesType status : StatusTablesType.values()) {
            if (status.getId() == code) {
                return status.getName();
            }
        }
        return StatusTablesType.AVAILABLE.getName(); // default if no match found
    }
}
