<%@ page session="true" %>
<%@ page import="com.vcube.Dto.Employee" %>

<%
    Employee employee = (Employee) session.getAttribute("employee");
    if(employee == null){
        response.sendRedirect("emplogin.jsp");
        return;
    }

    Boolean isMarkedToday = (Boolean) request.getAttribute("isMarkedToday");
    if(isMarkedToday == null) isMarkedToday = false;

    String message = (String) session.getAttribute("message");
    String msgType = (String) session.getAttribute("msgType");

    session.removeAttribute("message");
    session.removeAttribute("msgType");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Mark Attendance</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: #f4f7fb;
    font-family: 'Segoe UI', sans-serif;
}

.main-wrapper{
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 30px;
}

.attendance-card{
    width: 100%;
    max-width: 500px;
    background: #ffffff;
    border-radius: 18px;
    padding: 45px 40px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
}

.attendance-card:hover{
    transform: translateY(-4px);
    box-shadow: 0 25px 60px rgba(0,0,0,0.12);
}

.title{
    font-weight: 700;
    color: #1e3a8a;
}

.subtitle{
    font-size: 14px;
    color: #6c757d;
}

.form-label{
    font-weight: 500;
    color: #1e3a8a;
}

.form-select{
    border-radius: 10px;
    padding: 12px;
}

.btn-submit{
    background: linear-gradient(135deg,#1e3a8a,#2563eb);
    border: none;
    padding: 12px;
    font-weight: 600;
    border-radius: 10px;
    transition: all 0.3s ease;
}

.btn-submit:hover{
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(37,99,235,0.3);
}

.success-icon{
    font-size: 45px;
    color: #28a745;
}

.already-marked-box{
    text-align: center;
    padding: 20px;
}
</style>
</head>

<body>

<%@ include file="employeeNavbar.jsp"%>

<div class="main-wrapper">

<div class="attendance-card text-center">

    <h3 class="title mb-2">
        <i class="bi bi-calendar-check me-2"></i>Mark Attendance
    </h3>

    <p class="subtitle mb-4">
        Welcome, <strong><%= employee.getUsername() %></strong><br>
        Submit your attendance for today.
    </p>

    <% if(isMarkedToday){ %>

        <div class="already-marked-box">
            <i class="bi bi-check-circle-fill success-icon"></i>
            <h5 class="mt-3 text-success">Attendance Already Marked</h5>
            <p class="text-muted">You have successfully submitted today’s attendance.</p>
        </div>

    <% } else { %>

        <form action="MarkAttendanceServlet" method="post">

            <div class="mb-4 text-start">
                <label class="form-label">Select Status</label>
                <select name="status" class="form-select" required>
                    <option value="" disabled selected>Choose your status</option>
                    <option value="Present">✅ Present</option>
                    <option value="Leave">📝 Leave</option>
                </select>
            </div>

            <button type="submit" class="btn btn-submit w-100">
                <i class="bi bi-send-check me-2"></i>Submit Attendance
            </button>

        </form>

    <% } %>

    <% if(message != null){ %>
        <div class="alert alert-<%= msgType %> mt-4">
            <%= message %>
        </div>
    <% } %>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>