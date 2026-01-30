<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	<c:if test="${not empty sessionScope.user}">
		<div class="container my-4">

			<div class="alert alert-success">
				👋 Welcome <b>${sessionScope.user.firstname}</b>
			</div>

			<div class="row text-center mb-4">
				<div class="col-md-4">
					<a href="user?page=orders" class="btn btn-outline-primary w-100">
						📦 My Orders </a>
				</div>
				<div class="col-md-4">
					<a href="user?page=cart&user_id=${user.id}" class="btn btn-outline-success w-100"> 🛒 My
						Cart </a>
				</div>
				<div class="col-md-4">
					<a href="user?page=books" class="btn btn-outline-dark w-100"> 📚 Browse
						Books </a>
				</div>
			</div>

		</div>
	</c:if>

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

</body>
</html>