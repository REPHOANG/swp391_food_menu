/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import com.mycompany.webmenu.dao.CategoryDAO;
import com.mycompany.webmenu.dao.DiscountDAO;
import com.mycompany.webmenu.dto.CategoryDto;
import com.mycompany.webmenu.dto.DiscountDTO;
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
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DiscountManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscountManagerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("discountAction");
        String message = request.getParameter("message");
        if (productAction == null) {
            productAction = "discountListManager";
        }
        DiscountDAO discountDAO = new DiscountDAO();
        switch (productAction) {
            case "discountListManager": {
                int pageNo = 1; // Trang mặc định
                int pageSize = 3; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<DiscountDTO> discountList = discountDAO.getListDiscountManager(pageNo, pageSize);
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
                request.setAttribute("discount", new DiscountDTO());
                request.getRequestDispatcher(Constants.ADD_NEW_DISCOUNT_JSP).forward(request, response);
                break;
            }
            case "detailDiscount": {
                Integer discountId = Integer.parseInt(request.getParameter("discountId"));
                request.setAttribute("discount", discountDAO.getDiscountDetail(discountId));
                request.getRequestDispatcher(Constants.ADD_NEW_DISCOUNT_JSP).forward(request, response);
                break;
            }
            default:
                throw new AssertionError();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các giá trị từ form
        String idStr = request.getParameter("id");
        Integer id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : null;

        String name = request.getParameter("name");
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
        DiscountDTO discountDTO = DiscountDTO.builder()
                .id(id)
                .name(name)
                .description(description)
                .discountPercent(discountPercent)
                .maxDiscountValue(maxDiscountValue)
                .minDiscountValue(minDiscountValue)
                .startDate(startDate)
                .endDate(endDate)
                .quantity(quantity)
                .rmQuantity(rmQuantity)
                .build();
        System.out.println("discountDTO " + discountDTO);
        Boolean isNewProduct = discountDTO.getId() == null ? true : false;

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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
