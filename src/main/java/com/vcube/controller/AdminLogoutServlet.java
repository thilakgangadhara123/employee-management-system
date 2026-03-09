package com.vcube.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminLogout")
public class AdminLogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session (if any)
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Destroy session
        }

        // Redirect to admin login page
        response.sendRedirect("adminlogin.jsp");
    }
}