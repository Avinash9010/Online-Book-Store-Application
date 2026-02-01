<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

/* WELCOME CARD */
.welcome-card {
	background: linear-gradient(135deg, #0d6efd, #6610f2);
	color: white;
	border-radius: 20px;
	padding: 30px;
}

/* ACTION CARD */
.action-card {
	border-radius: 18px;
	border: none;
	transition: 0.3s;
	cursor: pointer;
}

.action-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.action-icon {
	font-size: 38px;
}
</style>
</head>

<body>

	<%@ include file="header.jsp"%>

	<c:if test="${not empty sessionScope.user}">
		<div class="container my-5">

			<!-- 🔹 WELCOME -->
			<div class="welcome-card mb-5">
				<h3 class="fw-bold mb-1">Welcome back,
					${sessionScope.user.firstname}! 👋</h3>
				<p class="mb-0 opacity-75">Manage your orders, cart, and explore
					new books.</p>
			</div>

			<!-- 🔹 ACTIONS -->
			<div class="row g-4 text-center">

				<div class="col-md-4">
					<a href="user?page=orders&user_id=${user.id}" class="text-decoration-none">
						<div class="card action-card p-4">
							<div class="action-icon mb-3">📦</div>
							<h5 class="fw-bold">My Orders</h5>
							<p class="text-muted small">Track and view your past orders</p>
						</div>
					</a>
				</div>

				<div class="col-md-4">
					<a href="user?page=cart&user_id=${user.id}"
						class="text-decoration-none">
						<div class="card action-card p-4">
							<div class="action-icon mb-3">🛒</div>
							<h5 class="fw-bold">My Cart</h5>
							<p class="text-muted small">Review items added to your cart</p>
						</div>
					</a>
				</div>

				<div class="col-md-4">
					<a href="user?page=books" class="text-decoration-none">
						<div class="card action-card p-4">
							<div class="action-icon mb-3">📚</div>
							<h5 class="fw-bold">Browse Books</h5>
							<p class="text-muted small">Discover books across categories
							</p>
						</div>
					</a>
				</div>

			</div>
		</div>
	</c:if>

	<!-- 🔹 DYNAMIC CONTENT -->
	<div class="container mb-5">
		<c:choose>
			<c:when test="${page == 'orders'}">
				<jsp:include page="userOrders.jsp" />
			</c:when>
			<c:when test="${page == 'cart'}">
				<jsp:include page="userCart.jsp" />
			</c:when>
			<c:when test="${page == 'books'}">
				<jsp:include page="userBrowseBooks.jsp" />
			</c:when>
		</c:choose>
	</div>

</body>
</html>
