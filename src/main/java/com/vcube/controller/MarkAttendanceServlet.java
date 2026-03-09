package com.vcube.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import com.vcube.Dao.AttendanceDao;
import com.vcube.Dto.Attendance;
import com.vcube.Dto.Employee;

@WebServlet("/MarkAttendanceServlet")
public class MarkAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AttendanceDao dao = new AttendanceDao();

    // ✅ Load Page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("markAttendance.jsp")
               .forward(request, response);
    }

    // ✅ Mark Attendance
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        Employee employee = (Employee) session.getAttribute("employee");

        if (employee == null) {
            response.sendRedirect("emplogin.jsp");
            return;
        }

        String username = employee.getUsername();
        String status = request.getParameter("status");

        // ✅ Check empty status
        if (status == null || status.trim().isEmpty()) {
            session.setAttribute("message", "Please select status!");
            session.setAttribute("msgType", "warning");
            response.sendRedirect("MarkAttendanceServlet");
            return;
        }

        // ✅ Check duplicate attendance
        if (dao.isAttendanceMarkedToday(username)) {

            session.setAttribute("message", "⚠️ Attendance already marked today!");
            session.setAttribute("msgType", "warning");

        } else {

            Attendance att = new Attendance();
            att.setUsername(username);
            att.setAttendDate(Date.valueOf(LocalDate.now()));
            att.setStatus(status);

            boolean success = dao.markAttendance(att);

            session.setAttribute("message",
                    success ? "✅ Attendance marked successfully!"
                            : "❌ Error marking attendance!");

            session.setAttribute("msgType",
                    success ? "success" : "danger");
        }

        response.sendRedirect("MarkAttendanceServlet");
    }
}