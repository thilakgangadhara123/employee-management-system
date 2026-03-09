package com.vcube.Dao;

import java.sql.*;

import com.vcube.Dto.Admin;
import com.vcube.utility.DBConnection;

public class AdminDao implements AdminDaoInterface {

	// Register Admin
	public boolean registerAdmin(Admin admin) {

		try {
			DBConnection dbc = new DBConnection();
			Connection con = dbc.getconnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO admin(username,password) VALUES(?,?)");

			ps.setString(1,admin.getUsername());
			ps.setString(2, admin.getPassword());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Login Validation
	public boolean validateAdmin(Admin admin) {

		try {
			DBConnection dbc = new DBConnection();
			Connection con = dbc.getconnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");

			ps.setString(1, admin.getUsername());
			ps.setString(2, admin.getPassword());

			ResultSet rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}