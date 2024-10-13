package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {
    private Integer orderId;
    private Integer userId;
    private String userName;
    private Date orderDate;
    private String address;
    private Integer status;
    private Double total;
    private Double shipping;
    private List<OrderDetailDTO> orderDetailDto;

    public List<OrderDetailDTO> getOrderDetailDto() {
        return orderDetailDto != null ? orderDetailDto : new ArrayList<>();
    }
}
