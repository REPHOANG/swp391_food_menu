/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.Constants;
import com.mycompany.webmenu.utils.RoleUserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author nguye
 */
@WebServlet(name = "LoginWebController", urlPatterns = {"/LoginWebController"})
public class LoginWebController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String loginAction = request.getParameter("loginAction");
        String message = request.getParameter("message");
        request.setAttribute("message", message);
        if (loginAction == null) {
            loginAction = "";
        }
        switch (loginAction) {
            case "logout": {
                session.removeAttribute("user");
                response.sendRedirect(Constants.MAIN_CONTROLLER);
                return; // Ngừng việc thực hiện mã tiếp theo
            }
            default:
        }
        request.getRequestDispatcher(Constants.LOGIN_ADMIN).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Lấy thông tin từ form đăng nhập
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDao = new UserDAO();
        UserDTO userDto = userDao.loginAdmin(username, password);
        if (userDto == null) {
            request.setAttribute("message", "Invalid username or password. Please try again.");
            request.getRequestDispatcher(Constants.LOGIN_ADMIN).forward(request, response);
        } else {
            session.setAttribute("user", userDto);
            if (userDto.getRoleID() != RoleUserType.USER.getId()) {
                response.sendRedirect(Constants.ADMIN_CONTROLLER);
            } else {
                response.sendRedirect(Constants.MAIN_CONTROLLER);
            }
        }
    }

}
