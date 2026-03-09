package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.vcube.Dao.EmployeeDao;
import com.vcube.Dto.Employee;

@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("welcome to Employee Controller");
	
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	long phno=Long.parseLong(request.getParameter("phno"));
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String department = request.getParameter("department");
	double salary = Double.parseDouble(request.getParameter("salary"));
	
	Employee e=new Employee();
	e.setFname(fname);
	e.setLname(lname);
	e.setEmail(email);
	e.setPhno(phno);
	e.setUsername(username);
	e.setPassword(password);
	e.setDepartment(department);
	e.setSalary(salary);
	
	EmployeeDao ed=new EmployeeDao();
	String status=ed.insertemployee(e);
	
	if(status.equals("success")) {
		RequestDispatcher rd=request.getRequestDispatcher("emplogin.jsp");
		rd.forward(request, response);
	}else {
		RequestDispatcher rd=request.getRequestDispatcher("emprig.jsp");
		rd.forward(request, response);
	}
	
	}

}
