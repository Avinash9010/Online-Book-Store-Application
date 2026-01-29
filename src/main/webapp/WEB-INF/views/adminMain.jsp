<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.sidebar {
	height: 100vh;
	background-color: #0d6efd;
}

.sidebar a {
	color: white;
	padding: 12px 20px;
	display: block;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #084298;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">

			<!-- 🔹 SIDEBAR -->
			<div class="col-md-2 sidebar">
				<h4 class="text-white text-center my-3">Admin</h4>

				<a href="admin?page=home">🏠 Home</a> <a href="admin?page=addBook">➕
					Add Book</a> <a href="admin?page=updateBook">✏ Update Book</a> <a
					href="admin?page=adminListBooks">📚 List Books</a> <a
					href="admin?page=orders">🛒 Orders</a> <a href="adminLogout">🚪
					Logout</a>
			</div>


			<!-- 🔹 RIGHT CONTENT -->
			<div class="col-md-10">
				<c:choose>

					<c:when test="${empty page || page == 'home'}">
						<jsp:include page="adminHome.jsp" />
					</c:when>

					<c:when test="${page == 'addBook'}">
						<jsp:include page="addBook.jsp" />
					</c:when>

					<c:when test="${page == 'updateBook'}">
						<jsp:include page="updateBook.jsp" />
					</c:when>

					<c:when test="${page == 'adminListBooks'}">
						<jsp:include page="adminListBooks.jsp" />
					</c:when>

					<c:when test="${page == 'orders'}">
						<jsp:include page="orders.jsp" />
					</c:when>

					<c:otherwise>
						<h4>Welcome Admin</h4>
					</c:otherwise>

				</c:choose>
			</div>


		</div>
	</div>
</body>
</html>
