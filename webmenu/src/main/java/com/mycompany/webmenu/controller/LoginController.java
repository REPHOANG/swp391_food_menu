/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDTO;
import com.mycompany.webmenu.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;

/**
 * @author nguye
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tableId = request.getParameter("tableId");
        HttpSession session = request.getSession();
        session.setAttribute("tableId", tableId);
        request.getRequestDispatcher(Constants.LOGIN).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tableId = request.getParameter("tableId");
        String username = request.getParameter("username");
        UserDAO uDAO = new UserDAO();
        UserDTO user = new UserDTO();
        try {
            user = uDAO.insertNewUser(username, username, username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("tableId", tableId);
        response.sendRedirect(Constants.MAIN_CONTROLLER);
    }

}
