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
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String tableIdStr = request.getParameter("tableId");
        Integer tableId = (tableIdStr != null && !tableIdStr.isEmpty()) ? Integer.parseInt(tableIdStr) : null;
        TableDAO tableDao = new TableDAO();
        if (tableId != null) {
            session.setAttribute("userSelectedTable", tableDao.getTableDetail(tableId));
        } else {
            session.setAttribute("userSelectedTable", session.getAttribute("userSelectedTable"));
        }
        request.getRequestDispatcher(Constants.HOME_INDEX_USER).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
