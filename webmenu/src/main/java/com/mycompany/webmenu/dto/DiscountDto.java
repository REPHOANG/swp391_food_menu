package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiscountDto {
    private Integer id;
    private String discountCode;
    private String name;
    private String description;
    private Double discountPercent;
    private Double maxDiscountValue;
    private Double minDiscountValue;
    private Date startDate;
    private Date endDate;
    private Integer quantity;
    private Integer rmQuantity;
}
