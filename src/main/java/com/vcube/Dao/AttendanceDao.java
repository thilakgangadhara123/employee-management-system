package com.vcube.Dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.vcube.Dto.Attendance;
import com.vcube.utility.DBConnection;

public class AttendanceDao {

    // ✅ Mark Attendance
    public boolean markAttendance(Attendance attendance) {

        String sql = "INSERT INTO attendance(username, attend_date, status) VALUES(?,?,?)";

        try (Connection con = new DBConnection().getconnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, attendance.getUsername());
            ps.setDate(2, attendance.getAttendDate());
            ps.setString(3, attendance.getStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            // Duplicate entry (unique constraint violation)
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Check if attendance already marked today
    public boolean isAttendanceMarkedToday(String username) {

        String sql = "SELECT 1 FROM attendance WHERE username=? AND attend_date=?";

        try (Connection con = new DBConnection().getconnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setDate(2, Date.valueOf(LocalDate.now()));

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Get attendance history
    public List<Attendance> getAttendanceByUsername(String username) {

        List<Attendance> list = new ArrayList<>();

        String sql = "SELECT id, username, attend_date, status " +
                     "FROM attendance WHERE username=? ORDER BY attend_date DESC";

        try (Connection con = new DBConnection().getconnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Attendance att = new Attendance();
                    att.setId(rs.getInt("id"));
                    att.setUsername(rs.getString("username"));
                    att.setAttendDate(rs.getDate("attend_date"));
                    att.setStatus(rs.getString("status"));
                    list.add(att);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Attendance> getAllAttendance() {

        List<Attendance> list = new ArrayList<>();

        try {
        	Connection con = new DBConnection().getconnection();
            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM attendance");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setAttendDate(rs.getDate("attend_date"));
                a.setStatus(rs.getString("status"));
                list.add(a);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}