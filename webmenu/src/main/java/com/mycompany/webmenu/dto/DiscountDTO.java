package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DiscountDTO {
    private Integer id;
    private String name;
    private String description;
    private Double discountPercent;
    private Double maxDiscountValue;
    private Double minDiscountValue;
    private Date startDate;
    private Date endDate;
    private Integer quantity;
    //số lượng con lại
    private Integer rmQuantity;
}
