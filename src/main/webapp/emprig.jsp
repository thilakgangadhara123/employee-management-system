<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Registration</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	min-height: 100vh;
	background: linear-gradient(135deg, #a8edea, #fed6e3);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.register-card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 15px;
	padding: 35px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}
.register-title {
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
.btn-success {
	border-radius: 8px;
	font-weight: 500;
	padding: 8px 25px;
	transition: 0.3s;
}
.btn-success:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}
</style>
</head>

<body>

<%@ include file="empnav.jsp"%>

<div class="container d-flex justify-content-center align-items-center"
	style="min-height: 85vh;">

	<div class="col-md-6">
		<div class="register-card">

			<h3 class="text-center register-title">Employee Registration</h3>

			<form method="post" action="EmployeeController">

				<div class="row mb-3">
					<div class="col-md-6 mb-2 mb-md-0">
						<input type="text" name="fname" placeholder="First Name"
							class="form-control" required>
					</div>
					<div class="col-md-6">
						<input type="text" name="lname" placeholder="Last Name"
							class="form-control" required>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-6 mb-2 mb-md-0">
						<input type="email" name="email" placeholder="Email Address"
							class="form-control" required>
					</div>
					<div class="col-md-6">
						<input type="tel" name="phno" placeholder="Mobile Number"
							pattern="[0-9]{10}" class="form-control" required>
					</div>
				</div>

				<!-- ✅ Added Department & Salary -->
				<div class="row mb-3">
					<div class="col-md-6 mb-2 mb-md-0">
						<select name="department" class="form-control" required>
							<option value="">Select Department</option>
							<option>HR</option>
							<option>IT</option>
							<option>Finance</option>
							<option>Marketing</option>
							<option>Operations</option>
						</select>
					</div>
					<div class="col-md-6">
						<input type="number" name="salary" placeholder="Salary"
							class="form-control" step="0.01" required>
					</div>
				</div>

				<div class="row mb-4">
					<div class="col-md-6 mb-2 mb-md-0">
						<input type="text" name="username" placeholder="Username"
							class="form-control" required>
					</div>
					<div class="col-md-6">
						<input type="password" name="password" placeholder="Password"
							class="form-control" required>
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-success">Register</button>
				</div>

			</form>

		</div>
	</div>

</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>