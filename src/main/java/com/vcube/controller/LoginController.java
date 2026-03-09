package com.vcube.controller;

import java.io.IOException;
import com.vcube.Dao.EmployeeDao;
import com.vcube.Dto.Employee;
import com.vcube.Dto.LoginModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get credentials from login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create LoginModel
        LoginModel lm = new LoginModel();
        lm.setUsername(username);
        lm.setPassword(password);

        // Authenticate using DAO
        EmployeeDao dao = new EmployeeDao();
        Employee employee = dao.selectemployee(lm);

        if (employee != null) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("employee", employee); // store full object

            // Redirect to employee dashboard/home
            response.sendRedirect("employeehome.jsp");

        } else {
            // Invalid login, forward back to login page with error
            request.setAttribute("errorMessage", "Invalid Username or Password");
            request.getRequestDispatcher("emplogin.jsp").forward(request, response);
        }
    }

    // Optionally override doGet to redirect to login page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("emplogin.jsp");
    }
}