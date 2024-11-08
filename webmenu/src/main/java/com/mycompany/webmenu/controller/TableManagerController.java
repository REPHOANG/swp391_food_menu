/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.TableDAO;
import com.mycompany.webmenu.dto.TableDto;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "TableManagerController", urlPatterns = {"/TableManagerController"})
public class TableManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productAction = request.getParameter("tableAction");
        String message = request.getParameter("message");
        if (productAction == null) {
            productAction = "tableListManager";
        }
        if (message == null) {
            message = (String) request.getAttribute("message");
        }
        TableDAO tableDao = new TableDAO();
        switch (productAction) {
            case "tableListManager": {
                request.getRequestDispatcher(Constants.LIST_TABLE_MANAGER).forward(request, response);
                break;
            }
            case "addTable": {
                request.setAttribute("tableDTO", new TableDto());
                request.getRequestDispatcher(Constants.ADD_NEW_TABLE_JSP).forward(request, response);
                break;
            }
            case "detailTable": {
                Integer productId = Integer.parseInt(request.getParameter("tableId"));
                request.setAttribute("tableDTO", tableDao.getTableDetail(productId));
                request.getRequestDispatcher(Constants.ADD_NEW_TABLE_JSP).forward(request, response);
                break;
            }
            case "listSelectedTableUser": {
                List<TableDto> listSelectedTableUser = tableDao.getListAllTable();
                Gson gson = new Gson();
                String menuJson = gson.toJson(listSelectedTableUser);
                response.getWriter().write(menuJson);
                return;
            }
            case "tableListManagerApi": {
                int currentPage = Integer.parseInt(request.getParameter("page"));
                int itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage"));

                String tableNameParam = request.getParameter("tableName");
                String tableName = (tableNameParam != null && !tableNameParam.isEmpty() && !Objects.equals(tableNameParam, "null")) ? tableNameParam : null;
                String statusIdParam = request.getParameter("statusId");
                Integer statusId = (statusIdParam != null && !statusIdParam.isEmpty() && !Objects.equals(statusIdParam, "null")) ? Integer.valueOf(statusIdParam) : null;

                List<TableDto> listSelectedTableUser = tableDao.getListTableManager(currentPage, itemsPerPage, tableName, statusId);

                int totalProducts = tableDao.getTotalTableCount(tableName, statusId);
                int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);

                Map<String, Object> result = new HashMap<>();
                result.put("items", listSelectedTableUser);
                result.put("totalPages", totalPages);
                Gson gson = new Gson();
                String menuJson = gson.toJson(result);
                response.getWriter().write(menuJson);
                break;
            }
            case "deleteTable": {
                Integer tableId = Integer.parseInt(request.getParameter("tableId"));
                Boolean isDeleted = tableDao.markTableAsDeleted(tableId);
                if (isDeleted) {
                    request.setAttribute("message", "Table has been successfully deleted");
                } else {
                    request.setAttribute("message", "Table not found with the provided ID or it has already been deleted");
                }
                request.getRequestDispatcher("TableManagerController?tableAction=tableListManager").forward(request, response);
                break;
            }
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ request
        String tableIdStr = request.getParameter("tableId");
        Integer tableId = (tableIdStr != null && !tableIdStr.isEmpty()) ? Integer.parseInt(tableIdStr) : null;
        String tableName = request.getParameter("tableName");
        String statusStr = request.getParameter("status");
        Integer status = statusStr != null ? Integer.valueOf(statusStr) : null;
        String capacityStr = request.getParameter("capacity");
        Integer capacity = (capacityStr != null && !capacityStr.isEmpty()) ? Integer.parseInt(capacityStr) : null;
        // Xây dựng đối tượng TableDto (giả sử bạn có lớp này để chứa thông tin bàn)
        TableDto table = TableDto.builder()
                .tableId(tableId)
                .tableName(tableName)
                .status(status)
                .capacity(capacity)
                .build();

        // Kiểm tra xem đây là thao tác thêm mới hay cập nhật
        Boolean isNewTable = table.getTableId() == null ? true : false;
        // Gọi DAO để thêm hoặc cập nhật table
        TableDAO tableDAO = new TableDAO();
        Boolean isAdded = tableDAO.insertOrUpdateTable(table); // Giả sử bạn có phương thức này trong DAO
        if (isAdded) {
            // Tạo thông báo thành công
            String message = isNewTable ? "Table added successfully!" : "Table updated successfully!";
            response.sendRedirect("TableManagerController?message=" + message);
        } else {
            // Xử lý lỗi và chuyển về trang form với thông báo lỗi
            String errorMessage = isNewTable ? "Failed to add table." : "Failed to update table.";
            request.setAttribute("message", errorMessage);
            request.setAttribute("table", table);
            request.getRequestDispatcher(Constants.ADD_NEW_TABLE_JSP).forward(request, response);
        }
    }

}
