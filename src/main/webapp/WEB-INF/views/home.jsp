<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Book Store</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

/* HERO SECTION */
.hero-section {
	background: url("images/back1.png") no-repeat center;
	background-size: cover;
	padding: 100px 0;
	color: white;
}

.hero-section h1 {
	font-weight: bold;
	font-size: 42px;
}

/* BOOK CARD */
.book-card img {
	height: 260px;
	object-fit: cover;
}

.book-title {
	font-weight: 600;
}

.price span {
	color: green;
	font-weight: bold;
}

.navbar .nav-link:hover {
	color: #0d6efd;
}

.all-books-btn {
	background-color: #0d6efd; /* Bootstrap primary blue */
	color: #ffffff;
	padding: 10px 28px;
	font-size: 16px;
	font-weight: 600;
	border-radius: 10px; /* rounded corners like image */
	text-decoration: none;
	border: none;
	display: inline-block;
}

.all-books-btn:hover {
	background-color: #0b5ed7; /* slightly darker on hover */
	color: #ffffff;
}
</style>
</head>

<body>

	<!-- 🔹 NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold text-primary" href="/">Book Store</a>

			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link active text-primary"
					href="/">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="aboutUs">About</a></li>
				<li class="nav-item"><a class="nav-link" href="contactUs">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="signup">Sign
						Up</a></li>
				<li class="nav-item"><a class="nav-link" href="adminLogin">Admin</a></li>
			</ul>
		</div>
	</nav>

	<!-- 🔹 HERO SECTION -->
	<div class="hero-section">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h6>Books by Popular Authors</h6>
					<h1>
						BUY THOUSANDS OF<br>BOOKS ONLINE
					</h1>
					<a href="#books" class="btn all-books-btn mt-3">Shop Now</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 🔹 PRODUCT OVERVIEW -->
	<div class="container my-5" id="books">
		<h4 class="fw-bold mb-4">PRODUCT OVERVIEW</h4>

		<!-- Categories (UI only for now) -->
		<ul class="nav nav-pills my-3">
			<li class="nav-item"><a href="/" class="nav-link active">All Books</a></li>
			<li class="nav-item"><a href="home?category=programming" class="nav-link">Programming</a></li>
			<li class="nav-item"><a href="home?category=fiction" class="nav-link">Fiction</a></li>
			<li class="nav-item"><a href="home?category=business" class="nav-link">Business</a></li>
			<li class="nav-item"><a href="home?category=health" class="nav-link">Health</a></li>
			<li class="nav-item"><a href="home?category=history" class="nav-link">History</a></li>
			<li class="nav-item"><a href="home?category=economics" class="nav-link">Economics</a></li>
			<li class="nav-item"><a href="home?category=science" class="nav-link">Science</a></li>
			<li class="nav-item"><a href="home?category=finance" class="nav-link">Finance</a></li>
			<li class="nav-item"><a href="home?category=politics" class="nav-link">Politics</a></li>
		</ul>

		<!-- 🔹 BOOK GRID (JSTL) -->
		<div class="row g-4">

			<c:forEach var="b" items="${listOfBooks}">
				<div class="col-sm-6 col-md-4 col-lg-3">
					<div class="card book-card h-100 shadow-sm">

						<!-- Image -->
						<img src="showimage/${b.id}" class="card-img-top" alt="Book Image">

						<div class="card-body text-center d-flex flex-column">
							<p class="book-title">${b.name}</p>

							<p class="text-muted small">${b.description}</p>

							<p class="price mt-auto">
								<span>₹${b.price}</span>
							</p>

							<a href="buyBook?id=${b.id}"
								class="btn btn-outline-primary btn-sm"> Buy Now </a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>

		<!-- 🔹 PAGINATION (UI only) -->
		<nav class="mt-4">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link">Previous</a></li>
				<li class="page-item active"><a class="page-link">1</a></li>
				<li class="page-item"><a class="page-link">2</a></li>
				<li class="page-item"><a class="page-link">Next</a></li>
			</ul>
		</nav>

	</div>

	<!-- FOOTER -->
	<div class="container text-center my-5">
		<h5>
			<b>Thank you for visiting. Happy Reading 📚</b>
		</h5>
	</div>

</body>
</html>
