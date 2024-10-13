package com.mycompany.webmenu.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto {
    private Integer categoryId;
    private String name;
}
