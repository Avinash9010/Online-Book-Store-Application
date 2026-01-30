<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- 🔹 NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold text-primary" href="/">Book Store</a>

			<ul class="navbar-nav ms-auto">
				<c:if test="${empty user}">
					<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
				</c:if>
				<c:if test="${not empty user}">
					<li class="nav-item"><a class="nav-link" href="userHome">Home</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="aboutUs">About</a></li>
				<li class="nav-item"><a class="nav-link" href="contactUs">Contact</a></li>
				<c:if test="${empty user}">
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="signup">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link" href="adminLogin">Admin</a></li>
				</c:if>
				<c:if test="${not empty user }">
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
				</c:if>
			</ul>
		</div>
	</nav>

</body>
</html>