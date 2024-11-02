/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
        TableDAO tableDao = new TableDAO();
        switch (productAction) {
            case "tableListManager": {
                int pageNo = 1;
                int pageSize = 10;
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                List<TableDto> list = tableDao.getListTableManager(pageNo, pageSize);
                int total = tableDao.getTotalTableCount();
                int totalPages = (int) Math.ceil((double) total / pageSize);
                request.setAttribute("tables", list);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.setAttribute("message", message);
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
