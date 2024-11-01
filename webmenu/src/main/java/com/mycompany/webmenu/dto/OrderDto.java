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
public class OrderDto {
    private Integer orderId;           // ID đơn hàng, tương ứng với order_id trong bảng
    private Integer tableId;           // ID bàn, tương ứng với table_id trong bảng
    private String tableName;          // name bàn, tương ứng với table_id trong bảng
    private Integer userId;             // ID người dùng, tương ứng với user_id trong bảng
    private Integer discountId;         // ID mã giảm giá, tương ứng với discount_id trong bảng
    private String discountCode;         // ID mã giảm giá, tương ứng với discount_id trong bảng
    private String userName;            // Tên người dùng, tương ứng với user_name trong bảng
    private Date orderDate;             // Ngày đặt hàng, tương ứng với order_date trong bảng
    private String deliveryAddress;     // Địa chỉ giao hàng, tương ứng với delivery_address
    private String orderNote;           // Ghi chú cho đơn hàng, tương ứng với order_note
    private Integer orderStatus;        // Trạng thái của đơn hàng, tương ứng với order_status
    private Double orderTotal;          // Tổng tiền của đơn hàng, tương ứng với order_total
    private Double shippingFee;         // Phí vận chuyển, tương ứng với shipping_fee
    private Double maxDiscountValue;
    private List<OrderDetailDto> orderDetailDto;

    public List<OrderDetailDto> getOrderDetailDto() {
        return orderDetailDto != null ? orderDetailDto : new ArrayList<>();
    }
}
