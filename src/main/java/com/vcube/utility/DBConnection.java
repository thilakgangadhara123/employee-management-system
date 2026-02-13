package com.vcube.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection con=null;
public Connection getconnection() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","root");
		
	}catch(Exception e1) {
		System.out.println(e1);
	}
	return con;
	
}
	}
