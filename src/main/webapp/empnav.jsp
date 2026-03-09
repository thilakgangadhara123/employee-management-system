<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Portal</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
	margin: 0;
	min-height: 100vh;
	background: linear-gradient(135deg, #f5f7fa, #ffffff);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Navbar */
.navbar {
	background-color: #2c3e50;
	border-radius: 12px;
	box-shadow: 0 5px 15px rgba(0,0,0,0.2);
	margin: 10px;
	padding: 10px 20px;
}

.navbar-brand {
	font-weight: 600;
	color: #fff !important;
}

.nav-link {
	margin-right: 15px;
	font-weight: 500;
	border-radius: 8px;
	padding: 5px 12px;
	transition: all 0.3s;
	color: #ecf0f1 !important;
	text-decoration: none;
}

/* Gradient hover effect for links */
.nav-link:hover {
	background: linear-gradient(90deg, #11998e, #38ef7d);
	color: white !important;
	transform: scale(1.05);
}

/* Active link */
.nav-link.active {
	background: linear-gradient(90deg, #6a11cb, #2575fc);
	color: white !important;
	font-weight: 600;
}

/* Carousel */
.carousel-inner {
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 8px 25px rgba(0,0,0,0.2);
}

.carousel-item img {
	height: 500px;
	object-fit: cover;
	border-radius: 15px;
}

.carousel-caption {
	background: rgba(0, 0, 0, 0.6);
	padding: 15px;
	border-radius: 12px;
}

/* Section Spacing */
.section-wrapper {
	padding: 40px 0;
}
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container">
		<a class="navbar-brand" href="#">Employee Portal</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" href="emprig.jsp">Register</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="emplogin.jsp">Login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="index.jsp">Main Dashboard</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- Carousel Section -->
<div class="container section-wrapper">
	<div id="demoCarousel" class="carousel slide shadow-lg" data-bs-ride="carousel">

		<!-- Indicators -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demoCarousel" data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#demoCarousel" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demoCarousel" data-bs-slide-to="2"></button>
		</div>

		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="cmp1.jpg" class="d-block w-100" alt="Slide 1">
				<div class="carousel-caption d-none d-md-block">
					<h5>Welcome to MyCompany</h5>
					<p>Providing reliable and professional services.</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="cmp4.jpg" class="d-block w-100" alt="Slide 2">
				<div class="carousel-caption d-none d-md-block">
					<h5>Innovation & Growth</h5>
					<p>Empowering employees for a better future.</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="cmp5.jpg" class="d-block w-100" alt="Slide 3">
				<div class="carousel-caption d-none d-md-block">
					<h5>Trusted Excellence</h5>
					<p>Delivering quality with commitment.</p>
				</div>
			</div>

		</div>

		<!-- Controls -->
		<button class="carousel-control-prev" type="button" data-bs-target="#demoCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>

		<button class="carousel-control-next" type="button" data-bs-target="#demoCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>

	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>