package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private Integer productId;
    private Integer categoryId;
    private String categoryName;
    private Double price;
    private String name;
    private String description;
    private Integer userAdminId;
    private Date createAt;
    private Date approveAt;
    private ImageProductDTO mainImg;
    private List<ImageProductDTO> imgs;

    public List<ImageProductDTO> getImgs() {
        return (imgs != null) ? imgs : new ArrayList<>();
    }

}
