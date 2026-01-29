<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Contact Us</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
}

/* NAVBAR */
.navbar {
	background-color: #fff;
}

.navbar-brand {
	font-weight: bold;
}

.nav-link {
	color: #555;
	font-weight: 500;
}

.nav-link:hover {
	color: #0d6efd;
}

/* CONTACT CARD */
.contact-card {
	background: #fff;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

/* FORM */
.form-control, .form-select {
	border-radius: 10px;
}

textarea {
	resize: none;
}

/* TITLE */
.section-title {
	font-weight: bold;
}

.section-divider {
	width: 80px;
	height: 4px;
	background: #0d6efd;
	margin: 10px auto 25px;
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
				<li class="nav-item"><a class="nav-link" href="aboutUs">About
						Us</a></li>
				<li class="nav-item"><a class="nav-link active text-primary"
					href="contactUs">Contact Us</a></li>
				<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="signup">Sign
						Up</a></li>
				<li class="nav-item"><a class="nav-link" href="signup">Admin</a></li>
			</ul>
		</div>
	</nav>

	<!-- 🔹 CONTACT FORM -->
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-7">
				<div class="contact-card">

					<h2 class="text-center section-title">Contact Us</h2>
					<div class="section-divider"></div>

					<p class="text-center text-muted">Swing by for a cup of coffee,
						or leave us a message</p>

					<!-- JSTL MESSAGE (UNCHANGED) -->
					<c:if test="${not empty msg}">
						<p class="text-center text-success fw-bold">${msg}</p>
					</c:if>

					<form action="contactUs" method="post">

						<div class="mb-3">
							<label class="form-label">First Name</label> <input type="text"
								class="form-control" name="firstname" placeholder="Your name..">
						</div>

						<div class="mb-3">
							<label class="form-label">Last Name</label> <input type="text"
								class="form-control" name="lastname"
								placeholder="Your last name..">
						</div>

						<div class="mb-3">
							<label class="form-label">Country</label> <select
								class="form-select" name="country">
								<option value="India">India</option>
								<option value="Australia">Australia</option>
								<option value="Canada">Canada</option>
								<option value="USA">USA</option>
							</select>
						</div>

						<div class="mb-4">
							<label class="form-label">Subject</label>
							<textarea class="form-control" name="subject" rows="5"
								placeholder="Write something.."></textarea>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-primary btn-lg">
								Send Message</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
