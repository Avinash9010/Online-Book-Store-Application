<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Book Store</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

/* HERO */
.hero {
	background: linear-gradient(120deg, #0d6efd, #6610f2);
	color: white;
	padding: 80px 0;
	border-radius: 0 0 40px 40px;
}

.hero h1 {
	font-weight: 800;
}

.hero p {
	opacity: 0.9;
}

/* CATEGORY CHIPS */
.category-chip a {
	border-radius: 30px;
	padding: 6px 16px;
	background: #fff;
	color: #333;
	font-weight: 500;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.category-chip a:hover {
	background: #0d6efd;
	color: white;
}

/* BOOK CARD */
.book-card {
	border: none;
	border-radius: 15px;
	transition: 0.3s;
}

.book-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.book-card img {
	height: 220px;
	width: 100%;
	object-fit: contain; /* 👈 prevents image from becoming too large */
	padding: 10px; /* optional: gives breathing space */
	background: #fff;
	border-radius: 15px 15px 0 0;
}

.price {
	color: #198754;
	font-weight: bold;
	font-size: 18px;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- 🔹 HERO -->
	<section class="hero">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h1>Discover Your Next Favorite Book</h1>
					<p class="mt-3">Explore thousands of books across categories
						curated just for you.</p>
					<a href="#books" class="btn btn-light btn-lg mt-3 fw-bold">
						Explore Books 📚 </a>
				</div>
			</div>
		</div>
	</section>

	<!-- 🔹 CONTENT -->
	<div class="container my-5" id="books">

		<!-- 🔹 CATEGORY CHIPS -->
		<div class="d-flex flex-wrap gap-2 mb-4 category-chip">

			<a href="/" class="text-decoration-none">All</a> <a
				href="home?category=Programming" class="text-decoration-none">Programming</a>
			<a href="home?category=Technology" class="text-decoration-none">Technology</a>
			<a href="home?category=Business" class="text-decoration-none">Business</a>
			<a href="home?category=Finance" class="text-decoration-none">Finance</a>

			<a href="home?category=Fiction" class="text-decoration-none">Fiction</a>
			<a href="home?category=Science Fiction" class="text-decoration-none">Sci-Fi</a>
			<a href="home?category=History" class="text-decoration-none">History</a>
			<a href="home?category=Biography" class="text-decoration-none">Biography</a>

			<a href="home?category=Education" class="text-decoration-none">Education</a>
			<a href="home?category=Computer Science" class="text-decoration-none">CS</a>
			<a href="home?category=Database" class="text-decoration-none">Database</a>
			<a href="home?category=Cyber Security" class="text-decoration-none">Cyber
				Security</a> <a href="home?category=Self-Help"
				class="text-decoration-none">Self-Help</a> <a
				href="home?category=Motivation" class="text-decoration-none">Motivation</a>
			<a href="home?category=Personal Development"
				class="text-decoration-none">Personal Dev</a> <a
				href="home?category=Spirituality" class="text-decoration-none">Spirituality</a>

			<a href="home?category=Health" class="text-decoration-none">Health</a>
			<a href="home?category=Medical" class="text-decoration-none">Medical</a>

			<a href="home?category=Children" class="text-decoration-none">Children</a>
			<a href="home?category=Literature" class="text-decoration-none">Literature</a>
			<a href="home?category=Poetry" class="text-decoration-none">Poetry</a>

			<a href="home?category=Travel" class="text-decoration-none">Travel</a>
			<a href="home?category=Art & Design" class="text-decoration-none">Art
				& Design</a> <a href="home?category=Social Science"
				class="text-decoration-none">Social Science</a> <a
				href="home?category=Economics" class="text-decoration-none">Economics</a>
			<a href="home?category=Political Science"
				class="text-decoration-none">Political Science</a> <a
				href="home?category=Environment" class="text-decoration-none">Environment</a>
			<a href="home?category=Psychology" class="text-decoration-none">Psychology</a>

			<a href="home?category=Career" class="text-decoration-none">Career</a>

		</div>


		<!-- 🔹 BOOK GRID -->
		<div class="row g-4">

			<c:forEach var="b" items="${listOfBooks}">
				<div class="col-sm-6 col-md-4 col-lg-3">
					<div class="card book-card h-100">

						<img src="showimage/${b.id}" class="card-img-top">

						<div class="card-body d-flex flex-column">
							<h6 class="fw-bold">${b.name}</h6>
							<p class="text-muted small">${b.description}</p>

							<div class="mt-auto">
								<div class="price mb-2">₹${b.price}</div>
								<a href="buyBook?book_id=${b.id}"
									class="btn btn-outline-primary btn-sm w-100"> Buy Now </a>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>

		</div>

	</div>

	<!-- 🔹 FOOTER -->
	<div class="text-center py-4 bg-white mt-5">
		<small class="text-muted"> © 2026 Online Book Store • Happy
			Reading 📖 </small>
	</div>

</body>
</html>
