package com.vcube.controller;

import java.io.IOException;
import com.vcube.Dao.EmployeeDao;
import com.vcube.Dto.Employee;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");

        if (employee == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        // Get updated values from the form
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        long phno=Long.parseLong(request.getParameter("phno"));
        // Update employee object
        employee.setFname(fname);
        employee.setLname(lname);
        employee.setEmail(email);
        employee.setPhno(phno);

        // Call DAO to update database
        EmployeeDao dao = new EmployeeDao();
        boolean success = dao.updateEmployeeProfile(employee);

        // Set feedback message
        if (success) {
            session.setAttribute("message", "Profile updated successfully!");
            session.setAttribute("msgType", "success");
        } else {
            session.setAttribute("message", "Error updating profile. Try again.");
            session.setAttribute("msgType", "danger");
        }

        // Update session attribute
        session.setAttribute("employee", employee);

        // Redirect back to profile page
        response.sendRedirect("profile.jsp");
    }
}