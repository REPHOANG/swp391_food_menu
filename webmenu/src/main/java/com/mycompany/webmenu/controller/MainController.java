/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webmenu.controller;

import java.io.IOException;

import com.mycompany.webmenu.dao.ProductDAO;
import com.mycompany.webmenu.dao.TableDAO;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author nguye
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy đối tượng session của người dùng
        HttpSession session = request.getSession();

        // Thiết lập kiểu nội dung và mã hóa cho phản hồi
        response.setContentType("text/html;charset=UTF-8");

        // Lấy tham số `tableId` từ request
        String tableIdStr = request.getParameter("tableId");
        // Kiểm tra nếu `tableId` không null và không rỗng, thì chuyển đổi thành kiểu Integer, nếu không thì gán là null
        Integer tableId = (tableIdStr != null && !tableIdStr.isEmpty()) ? Integer.parseInt(tableIdStr) : null;

        // Khởi tạo đối tượng `TableDAO` để lấy thông tin chi tiết bàn
        TableDAO tableDao = new TableDAO();

        // Kiểm tra nếu `tableId` khác null
        if (tableId != null) {
            // Nếu `tableId` có giá trị, lấy thông tin chi tiết bàn từ `TableDAO` và lưu vào session
            session.setAttribute("userSelectedTable", tableDao.getTableDetail(tableId));
        } else {
            // Nếu `tableId` không có giá trị, sử dụng thông tin bàn đã được lưu trước đó trong session
            session.setAttribute("userSelectedTable", session.getAttribute("userSelectedTable"));
        }

        // Điều hướng người dùng đến trang chính (HOME_INDEX_USER)
        request.getRequestDispatcher(Constants.HOME_INDEX_USER).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
