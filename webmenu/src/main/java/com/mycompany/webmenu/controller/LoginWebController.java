/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.BufferedReader;
import java.io.IOException;

import com.google.gson.Gson;
import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDto;
import com.mycompany.webmenu.utils.Constants;
import com.mycompany.webmenu.enums.RoleUserType;
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
        String loginAction = request.getParameter("loginAction");
        UserDAO userDao = new UserDAO();
        if (loginAction != null) {
            switch (loginAction) {
                case "loginGoogle": {
                    try {
                        // Đọc `body` từ yêu cầu (nếu có) và chuyển nó thành JSON
                        StringBuilder sb = new StringBuilder();
                        BufferedReader reader = request.getReader();
                        String line;
                        while ((line = reader.readLine()) != null) {
                            sb.append(line);
                        }
                        String jsonBody = sb.toString();
                        // Chuyển đổi `jsonBody` sang đối tượng `UserDto` nếu có
                        Gson gson = new Gson();
                        UserDto userDto = gson.fromJson(jsonBody, UserDto.class);
                        UserDto userLogin = userDao.login(userDto.getEmail());
                        if (userLogin.getUserId() == null) {
                            userLogin = userDao.signUpUser(userDto.getEmail(), userDto.getFullName(), null);
                        }
                        // Kiểm tra đăng nhập
                        boolean isValidUser = userLogin != null ? true : false;
                        // Phản hồi JSON
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        if (isValidUser) {
                            session.setAttribute("user", userLogin);
                            response.getWriter().write("{\"success\": true, \"redirectUrl\": \"" + Constants.MAIN_CONTROLLER + "\"}");
                        } else {
                            session.removeAttribute("user");
                            response.getWriter().write("{\"success\": false, \"message\": \"Thông tin đăng nhập không hợp lệ.\"}");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write("{\"success\": false, \"message\": \"Có lỗi xảy ra khi xử lý đăng nhập.\"}");
                    }
                    return;
                }
                default:
                    response.sendRedirect(Constants.MAIN_CONTROLLER);
                    return;
            }
        }

        // Lấy thông tin từ form đăng nhập
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDto userDto = userDao.loginAdmin(username, password);
        if (userDto == null) {
            request.setAttribute("message", "Invalid username or password. Please try again.");
            request.getRequestDispatcher(Constants.LOGIN_ADMIN).forward(request, response);
        } else {
            session.setAttribute("user", userDto);
            if (userDto.getRoleId() != RoleUserType.USER.getId()) {
                response.sendRedirect(Constants.ADMIN_CONTROLLER);
            } else {
                response.sendRedirect(Constants.MAIN_CONTROLLER);
            }
        }
    }

}
