/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webmenu.controller;

import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;

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

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author nguye
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userAction = request.getParameter("userAction"); // Lấy tham số "userAction" từ request để xác định hành động của người dùng
        HttpSession session = request.getSession(); // Khởi tạo session để lưu trữ và truy xuất thông tin phiên người dùng
        UserDAO uDAO = new UserDAO(); // Tạo một đối tượng `UserDAO` để tương tác với cơ sở dữ liệu liên quan đến người dùng
        PrintWriter out = response.getWriter();
        Gson gson = new Gson(); // Khởi tạo đối tượng Gson để chuyển đổi dữ liệu thành JSON
        String url = ""; // Biến `url` dùng để xác định URL chuyển tiếp trong từng case

        try {
            if (userAction == null) { // Kiểm tra nếu `userAction` không có trong request
                throw new IllegalArgumentException("\"action\" parameter is missing"); // Ném lỗi nếu thiếu `userAction`
            }

            switch (userAction) {
                case "login": { // Nếu `userAction` là "login"
                    String email = request.getParameter("email"); // Lấy email từ request
                    if (email == null || email.isEmpty()) { // Kiểm tra nếu email không hợp lệ
                        throw new IllegalArgumentException("\"email\" parameter is missing"); // Ném lỗi nếu thiếu email
                    } else {
                        UserDto user = uDAO.login(email); // Gọi phương thức `login` để kiểm tra thông tin đăng nhập từ cơ sở dữ liệu
                        if (user == null) { // Nếu người dùng không tồn tại
                            String avatarURL = request.getParameter("picture"); // Lấy URL avatar
                            user = uDAO.insertNewUser(email, avatarURL); // Thêm người dùng mới vào cơ sở dữ liệu
                        }
                        session.setAttribute("user", user); // Lưu trữ thông tin người dùng vào session
                        out.println(gson.toJson(user)); // Trả thông tin người dùng dưới dạng JSON về client
                    }
                    break;
                }

                case "logout": { // Nếu `userAction` là "logout"
                    session.removeAttribute("user"); // Xóa thông tin người dùng khỏi session
                    response.sendRedirect(Constants.LOGIN_CONTROLLER + "?tableId=" + session.getAttribute("tableId")); // Chuyển hướng người dùng đến trang login với tham số `tableId`
                    break;
                }

                case "profile": { // Nếu `userAction` là "profile"
                    request.getRequestDispatcher(Constants.SHOW_USER_PROFILE_PAGE).forward(request, response); // Chuyển hướng đến trang hồ sơ người dùng
                    break;
                }

                case "updateProfile": { // Nếu `userAction` là "updateProfile"
                    String fullName = request.getParameter("username");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String urlAvatar = request.getParameter("urlAvatar").replace("/avatar/", "%2Favatar%2F");
                    uDAO.updateProfile(email, fullName, phone, urlAvatar); // Cập nhật thông tin hồ sơ người dùng trong cơ sở dữ liệu

                    UserDto u = (UserDto) session.getAttribute("user"); // Lấy thông tin người dùng từ session
                    u.setPhone(phone); // Cập nhật số điện thoại của người dùng
                    u.setAvatarUrl(urlAvatar); // Cập nhật URL avatar
                    session.setAttribute("user", u); // Cập nhật lại thông tin người dùng trong session
                    break;
                }

                case "userManagerAdmin": { // Nếu `userAction` là "userManagerAdmin"
                    request.getRequestDispatcher(Constants.LIST_USER_MANAGER).forward(request, response); // Chuyển hướng đến trang quản lý người dùng của admin
                    break;
                }

                case "userManagerAdminApi": { // Nếu `userAction` là "userManagerAdminApi"
                    int currentPage = Integer.parseInt(request.getParameter("page")); // Lấy số trang hiện tại từ request
                    int itemsPerPage = Integer.parseInt(request.getParameter("itemsPerPage")); // Lấy số lượng phần tử trên mỗi trang từ request
                    String emailParam = request.getParameter("email"); // Lấy email từ request (nếu có)
                    String email = (emailParam != null && !emailParam.isEmpty() && !Objects.equals(emailParam, "null")) ? emailParam : null;
                    String statusParam = request.getParameter("status");
                    Boolean status = (statusParam != null && !statusParam.isEmpty() && !Objects.equals(statusParam, "null")) ? Boolean.valueOf(statusParam) : null;

                    String roleParam = request.getParameter("role"); // Lấy email từ request (nếu có)
                    Integer role = (roleParam != null && !roleParam.isEmpty() && !Objects.equals(roleParam, "null")) ? Integer.valueOf(roleParam) : RoleUserType.USER.getId();

                    int totalProducts = uDAO.getTotalUserCount(role, email, status); // Lấy tổng số người dùng dựa trên email
                    int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage); // Tính tổng số trang
                    Map<String, Object> result = new HashMap<>(); // Tạo một `Map` để chứa kết quả
                    result.put("items", uDAO.getListUserManager(currentPage, itemsPerPage, role, email, status)); // Thêm danh sách người dùng vào kết quả
                    result.put("totalPages", totalPages); // Thêm tổng số trang vào kết quả

                    String menuJson = gson.toJson(result); // Chuyển `result` sang JSON
                    // Trả về JSON cho client
                    response.getWriter().write(menuJson);
                    break;
                }
            }
        } catch (IllegalArgumentException ex) { // Bắt lỗi khi có ngoại lệ `IllegalArgumentException`
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, ex.getMessage()); // Gửi mã lỗi 400 kèm thông báo lỗi về phía client
        } catch (SQLException ex) { // Bắt lỗi khi có ngoại lệ `SQLException`
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex); // Ghi log lỗi
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
