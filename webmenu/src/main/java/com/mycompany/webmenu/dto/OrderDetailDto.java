package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDto {
    private Integer orderId;  // ID chi tiết đơn hàng, tương ứng với order_detail_id trong bảng
    private Integer orderDetailId;  // ID chi tiết đơn hàng, tương ứng với order_detail_id trong bảng
    private Integer quantity;       // Số lượng sản phẩm, tương ứng với quantity trong bảng
    private Integer productId;      // ID sản phẩm, tương ứng với product_id trong bảng
    private String productName;
    private String productUrl;
    private Double productPrice;
}
