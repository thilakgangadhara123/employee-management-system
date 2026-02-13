package com.vcube.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.vcube.Dto.Employee;
import com.vcube.Dto.LoginModel;
import com.vcube.utility.DBConnection;

public class EmployeeDao implements EmployeeDaoInterface {
	String status = "failure";

	@Override
	public String insertemployee(Employee e) {

		try {
			DBConnection dbc = new DBConnection();
			Connection con = dbc.getconnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into emprig(fname,lname,email,phno,username, password) values(?, ?, ?,?,?,?)");
			ps.setString(1, e.getFname());
			ps.setString(2, e.getLname());
			ps.setString(3, e.getEmail());
			ps.setLong(4, e.getPhno());
			ps.setString(5, e.getUsername());
			ps.setString(6, e.getPassword());
			int n = ps.executeUpdate();
			if (n > 0) {
				System.out.println("rows(s) affected");
				status = "success";
			} else {
				System.out.println("something went wrong");
			}

		} catch (Exception e1) {
			System.out.println(e1);
		}
		return status;
	}

	@Override
	public String selectemployee(LoginModel lm) {
		try {
			DBConnection dbc = new DBConnection();
			Connection con = dbc.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from emprig where username = ? and password = ?");
			ps.setString(1, lm.getUsername());
			ps.setString(2, lm.getPassword());
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}
			if (count > 0) {
				status = "success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

}
