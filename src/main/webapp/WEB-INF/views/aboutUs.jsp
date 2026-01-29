<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About Us</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
}

/* NAVBAR (same as home) */
.navbar {
	background-color: #fff;
}

.navbar .nav-link {
	color: #555;
	font-weight: 500;
}

.navbar .nav-link:hover {
	color: #0d6efd;
}

.navbar-brand {
	font-weight: bold;
}

/* ABOUT SECTION */
.about-wrapper {
	background: #fff;
	padding: 50px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.section-title {
	font-weight: bold;
	text-align: center;
}

.section-divider {
	width: 80px;
	height: 4px;
	background: #0d6efd;
	margin: 10px auto 30px;
}

/* SKILLS */
.progress {
	height: 14px;
	border-radius: 10px;
}

.progress-bar {
	background-color: #0d6efd;
	font-size: 12px;
}

/* INFO BOX */
.info-box {
	background: #f1f3f5;
	border-left: 5px solid #0d6efd;
	padding: 15px;
	border-radius: 8px;
	margin-top: 20px;
}
</style>
</head>

<body>

	<!-- 🔹 NAVBAR -->
	<nav class="navbar navbar-expand-lg shadow-sm">
		<div class="container">
			<a class="navbar-brand text-primary" href="/">Book Store</a>

			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
				<li class="nav-item"><a class="nav-link active text-primary"
					href="aboutUs">About</a></li>
				<li class="nav-item"><a class="nav-link" href="contactUs">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="signup">Sign
						Up</a></li>
				<li class="nav-item"><a class="nav-link" href="signup">Admin</a></li>
			</ul>
		</div>
	</nav>

	<!-- 🔹 ABOUT CONTENT -->
	<div class="container my-5">
		<div class="about-wrapper">

			<h2 class="section-title">About Us</h2>
			<div class="section-divider"></div>

			<div class="row">
				<!-- TEXT -->
				<div class="col-md-6">
					<p class="text-muted">At our bookstore, we are passionate about
						books and reading. We believe in the power of literature to
						inspire, educate, and entertain. Whether you are an avid reader or
						just starting your journey, we have something for everyone.</p>

					<p class="text-muted">Our mission is to provide affordable,
						high-quality books to students, professionals, and book lovers
						across all categories.</p>

					<a href="/" class="btn btn-primary mt-3">Explore Books</a>
				</div>

				<!-- SKILLS -->
				<div class="col-md-6">
					<h5 class="fw-bold mb-3">Our Expertise</h5>

					<label>Web Development</label>
					<div class="progress mb-3">
						<div class="progress-bar" style="width: 90%">90%</div>
					</div>

					<label>UI Design</label>
					<div class="progress mb-3">
						<div class="progress-bar" style="width: 70%">70%</div>
					</div>

					<label>UX Design</label>
					<div class="progress mb-3">
						<div class="progress-bar" style="width: 50%">50%</div>
					</div>
				</div>
			</div>

			<!-- VISIT -->
			<div class="info-box">
				<h6 class="fw-bold">Visit Us</h6>
				<p class="mb-0">
					123 Book Street,<br> Cityville, State,<br> Country -
					12345
				</p>
			</div>

			<!-- HOURS -->
			<div class="info-box">
				<h6 class="fw-bold">Business Hours</h6>
				<p class="mb-0">
					Monday – Friday: 9:00 AM – 7:00 PM<br> Saturday – Sunday:
					10:00 AM – 6:00 PM
				</p>
			</div>

			<!-- CONTACT -->
			<div class="info-box">
				<h6 class="fw-bold">Contact Us</h6>
				<p class="mb-0">
					Phone: 123-456-7890<br> Email: info@bookstore.com
				</p>
			</div>

		</div>
	</div>

</body>
</html>
