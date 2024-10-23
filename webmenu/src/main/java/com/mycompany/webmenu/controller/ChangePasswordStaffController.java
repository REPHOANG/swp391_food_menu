/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDTO;
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
@WebServlet(name = "ChangePasswordStaffController", urlPatterns = {"/ChangePasswordStaffController"})
public class ChangePasswordStaffController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(Constants.CHANGE_PASSWORD_STAFF).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        // Lấy các tham số từ form
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp nhau không
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "New passwords do not match.");
            request.getRequestDispatcher(Constants.CHANGE_PASSWORD_STAFF).forward(request, response);
            return;
        }
        // Kiểm tra mật khẩu cũ có đúng không
        try {
            UserDAO userDAO = new UserDAO();
            if (!Objects.equals(user.getPassword(), currentPassword)) {
                request.setAttribute("message", "Current password is incorrect.");
                request.getRequestDispatcher(Constants.CHANGE_PASSWORD_STAFF).forward(request, response);
                return;
            }
            // Cập nhật mật khẩu mới
            if (userDAO.updatePassword(user.getUserID(), newPassword)) {
                response.sendRedirect(Constants.LOGIN_WEB_CONTROLLER + "?message=Password changed successfully.");
                return;
            } else {
                request.setAttribute("message", "Password change failed. Please try again.");
            }
        } catch (SQLException e) {
            throw new ServletException("Error changing password", e);
        }
        // Quay lại trang đổi mật khẩu
        request.getRequestDispatcher(Constants.CHANGE_PASSWORD_STAFF).forward(request, response);
    }

}
