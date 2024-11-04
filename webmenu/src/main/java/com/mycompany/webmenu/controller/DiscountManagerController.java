/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.DiscountDAO;
import com.mycompany.webmenu.dto.DiscountDto;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "DiscountManagerController", urlPatterns = {"/DiscountManagerController"})
public class DiscountManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("discountAction");
        String message = request.getParameter("message");
        if (message == null) {
            message = (String) request.getAttribute("message");
        }
        if (productAction == null) {
            productAction = "discountListManager";
        }
        DiscountDAO discountDAO = new DiscountDAO();
        switch (productAction) {
            case "discountListManager": {
                int pageNo = 1; // Trang mặc định
                int pageSize = 10; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<DiscountDto> discountList = discountDAO.getListDiscountManager(pageNo, pageSize);
                int totalProducts = discountDAO.getTotalDiscountCount();
                int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                request.setAttribute("discounts", discountList);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.setAttribute("message", message);
                request.getRequestDispatcher(Constants.LIST_DISCOUNT_MANAGER).forward(request, response);
                break;
            }
            case "addDiscount": {
                request.setAttribute("discount", new DiscountDto());
                request.getRequestDispatcher(Constants.ADD_NEW_DISCOUNT_JSP).forward(request, response);
                break;
            }
            case "detailDiscount": {
                Integer discountId = Integer.parseInt(request.getParameter("discountId"));
                request.setAttribute("discount", discountDAO.getDiscountDetail(discountId));
                request.getRequestDispatcher(Constants.ADD_NEW_DISCOUNT_JSP).forward(request, response);
                break;
            }
            case "discountUser": {
                // Lấy danh sách các Discount
                List<DiscountDto> discountList = discountDAO.getListDiscountUser();
                // Thiết lập kiểu phản hồi là JSON và mã hóa UTF-8
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                Gson gson = new Gson();
                // Chuyển đổi danh sách thành JSON
                String jsonResponse = gson.toJson(discountList);
                // Ghi JSON vào phản hồi
                response.getWriter().write(jsonResponse);
                return;
            }
            case "checkDiscountByCode": {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String discountCode = request.getParameter("discountCode");
                // Lấy danh sách các Discount
                DiscountDto discount = discountDAO.checkDiscountByCode(discountCode);
                // Thiết lập kiểu phản hồi là JSON và mã hóa UTF-8
                // Chuyển đổi danh sách thành JSON
                Gson gson = new Gson();
                String jsonResponse = gson.toJson(discount);
                // Ghi JSON vào phản hồi
                response.getWriter().write(jsonResponse);
                return;
            }
            case "deleteDiscount": {
                Integer discountId = Integer.parseInt(request.getParameter("discountId"));
                Boolean isDeleted = discountDAO.markDiscountsAsDeleted(discountId);
                if (isDeleted) {
                    request.setAttribute("message", "Discount has been successfully deleted");
                } else {
                    request.setAttribute("message", "Discount not found with the provided ID or it has already been deleted");
                }
                request.getRequestDispatcher("DiscountManagerController?discountAction=discountListManager").forward(request, response);
                break;
            }
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các giá trị từ form
        String idStr = request.getParameter("id");
        Integer id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : null;

        String name = request.getParameter("name");
        String discountCode = request.getParameter("discountCode");
        String description = request.getParameter("description");

        String discountPercentStr = request.getParameter("discountPercent");
        Double discountPercent = (discountPercentStr != null && !discountPercentStr.isEmpty()) ? Double.parseDouble(discountPercentStr) : null;

        String maxDiscountValueStr = request.getParameter("maxDiscountValue");
        Double maxDiscountValue = (maxDiscountValueStr != null && !maxDiscountValueStr.isEmpty()) ? Double.parseDouble(maxDiscountValueStr) : null;

        String minDiscountValueStr = request.getParameter("minDiscountValue");
        Double minDiscountValue = (minDiscountValueStr != null && !minDiscountValueStr.isEmpty()) ? Double.parseDouble(minDiscountValueStr) : null;

        String startDateStr = request.getParameter("startDate");
        Date startDate = (startDateStr != null && !startDateStr.isEmpty()) ? Date.valueOf(startDateStr) : null;

        String endDateStr = request.getParameter("endDate");
        Date endDate = (endDateStr != null && !endDateStr.isEmpty()) ? Date.valueOf(endDateStr) : null;

        String quantityStr = request.getParameter("quantity");
        Integer quantity = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : null;

        String rmQuantityStr = request.getParameter("rmQuantity");
        Integer rmQuantity = (rmQuantityStr != null && !rmQuantityStr.isEmpty()) ? Integer.parseInt(rmQuantityStr) : null;
        // Tạo đối tượng DiscountDTO và gán các giá trị
        DiscountDto discountDTO = new DiscountDto();
        discountDTO.setId(id);
        discountDTO.setName(name);
        discountDTO.setDiscountCode(discountCode);
        discountDTO.setDescription(description);
        discountDTO.setDiscountPercent(discountPercent);
        discountDTO.setMaxDiscountValue(maxDiscountValue);
        discountDTO.setMinDiscountValue(minDiscountValue);
        discountDTO.setStartDate(startDate);
        discountDTO.setEndDate(endDate);
        discountDTO.setQuantity(quantity);
        discountDTO.setRmQuantity(rmQuantity);
        Boolean isNewProduct = discountDTO.getId() == null ? true : false;
        System.out.println("discountDTO " + discountDTO);
        DiscountDAO discountDAO = new DiscountDAO();
        Boolean isAdded = discountDAO.insertOrUpdateDiscount(discountDTO);
        if (isAdded) {
            String message = null;
            if (isNewProduct) {
                message = "Discount added successfully!";
            } else {
                message = "Discount updated successfully!";
            }
            response.sendRedirect("DiscountManagerController?message=" + message);
        } else {
            // Xử lý lỗi
            if (isNewProduct) {
                request.setAttribute("message", "Failed to add discount.");
            } else {
                request.setAttribute("message", "Failed to update discount.");
            }
            request.setAttribute("discount", discountDTO);
            request.getRequestDispatcher(Constants.ADD_NEW_DISCOUNT_JSP).forward(request, response);
        }
    }

}
