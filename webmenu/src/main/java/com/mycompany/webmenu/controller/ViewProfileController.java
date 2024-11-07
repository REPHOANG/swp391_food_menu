/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webmenu.controller;

import java.io.IOException;
import java.util.Objects;

import com.mycompany.webmenu.dao.UserDAO;
import com.mycompany.webmenu.dto.UserDto;
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
            
            // Lấy tham số "viewProfileAction" từ request, nếu không có thì gán giá trị mặc định là "profileActionUser"
            String viewProfileAction = request.getParameter("viewProfileAction");
            if (viewProfileAction == null) {
                viewProfileAction = "profileActionUser";
            }

            // Lấy đối tượng user từ session
            UserDto user = (UserDto) session.getAttribute("user");

            // Tạo đối tượng UserDAO để thao tác với cơ sở dữ liệu
            UserDAO userDao = new UserDAO();

            // Lấy thông tin chi tiết người dùng từ cơ sở dữ liệu dựa trên userId và cập nhật vào đối tượng user
            user = userDao.getUserById(user.getUserId());
            System.out.println("profileUser " + user);

            // Đặt đối tượng user vào session với key "profileUser"
            session.setAttribute("profileUser", user);

            // Điều hướng tới trang hiển thị hồ sơ tùy thuộc vào giá trị của viewProfileAction
            switch (viewProfileAction) {
                case "profileActionAdmin": {
                    // Chuyển tiếp request tới trang JSP hiển thị hồ sơ cho admin
                    request.getRequestDispatcher(Constants.VIEW_PROFILE_ADMIN_JSP).forward(request, response);
                    return;
                }
                case "profileActionUser": {
                    // Chuyển tiếp request tới trang JSP hiển thị hồ sơ cho người dùng
                    request.getRequestDispatcher(Constants.VIEW_PROFILE_USER_JSP).forward(request, response);
                    return;
                }
                default:
            }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();

            // Lấy tham số "viewProfileAction" từ request, nếu không có thì gán giá trị mặc định là "profileActionUser"
            String viewProfileAction = request.getParameter("viewProfileAction");
            if (viewProfileAction == null) {
                viewProfileAction = "profileActionUser";
            }

            // Lấy các tham số từ request (giá trị của form đã submit)
            String userID = request.getParameter("userId");
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            // Tạo một đối tượng UserDto để lưu thông tin cập nhật
            UserDto staff = new UserDto();
            if (!Objects.equals(userID, "") && userID != null) {
                staff.setUserId(Integer.valueOf(userID));
            }
            staff.setFullName(fullName);
            staff.setPhone(phone); 
            staff.setAddress(address);

            // Tạo đối tượng UserDAO
            UserDAO userDao = new UserDAO();
            Boolean isAdded = userDao.updateProfile(staff);

            // Cập nhật thông tin người dùng trong session
            session.setAttribute("profileUser", staff);

            // Thiết lập thông báo kết quả cập nhật
            if (isAdded) {
                request.setAttribute("messageSuccessful", "Update Profile Successful.");
            } else {
                request.setAttribute("messageFailed", "Update Profile Failed.");
            }

            // Điều hướng tới trang hiển thị hồ sơ tùy thuộc vào giá trị của viewProfileAction
            switch (viewProfileAction) {
                case "profileActionAdmin": {
                    request.getRequestDispatcher(Constants.VIEW_PROFILE_ADMIN_JSP).forward(request, response);
                    return;
                }
                case "profileActionUser": {
                    request.getRequestDispatcher(Constants.VIEW_PROFILE_USER_JSP).forward(request, response);
                    return;
                }
                default:
            }
        }

}
