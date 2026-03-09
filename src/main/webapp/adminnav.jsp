<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Portal</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    background:#f5f7fa;
    font-family:'Segoe UI', sans-serif;
}

/* Navbar */
.navbar-custom{
    background:#1f2937;
}

.navbar-custom .nav-link,
.navbar-custom .navbar-brand{
    color:white !important;
    font-weight:500;
}

.navbar-custom .nav-link:hover{
    color:#0d6efd !important;
}

/* Hero Section */
.hero{
    padding:80px 20px 40px;
    text-align:center;
}

.hero h2{
    font-weight:600;
    color:#1f2937;
}

.hero p{
    color:#555;
}

/* Cards */
.card-custom{
    border:none;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card-custom:hover{
    transform:translateY(-5px);
}

/* Footer */
.footer{
    margin-top:60px;
    padding:15px;
    text-align:center;
    background:#e9ecef;
    font-size:14px;
}

</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
<div class="container">
    <a class="navbar-brand" href="#">
        <i class="bi bi-shield-lock"></i> Admin Portal
    </a>

    <button class="navbar-toggler bg-light" type="button"
        data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="adminrig.jsp">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="adminlogin.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Dashboard</a>
            </li>
        </ul>
    </div>
</div>
</nav>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>