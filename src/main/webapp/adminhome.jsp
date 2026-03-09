<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String admin = (String) session.getAttribute("adminName");

if (admin == null) {
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #eef2f7, #dbeafe);
	min-height: 100vh;
	font-family: Segoe UI;
}

.dashboard-card {
	background: white;
	border-radius: 15px;
	padding: 30px;
	text-align: center;
	transition: 0.3s;
	cursor: pointer;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}

.dashboard-card:hover {
	transform: translateY(-5px);
}

.card-icon {
	font-size: 40px;
	color: #4f46e5;
	margin-bottom: 15px;
}
</style>

</head>

<body>

	<%@ include file="adminNavbar.jsp"%>

	<div class="container mt-5">

		<h2 class="text-center mb-4">
			Welcome,
			<%=admin%>
		</h2>

		<div class="row justify-content-center g-4">

			<!-- Employees -->

			<div class="col-md-4">
				<div class="dashboard-card" onclick="location.href='viewEmployees'">

					<i class="bi bi-people card-icon"></i>

					<h5>Employees</h5>

					<p>Manage employee records</p>

				</div>
			</div>


			<!-- Attendance -->

			<div class="col-md-4">
				<div class="dashboard-card"
					onclick="location.href='AdminViewAttendance'">

					<i class="bi bi-calendar-check card-icon"></i>

					<h5>Attendance</h5>

					<p>View employee attendance</p>

				</div>
			</div>

		</div>

	</div>

</body>
</html>