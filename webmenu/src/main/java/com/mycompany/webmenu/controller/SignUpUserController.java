/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author nguye
 */
@WebServlet(name = "SignUpUserController", urlPatterns = {"/SignUpUserController"})
public class SignUpUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(Constants.SIGN_UP_USER).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO uDAO = new UserDAO();
        UserDTO user = null;
        user = uDAO.login(email);
        if (user != null) {
            request.setAttribute("messageFailed", "Email already exists.");
            // Chuyển hướng đến trang SIGN_UP_USER để hiển thị thông báo
            request.getRequestDispatcher(Constants.SIGN_UP_USER).forward(request, response);
        }
        user = uDAO.signUpUser(email, fullname, password);
        if (user != null) {
            request.setAttribute("messageSuccessful", "Registration Successful.");
        } else {
            request.setAttribute("messageFailed", "Registration Failed.");
        }
        // Chuyển hướng đến trang SIGN_UP_USER để hiển thị thông báo
        request.getRequestDispatcher(Constants.SIGN_UP_USER).forward(request, response);
    }

}
