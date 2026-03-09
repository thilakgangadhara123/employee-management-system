<%@ page session="true" %>
<%
    com.vcube.Dto.Employee employee =
        (com.vcube.Dto.Employee) session.getAttribute("employee");

    if(employee == null){
        response.sendRedirect("emplogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Employee Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right, #eef2f7, #f9fbfd);
    font-family: 'Segoe UI', sans-serif;
}

/* Welcome Section */
.dashboard-header{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.06);
    margin-top:25px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.dashboard-header h4{
    font-weight:600;
    margin:0;
}

.dashboard-header small{
    color:#6c757d;
}

/* Cards */
.dashboard-card{
    background:white;
    border-radius:15px;
    padding:30px;
    text-align:center;
    box-shadow:0 8px 25px rgba(0,0,0,0.05);
    transition:all 0.3s ease;
    cursor:pointer;
    height:100%;
    border:1px solid #f1f1f1;
}

.dashboard-card:hover{
    transform:translateY(-8px);
    box-shadow:0 15px 35px rgba(0,0,0,0.1);
    border-color:#0d6efd;
}

.dashboard-card i{
    font-size:38px;
    color:#0d6efd;
    margin-bottom:15px;
}

.dashboard-card h5{
    font-weight:600;
    margin-bottom:10px;
}

.dashboard-card p{
    font-size:14px;
    color:#6c757d;
}

/* Footer */
.footer{
    margin-top:60px;
    text-align:center;
    font-size:13px;
    color:#6c757d;
    padding-bottom:20px;
}
</style>
</head>

<body>

<%@ include file="employeeNavbar.jsp"%>

<div class="container">

    <!-- Welcome Section -->
    <div class="dashboard-header">
        <div>
            <h4>Welcome, <%= employee.getUsername() %></h4>
            <small id="currentDateTime"></small>
        </div>
        <div>
            <i class="bi bi-person-circle fs-2 text-primary"></i>
        </div>
    </div>

    <!-- Main Cards -->
    <div class="row mt-5 g-4">

        <div class="col-md-4">
            <div class="dashboard-card" onclick="location.href='profile.jsp'">
                <i class="bi bi-person-lines-fill"></i>
                <h5>My Profile</h5>
                <p>Manage and update your personal information.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="dashboard-card" onclick="location.href='MarkAttendanceServlet'">
                <i class="bi bi-calendar-check"></i>
                <h5>Attendance</h5>
                <p>Mark daily attendance and review records.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="dashboard-card" onclick="location.href='employeeLogout'">
                <i class="bi bi-box-arrow-right"></i>
                <h5>Logout</h5>
                <p>Securely sign out from your account.</p>
            </div>
        </div>

    </div>

    <div class="footer">
        © 2026 Employee Management System | Professional HR Portal
    </div>

</div>

<script>
function updateDateTime() {
    const now = new Date();
    document.getElementById("currentDateTime").innerHTML =
        now.toDateString() + " | " + now.toLocaleTimeString();
}
setInterval(updateDateTime,1000);
updateDateTime();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>