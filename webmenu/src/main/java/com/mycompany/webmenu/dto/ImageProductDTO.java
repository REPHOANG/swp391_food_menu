package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageProductDTO {
    private Integer imageId;
    private Integer productId;
    private String url;
    private Boolean isMainImage;
}
