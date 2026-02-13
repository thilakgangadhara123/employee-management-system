package com.vcube.Dto;

public class Employee {
	private String fname;
	private String lname;
	private String email;
	private long phno;
	private String username;
	private String password;

	public Employee() {

	}

	public Employee(String fname, String lname, String email, int phno, String username, String password) {
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phno = phno;
		this.username = username;
		this.password = password;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhno() {
		return phno;
	}

	public void setPhno(long phno) {
		this.phno = phno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {

		return lname;
	}
}
