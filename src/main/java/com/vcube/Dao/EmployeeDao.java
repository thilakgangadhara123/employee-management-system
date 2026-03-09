package com.vcube.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vcube.Dto.Employee;
import com.vcube.Dto.LoginModel;
import com.vcube.utility.DBConnection;

public class EmployeeDao implements EmployeeDaoInterface {

	String status = "failure";

	// ✅ Insert Employee
	@Override
	public String insertemployee(Employee e) {

		String query = "INSERT INTO emprig " + "(fname, lname, email, phno, department, salary, username, password) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = new DBConnection().getconnection(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, e.getFname());
			ps.setString(2, e.getLname());
			ps.setString(3, e.getEmail());
			ps.setLong(4, e.getPhno());
			ps.setString(5, e.getDepartment()); // ✅ Added
			ps.setDouble(6, e.getSalary()); // ✅ Added
			ps.setString(7, e.getUsername());
			ps.setString(8, e.getPassword());

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public Employee selectemployee(LoginModel lm) {

		Employee emp = null;

		String query = "SELECT * FROM emprig WHERE username = ? AND password = ?";

		try (Connection con = new DBConnection().getconnection(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setString(1, lm.getUsername());
			ps.setString(2, lm.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setFname(rs.getString("fname"));
				emp.setLname(rs.getString("lname"));
				emp.setEmail(rs.getString("email"));
				emp.setPhno(rs.getLong("phno"));
				emp.setDepartment(rs.getString("department"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setUsername(rs.getString("username"));
				emp.setPassword(rs.getString("password"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return emp; // returns Employee object
	}

	@Override
	public List<Employee> viewEmployees() {

		List<Employee> list = new ArrayList<>();

		String query = "SELECT * FROM emprig";

		try (Connection con = new DBConnection().getconnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {

				Employee e = new Employee();
				e.setId(rs.getInt("id"));
				e.setFname(rs.getString("fname"));
				e.setLname(rs.getString("lname"));
				e.setEmail(rs.getString("email"));
				e.setPhno(rs.getLong("phno"));
				e.setDepartment(rs.getString("department"));
				e.setSalary(rs.getDouble("salary"));
				e.setUsername(rs.getString("username"));

				list.add(e);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
@Override
	public boolean updateEmployeeProfile(Employee emp) {
		boolean status = false;
		String sql = "UPDATE emprig SET fname=?, lname=?, email=?, phno=? WHERE username=?";
		try (Connection con = new DBConnection().getconnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, emp.getFname());
			ps.setString(2, emp.getLname());
			ps.setString(3, emp.getEmail());
			ps.setLong(4, emp.getPhno());
			ps.setString(5, emp.getUsername());

			status = ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}