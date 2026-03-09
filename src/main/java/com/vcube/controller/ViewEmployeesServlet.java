package com.vcube.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.vcube.Dao.EmployeeDao;
import com.vcube.Dto.Employee;

@WebServlet("/viewEmployees")
public class ViewEmployeesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao dao = new EmployeeDao();
        List<Employee> list = dao.viewEmployees();

        request.setAttribute("empList", list);

        RequestDispatcher rd = request.getRequestDispatcher("viewEmployees.jsp");
        rd.forward(request, response);
    }
}