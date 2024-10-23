/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/ResetPasswordController"})
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        UserDAO userDao = new UserDAO();
        try {
            userDao.resetPassword(Integer.valueOf(userId), password);
            request.setAttribute("message", "Your password has been successfully reset.");
            request.getRequestDispatcher(Constants.LOGIN_ADMIN).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("messageFailed", "Your password has been successfully reset.");
            request.getRequestDispatcher(Constants.RESET_PASSWORD_JSP).forward(request, response);
        }
    }

}
