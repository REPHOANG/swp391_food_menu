/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ViewProfileController", urlPatterns = {"/ViewProfileController"})
public class ViewProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String viewProfileAction = request.getParameter("viewProfileAction");
        if (viewProfileAction == null) {
            viewProfileAction = "profileActionUser";
        }
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserDAO userDao = new UserDAO();
        session.setAttribute("profileUser", userDao.getUserById(user.getUserID()));
        switch (viewProfileAction) {
            case "profileActionAdmin": {
                request.getRequestDispatcher(Constants.VIEW_PROFILE_ADMIN_JSP).forward(request, response);
                return; // Ngừng việc thực hiện mã tiếp theo
            }
            case "profileActionUser": {
                request.getRequestDispatcher(Constants.VIEW_PROFILE_USER_JSP).forward(request, response);
                return; // Ngừng việc thực hiện mã tiếp theo
            }
            default:
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String viewProfileAction = request.getParameter("viewProfileAction");
        if (viewProfileAction == null) {
            viewProfileAction = "profileActionUser";
        }

        String userID = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        UserDTO staff = new UserDTO();
        if (!Objects.equals(userID, "") && userID != null) {
            staff.setUserID(Integer.valueOf(userID));
        }
        staff.setFullName(fullName);
        staff.setPhone(phone);
        staff.setAddress(address);

        UserDAO userDao = new UserDAO();
        Boolean isAdded = userDao.updateProfile(staff);

        session.setAttribute("profileUser", staff);
        if (isAdded) {
            request.setAttribute("messageSuccessful", "Update Profile Successful.");
        } else {
            request.setAttribute("messageFailed", "Update Profile Failed.");
        }

        switch (viewProfileAction) {
            case "profileActionAdmin": {
                request.getRequestDispatcher(Constants.VIEW_PROFILE_ADMIN_JSP).forward(request, response);
                return; // Ngừng việc thực hiện mã tiếp theo
            }
            case "profileActionUser": {
                request.getRequestDispatcher(Constants.VIEW_PROFILE_USER_JSP).forward(request, response);
                return; // Ngừng việc thực hiện mã tiếp theo
            }
            default:
        }
    }

}
