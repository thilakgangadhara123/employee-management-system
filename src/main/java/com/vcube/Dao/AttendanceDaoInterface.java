package com.vcube.Dao;

import java.util.List;

import com.vcube.Dto.Attendance;

public interface AttendanceDaoInterface {
	public boolean markAttendance(Attendance attendance) ;
	  public List<Attendance> getAttendanceByUsername(String username) ;
	  public boolean isAttendanceMarkedToday(String username);
	  public List<Attendance> getAllAttendance();
}
