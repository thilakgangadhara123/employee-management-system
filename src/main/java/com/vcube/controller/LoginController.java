package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.vcube.Dao.EmployeeDao;
import com.vcube.Dto.LoginModel;




@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		LoginModel lm = new LoginModel();
		lm.setUsername(username);
		lm.setPassword(password);
		
		EmployeeDao sd=new EmployeeDao();
		String status=sd.selectemployee(lm);
		
		if(status.equals("success")) {
			//request.setAttribute("username", username);
			HttpSession session=request.getSession();
			session.setAttribute("username",username);
			RequestDispatcher rd = request.getRequestDispatcher("employeehome.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
