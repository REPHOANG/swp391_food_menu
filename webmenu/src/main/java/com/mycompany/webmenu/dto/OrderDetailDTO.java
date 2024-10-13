package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
    private Integer productId;
    private String productName;
    private String url;
    private Double price;
    private Integer quantity;
}
