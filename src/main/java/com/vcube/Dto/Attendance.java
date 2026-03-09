package com.vcube.Dto;

import java.sql.Date;

public class Attendance {
	private int id;
	private String username;
	private Date attendDate;
	private String status;

	public Attendance() {

	}

	public Attendance(int id, String username, Date attendDate, String status) {
		super();
		this.id = id;
		this.username = username;
		this.attendDate = attendDate;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getAttendDate() {
		return attendDate;
	}

	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return username;
	}

}
