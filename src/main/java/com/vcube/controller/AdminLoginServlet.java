package com.vcube.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.vcube.Dao.AdminDao;
import com.vcube.Dto.Admin;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create Admin Object
        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);

        // DAO Object
        AdminDao dao = new AdminDao();

        if (dao.validateAdmin(admin)) {

            // Create Session
            HttpSession session = request.getSession();
            session.setAttribute("adminName", username);

            response.sendRedirect("adminhome.jsp");

        } else {
            response.sendRedirect("adminlogin.jsp");
        }
    }
}