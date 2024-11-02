package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BestSellingProductDto {
    private String productName;
    private Double price;
    private Integer orders;
    private Integer amount;
}
