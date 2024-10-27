package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private Integer productId;
    private Integer categoryId;
    private String categoryName;
    private Double price;
    private String name;
    private String description;
    private Integer createdBy;
    private Date createAt;
    private ImageProductDto mainImg;
    private List<ImageProductDto> imgs;

    public List<ImageProductDto> getImgs() {
        return (imgs != null) ? imgs : new ArrayList<>();
    }

}
