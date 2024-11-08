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
import com.mycompany.webmenu.enums.RoleUserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

/**
 * @author nguye
 */
@WebServlet(name = "StaffController", urlPatterns = {"/StaffController"})
public class StaffController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập mã hóa UTF-8 cho request
        request.setCharacterEncoding("UTF-8");
        // Thiết lập mã hóa UTF-8 cho response
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String staffAction = request.getParameter("staffAction");
        String message = request.getParameter("message");
        if (staffAction == null) {
            staffAction = "staffListManager";
        }
        UserDAO userDao = new UserDAO();
        switch (staffAction) {
            case "staffListManager": {
                int pageNo = 1; // Trang mặc định
                int pageSize = 10; // Số sản phẩm trên mỗi trang
                // Lấy số trang từ yêu cầu, nếu không có thì dùng giá trị mặc định
                String pageParam = request.getParameter("page");
                if (pageParam != null) {
                    pageNo = Integer.parseInt(pageParam);
                }
                int totalStaffs = userDao.getTotalUserCount(RoleUserType.STAFF.getId(), null, null);
                int totalPages = (int) Math.ceil((double) totalStaffs / pageSize);
                request.setAttribute("staffs", userDao.getListUserManager(pageNo, pageSize, RoleUserType.STAFF.getId(), null, null));
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", pageNo);
                request.setAttribute("message", message);
                request.getRequestDispatcher(Constants.LIST_STAFF).forward(request, response);
                break;
            }
            case "addStaff": {
                request.setAttribute("staff", new UserDto());
                request.getRequestDispatcher(Constants.ADD_NEW_STAFF_JSP).forward(request, response);
                break;
            }
            case "staffDetail": {
                Integer staffId = Integer.parseInt(request.getParameter("staffId"));
                UserDto staff = userDao.getUserById(staffId);
                request.setAttribute("staff", staff);
                request.getRequestDispatcher(Constants.ADD_NEW_STAFF_JSP).forward(request, response);
                break;
            }
            default:
                throw new AssertionError();
        }
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy các tham số từ form
        String userID = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        UserDto staff = new UserDto();
        if (!Objects.equals(userID, "") && userID != null) {
            staff.setUserId(Integer.valueOf(userID));
        }
        staff.setFullName(fullName);
        staff.setEmail(email);
        staff.setPhone(phone);
        staff.setAddress(address);

        UserDAO userDao = new UserDAO();
        UserDto userMail = userDao.login(staff.getEmail());
        if (userMail != null && !Objects.equals(userMail.getUserId(), staff.getUserId())) {
            request.setAttribute("message", "Email already exists.");
            request.setAttribute("staff", staff);
            request.getRequestDispatcher(Constants.ADD_NEW_STAFF_JSP).forward(request, response);
            return;
        }
        Boolean isNewProduct = staff.getUserId() == null ? true : false;
        Boolean isAdded = userDao.saveOrUpdateStaff(staff);
        if (isAdded) {
            String message = null;
            if (isNewProduct) {
                message = "Staff added successfully!";
            } else {
                message = "Staff updated successfully!";
            }
            response.sendRedirect("StaffController?message=" + message);
        } else {
            // Xử lý lỗi
            if (isNewProduct) {
                request.setAttribute("message", "Failed to add staff.");
            } else {
                request.setAttribute("message", "Failed to update staff.");
            }
            request.setAttribute("staff", staff);
            request.getRequestDispatcher(Constants.ADD_NEW_STAFF_JSP).forward(request, response);
        }
    }

}
