<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NAV BAR</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-primary shadow">
    <div class="container-fluid">
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="logo.jpg"width="30" height="30" class="me-2">
        <strong>MyCompany</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp">Registration</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </ul>
      </div>
    </div>
  </nav>

</body>
</html>