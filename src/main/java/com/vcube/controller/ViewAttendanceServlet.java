package com.vcube.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import com.vcube.Dao.AttendanceDao;
import com.vcube.Dto.Attendance;
import com.vcube.Dto.Employee;

@WebServlet("/ViewAttendanceServlet")
public class ViewAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AttendanceDao dao = new AttendanceDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get existing session (don't create new)
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        // ✅ Get employee from session
        Employee employee = (Employee) session.getAttribute("employee");

        if (employee == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        // ✅ Fetch attendance
        String username = employee.getUsername();

        List<Attendance> attendanceList = dao.getAttendanceByUsername(username);

        request.setAttribute("attendanceList", attendanceList);

        // ✅ Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("viewAttendance.jsp");
        rd.forward(request, response);
    }
}