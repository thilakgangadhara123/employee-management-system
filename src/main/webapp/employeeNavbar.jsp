<%@ page session="true"%>
<%
    if(session.getAttribute("employee") == null){
        response.sendRedirect("emplogin.jsp");
        return;
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:'Poppins',sans-serif;
}

/* Modern Sticky Navbar */
.modern-navbar{
    background: linear-gradient(135deg,#111827,#1f2937);
    padding:12px 30px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
    position:sticky;
    top:0;
    z-index:1000;
}

/* Brand */
.modern-navbar .navbar-brand{
    font-size:22px;
    font-weight:700;
    color:#fff;
    letter-spacing:1px;
}

/* Nav Links */
.modern-navbar .nav-link{
    color:#d1d5db;
    font-weight:500;
    margin:0 10px;
    position:relative;
    transition:0.3s;
}

/* Animated underline */
.modern-navbar .nav-link::after{
    content:"";
    position:absolute;
    width:0%;
    height:2px;
    left:0;
    bottom:-4px;
    background:#3b82f6;
    transition:0.3s ease;
}

.modern-navbar .nav-link:hover{
    color:#ffffff;
}

.modern-navbar .nav-link:hover::after{
    width:100%;
}

/* Active link (optional highlight) */
.modern-navbar .nav-link.active{
    color:#ffffff;
    font-weight:600;
}

/* Profile Section */
.profile-section{
    display:flex;
    align-items:center;
    gap:15px;
}

/* Profile Avatar */
.profile-avatar{
    width:35px;
    height:35px;
    border-radius:50%;
    background:#3b82f6;
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    font-weight:600;
    font-size:14px;
}

/* Welcome Text */
.navbar-text{
    color:#f3f4f6;
    font-size:14px;
}

/* Modern Logout Button */
.btn-modern-logout{
    background:#ef4444;
    border:none;
    padding:6px 16px;
    border-radius:20px;
    font-size:14px;
    font-weight:500;
    transition:0.3s ease;
    color:#fff;
}

.btn-modern-logout:hover{
    background:#dc2626;
    transform:translateY(-2px);
    box-shadow:0 4px 10px rgba(0,0,0,0.3);
}
</style>

<nav class="navbar navbar-expand-lg modern-navbar">
    <div class="container-fluid">

        <!-- Brand -->
        <a class="navbar-brand" href="employeehome.jsp">
            <i class="bi bi-buildings"></i> EMS
        </a>

        <button class="navbar-toggler bg-light" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <!-- Left Links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="employeehome.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">My Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="markAttendance.jsp">Mark Attendance</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewAttendanceServlet">View Attendance</a>
                </li>
            </ul>

            <!-- Right Section -->
            <div class="profile-section">

                <div class="profile-avatar">
                    <%= session.getAttribute("employee").toString().substring(0,1).toUpperCase() %>
                </div>

                <span class="navbar-text">
                    Welcome, <%= session.getAttribute("employee") %>
                </span>

                <a href="employeeLogout" class="btn btn-modern-logout">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>

            </div>

        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>