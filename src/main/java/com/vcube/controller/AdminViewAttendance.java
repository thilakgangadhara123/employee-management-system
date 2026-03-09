package com.vcube.controller;

import com.vcube.Dao.AttendanceDao;
import com.vcube.Dto.Attendance;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminViewAttendance")
public class AdminViewAttendance extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AttendanceDao dao;

    @Override
    public void init() throws ServletException {
        dao = new AttendanceDao();   // initialize once
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Attendance> list = dao.getAllAttendance();

            request.setAttribute("attendanceList", list);

            RequestDispatcher rd =
                    request.getRequestDispatcher("/adminViewAttendance.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error loading attendance data.");
        }
    }
}