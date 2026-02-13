<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LOGIN PAGE</title>

<!-- ✅ Bootstrap 4 CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Include Navbar -->
	<%@ include file="nav.jsp"%>

	<!-- ✅ Carousel Section -->
	<div class="container mt-4">
		<div id="demoCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demoCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#demoCarousel" data-slide-to="1"></li>
				<li data-target="#demoCarousel" data-slide-to="2"></li>
			</ul>

			<div class="carousel-inner rounded shadow">
				<div class="carousel-item active">
					<img src="cmp1.jpg" class="d-block w-100" alt="img1"
						style="height: 500px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark text-white rounded"
						style="opacity: 0.8;">
						<h5>Welcome to MyCompany</h5>
						<p>We offer the best tech services.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="cmp4.jpg" class="d-block w-100" alt="img2"
						style="height: 500px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark text-white rounded"
						style="opacity: 0.8;">
						<h5>Empowering Innovation</h5>
						<p>Partner with us for a digital future.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="cmp5.jpg" class="d-block w-100" alt="img3"
						style="height: 500px; object-fit: cover;">
					<div
						class="carousel-caption d-none d-md-block bg-dark text-white rounded"
						style="opacity: 0.8;">
						<h5>Trusted by Top Companies</h5>
						<p>We deliver results that matter.</p>
					</div>
				</div>
			</div>

			<!-- Carousel Controls -->
			<a class="carousel-control-prev" href="#demoCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demoCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>

	<!-- ✅ Registration Form -->
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card shadow-lg p-4">
					<h4 class="text-center mb-4">Employee Login</h4>

					<form name="registration" method="post" action="LoginController">

						<div class="form-row mb-3">
							<div class="col-md-6 mb-2 mb-md-0">
								<input type="text" name="username" id="username"
									placeholder="Username" class="form-control" required>
							</div>
							<div class="col-md-6">
								<input type="password" name="password" id="password"
									placeholder="Password" class="form-control" required>
							</div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-success px-4">Submit</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
