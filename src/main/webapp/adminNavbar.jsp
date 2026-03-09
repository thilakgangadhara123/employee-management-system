<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("adminName") == null){
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
/* Modern Gradient Navbar */
.navbar {
    background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
    backdrop-filter: blur(8px);
}

.navbar-brand {
    font-weight: 700;
    font-size: 1.5rem;
    color: #fff !important;
}

.nav-link {
    font-weight: 500;
    color: #e0e0e0 !important;
    position: relative;
    transition: color 0.3s, transform 0.3s;
}

.nav-link:hover {
    color: #0d6efd !important;
    transform: scale(1.05);
}

.nav-item .bi {
    font-size: 1.1rem;
    vertical-align: middle;
    margin-right: 4px;
}

.nav-link.text-danger {
    color: #ff6b6b !important;
}

.nav-link.text-danger:hover {
    color: #ff3b3b !important;
}

/* Responsive toggler */
.navbar-toggler {
    border: none;
}

.navbar-toggler:focus {
    box-shadow: none;
}
</style>
</head>
<body>

<!-- Top Navbar -->
<nav class="navbar navbar-expand-lg sticky-top shadow-lg">
    <div class="container-fluid">

        <!-- Brand -->
        <a class="navbar-brand" href="adminhome.jsp"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</a>

        <!-- Mobile toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="topNavbar">
            <ul class="navbar-nav ms-auto align-items-center">

                <li class="nav-item">
                    <a class="nav-link" href="adminhome.jsp"><i class="bi bi-house-door-fill"></i>Admin Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="addEmployees.jsp"><i class="bi bi-person-plus-fill"></i>Add Employee</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="viewEmployees"><i class="bi bi-people-fill"></i>View Employees</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="AdminViewAttendance"><i class="bi bi-calendar-check-fill"></i>View Attendance</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-danger" href="adminLogout"><i class="bi bi-box-arrow-right"></i>Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>