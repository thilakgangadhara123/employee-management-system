<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.vcube.Dto.Attendance" %>

<%
    com.vcube.Dto.Employee employee =
        (com.vcube.Dto.Employee) session.getAttribute("employee");

    if(employee == null){
        response.sendRedirect("emplogin.jsp");
        return;
    }

    List<Attendance> attendanceList =
        (List<Attendance>) request.getAttribute("attendanceList");

    int total = 0;
    int present = 0;
    int absent = 0;
    double percentage = 0;

    if(attendanceList != null){
        total = attendanceList.size();
        for(Attendance a : attendanceList){
            if("Present".equalsIgnoreCase(a.getStatus())){
                present++;
            } else {
                absent++;
            }
        }
        if(total > 0){
            percentage = (present * 100.0) / total;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>My Attendance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background-color: #f4f6f9;
    font-family: 'Segoe UI', sans-serif;
}

/* Main Container */
.attendance-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.05);
}

/* Summary Boxes */
.summary-box {
    background: #ffffff;
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.04);
}

.summary-number {
    font-size: 22px;
    font-weight: 600;
}

.summary-label {
    font-size: 13px;
    color: #6c757d;
}

/* Circular Percentage */
.circle-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.circle {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    background: conic-gradient(#4a90e2 <%= percentage %>% , #e9ecef <%= percentage %>%);
    display: flex;
    justify-content: center;
    align-items: center;
}

.circle-inner {
    width: 110px;
    height: 110px;
    background: #ffffff;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 600;
    font-size: 20px;
    color: #2c3e50;
}

/* Table */
.table thead {
    background-color: #eef3f9;
}

.table tbody tr:hover {
    background-color: #f9fbff;
}

.badge-present {
    background-color: #e6f4ea;
    color: #1e7e34;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 13px;
}

.badge-absent {
    background-color: #fdecea;
    color: #c82333;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 13px;
}
</style>
</head>

<body>

<%@ include file="employeeNavbar.jsp"%>

<div class="container mt-5">

<div class="attendance-card">

<h4 class="text-center mb-4">My Attendance Overview</h4>

<!-- Summary + Percentage -->
<div class="row mb-4 align-items-center">

    <div class="col-md-4 text-center">
        <div class="circle-container">
            <div class="circle">
                <div class="circle-inner">
                    <%= String.format("%.1f", percentage) %>%
                </div>
            </div>
        </div>
        <small class="text-muted d-block mt-2">Attendance Percentage</small>
    </div>

    <div class="col-md-8">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="summary-box">
                    <div class="summary-number"><%= total %></div>
                    <div class="summary-label">Total Days</div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="summary-box">
                    <div class="summary-number text-success"><%= present %></div>
                    <div class="summary-label">Present</div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="summary-box">
                    <div class="summary-number text-danger"><%= absent %></div>
                    <div class="summary-label">Absent</div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Attendance Table -->
<div class="table-responsive">
<table class="table text-center align-middle">
<thead>
<tr>
<th>#</th>
<th>Date</th>
<th>Status</th>
</tr>
</thead>

<tbody>
<%
if(attendanceList != null && !attendanceList.isEmpty()){
    int i = 1;
    for(Attendance att : attendanceList){
%>
<tr>
<td><%= i++ %></td>
<td><%= att.getAttendDate() %></td>
<td>
<% if("Present".equalsIgnoreCase(att.getStatus())) { %>
<span class="badge-present">Present</span>
<% } else { %>
<span class="badge-absent">Absent</span>
<% } %>
</td>
</tr>
<%
    }
} else {
%>
<tr>
<td colspan="3" class="text-muted py-4">
No attendance records available.
</td>
</tr>
<%
}
%>
</tbody>
</table>
</div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>