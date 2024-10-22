/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mycompany.webmenu.dao.OrderDAO;
import com.mycompany.webmenu.dto.OrderDTO;
import com.mycompany.webmenu.dto.OrderDetailDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "OrderUserController", urlPatterns = {"/OrderUserController"})
public class OrderUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer tableId = Integer.parseInt(request.getParameter("tableId"));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy dữ liệu giỏ hàng từ phía client
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        // Chuyển chuỗi JSON thành đối tượng trong Java
        String jsonData = sb.toString();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(jsonData, JsonObject.class);

        JsonArray cartItems = jsonObject.getAsJsonArray("cart");
        String orderNote = jsonObject.get("note").getAsString();
        String totalPrice = jsonObject.get("totalPrice").getAsString();
        JsonElement userIdStr = jsonObject.get("userId");
        Integer userId = !Objects.equals(userIdStr.getAsString(), "") ? userIdStr.getAsInt() : null;
        Integer tableId = jsonObject.get("tableId").getAsInt();

        // Xử lý giỏ hàng và lưu vào cơ sở dữ liệu
        List<OrderDetailDTO> orderDetailDto = new ArrayList<>();
        for (JsonElement item : cartItems) {
            JsonObject cartItem = item.getAsJsonObject();
            int productId = cartItem.get("productId").getAsInt();
            String name = cartItem.get("name").getAsString();
            int quantity = cartItem.get("quantity").getAsInt();
            double price = cartItem.get("price").getAsDouble();
            orderDetailDto.add(
                    OrderDetailDTO.builder()
                            .productId(productId)
                            .productName(name)
                            .quantity(quantity)
                            .price(price)
                            .build()
            );
        }
        OrderDTO order = OrderDTO.builder()
                .userId(userId)
                .tableId(tableId)
                .note(orderNote)
                .total(Double.valueOf(totalPrice))
                .orderDetailDto(orderDetailDto)
                .build();
        System.out.println("order " + order);
    }
}
