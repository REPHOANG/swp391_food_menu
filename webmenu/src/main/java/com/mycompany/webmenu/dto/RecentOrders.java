package com.mycompany.webmenu.dto;

import com.mycompany.webmenu.enums.StatusOrderType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecentOrders {
    private String userName;
    private Date orderDate;
    private Double orderTotal;
    private Integer orderStatus;
    private String orderStatusDescription;

    // Getters and Setters
    public String getOrderStatusDescription() {
        return StatusOrderType.getStatusNameByCode(orderStatus);
    }


}
