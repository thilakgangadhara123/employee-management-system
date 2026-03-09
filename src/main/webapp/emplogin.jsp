<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<%
    if (session.getAttribute("username") != null) {
        response.sendRedirect("employeehome.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Login</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
	min-height: 100vh;
	background: linear-gradient(135deg, #f0f4f8, #ffffff); /* Soft light gradient */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	display: flex;
	flex-direction: column;
}

/* Login Card */
.login-card {
	background-color: #ffffff; /* Clean white background */
	border: 1px solid #d1d9e6; /* subtle border */
	border-radius: 15px;
	padding: 40px 30px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	color: #2c3e50;
	transition: 0.3s;
}

.login-card:hover {
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
}

/* Title */
.login-title {
	font-weight: 600;
	margin-bottom: 30px;
	color: #2c3e50;
	text-align: center;
}

/* Input fields */
.form-control {
	border-radius: 8px;
	border: 1px solid #ced4da;
	padding: 10px 15px;
	transition: 0.3s;
}

.form-control:focus {
	border-color: #1abc9c;
	box-shadow: 0 0 8px rgba(26, 188, 156, 0.3);
}

/* Button */
.btn-success {
	border-radius: 8px;
	font-weight: 500;
	padding: 10px 20px;
	transition: 0.3s;
}

.btn-success:hover {
	background-color: #16a085;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* Center the form */
.login-wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-grow: 1;
	padding: 50px 15px;
}
</style>
</head>
<body>

<!-- Include Navbar -->
<%@ include file="empnav.jsp"%>

<!-- Login Form -->
<div class="login-wrapper">
	<div class="col-md-5 col-lg-4">
		<div class="login-card">

			<h3 class="login-title">Employee Login</h3>

			<form method="post" action="LoginController">

				<div class="mb-3">
					<label class="form-label">Username</label>
					<input type="text" name="username" class="form-control"
						placeholder="Enter your username" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Password</label>
					<input type="password" name="password" class="form-control"
						placeholder="Enter your password" required>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-success w-100">
						Login
					</button>
				</div>

			</form>

		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>