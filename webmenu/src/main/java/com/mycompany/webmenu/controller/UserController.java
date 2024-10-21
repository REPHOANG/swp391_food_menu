/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import com.google.gson.Gson;

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
import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author nguye
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userAction = request.getParameter("userAction");
        HttpSession session = request.getSession();
        UserDAO uDAO = new UserDAO();
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String url = "";
        try {
            if (userAction == null) {
                throw new IllegalArgumentException("\"action\" parameter is missing");
            }
            switch (userAction) {
                case "login": {
                    String email = request.getParameter("email");

                    if (email == null || email.isEmpty()) {
                        throw new IllegalArgumentException("\"email\" parameter is missing");
                    } else {
                        UserDTO user = uDAO.login(email);
                        if (user == null) {
                            String avatarURL = request.getParameter("picture");
                            String username = request.getParameter("username");
                            user = uDAO.insertNewUser(email, avatarURL, username);
                        }
                        session.setAttribute("user", user);
                        out.println(gson.toJson(user));
                    }
                    break;
                }
                case "logout": {
                    session.removeAttribute("user");
                    response.sendRedirect(Constants.LOGIN_CONTROLLER + "?tableId=" + session.getAttribute("tableId"));
                    break;
                }
                case "profile": {
                    request.getRequestDispatcher(Constants.SHOW_USER_PROFILE_PAGE).forward(request, response);
                    break;
                }
                case "updateProfile": {
                    String username = request.getParameter("username");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String urlAvatar = request.getParameter("urlAvatar").replace("/avatar/", "%2Favatar%2F");
                    uDAO.updateProfile(email, username, phone, urlAvatar);
                    UserDTO u = (UserDTO) session.getAttribute("user");
                    u.setPhone(phone);
                    u.setUsername(username);
                    u.setAvatarUrl(urlAvatar);
                    session.setAttribute("user", u);
                    break;
                }
                case "userManagerAdmin": {
                    int pageNo = 1; // Trang mặc định
                    int pageSize = 10; // Số sản phẩm trên mỗi trang
                    // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                    String pageParam = request.getParameter("page");
                    if (pageParam != null) {
                        pageNo = Integer.parseInt(pageParam);
                    }
                    int totalProducts = uDAO.getTotalUserCount();
                    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
                    request.setAttribute("users", uDAO.getListCategoryManager(pageNo, pageSize));
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", pageNo);
                    request.getRequestDispatcher(Constants.LIST_USER_MANAGER).forward(request, response);
                    break;
                }
            }

        } catch (IllegalArgumentException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
