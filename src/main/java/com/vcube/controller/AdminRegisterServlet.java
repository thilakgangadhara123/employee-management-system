package com.vcube.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.vcube.Dao.AdminDao;
import com.vcube.Dto.Admin;


@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create Admin object
        Admin admin = new Admin();
        admin.setId(0); // usually auto-generated in DB
        admin.setUsername(username);
        admin.setPassword(password);

        // Initialize AdminDao
        AdminDao adminDao = new AdminDao();

        // Register admin
        boolean isRegistered = adminDao.registerAdmin(admin);

        if (isRegistered) {
            response.sendRedirect("adminlogin.jsp");
        } else {
            response.sendRedirect("adminrig.jsp");
        }
	}

}
