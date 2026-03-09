<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login</title>

<!-- ✅ Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	background: linear-gradient(135deg, #667eea, #764ba2);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.login-card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.login-title {
	font-weight: 600;
	margin-bottom: 25px;
	color: #2c3e50;
}

.form-control {
	border-radius: 8px;
	transition: 0.3s;
}

.form-control:focus {
	box-shadow: 0 0 8px rgba(102, 126, 234, 0.4);
	border-color: #6a11cb;
}

.btn-primary {
	border-radius: 8px;
	font-weight: 500;
	padding: 8px 25px;
	transition: 0.3s;
}

.btn-primary:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}
</style>

</head>
<body>

	<!-- ✅ Include Admin Navbar -->
	<%@ include file="adminnav.jsp"%>

	<!-- ✅ Login Form -->
	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 85vh;">

		<div class="col-md-5">
			<div class="login-card">

				<h3 class="text-center login-title">Admin Login</h3>

				<form method="post" action="AdminLoginServlet">

					<div class="mb-3">
						<input type="text" name="username" placeholder="Username"
							class="form-control" required>
					</div>

					<div class="mb-4">
						<input type="password" name="password" placeholder="Password"
							class="form-control" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

				</form>

			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>