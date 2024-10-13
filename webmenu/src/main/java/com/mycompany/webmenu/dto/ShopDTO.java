package com.mycompany.webmenu.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopDTO {
    private int shopID;
    private int userID;
    private Date createAt;
    private String shopName;
    private boolean status;
    private int total;
    private String avatar;
    private ArrayList<ProductDTO> listProducts;
    private String paypalAccount;
    private String frontIdentity;
    private String backIdentity;
}
