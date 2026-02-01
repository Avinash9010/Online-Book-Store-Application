<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">


</head>

<body>

	<div class="container">

		<!-- Sticky Heading -->
		<div class="orders-heading">
			<h4>🛒 My Orders</h4>
		</div>

		<!-- Orders List -->
		<c:forEach var="order" items="${orders}">
			<div class="card mb-4 shadow-sm order-card">
				<div class="card-body">
					<div class="row">

						<!-- Left: Order Info -->
						<div class="col-md-8">
							<h5 class="mb-2">Order #${order.id}</h5>
							<p class="order-meta mb-1">
								<strong>Total Price: </strong> ₹${order.totalprice}
								&nbsp;|&nbsp; <strong>Status: </strong>
								<c:choose>
									<c:when test="${order.status == 'pending'}">
										<span class="badge bg-warning status-badge">Pending</span>
									</c:when>

									<c:when test="${order.status == 'out for delivery'}">
										<span class="badge bg-primary status-badge">Out For
											Delivery</span>
									</c:when>

									<c:when test="${order.status == 'delivered'}">
										<span class="badge bg-success status-badge">Delivered</span>
									</c:when>

									<c:otherwise>
										<span class="badge bg-secondary status-badge">${order.status}</span>
									</c:otherwise>
								</c:choose>

							</p>
							<p class="order-meta mb-2">
								<strong>Shipping Address:</strong> ${order.address.name},
								${order.address.city} - ${order.address.zipcode}
							</p>

							<h6 class="mt-3">Books in this order:</h6>
							<ul class="order-books ps-3">
								<c:forEach var="entry" items="${order.booksMap}">
									<li class="d-flex align-items-center mb-2">
										<!-- Adjusted thumbnail size --> <img
										src="showimage/${entry.key.id}" alt="${entry.key.name}"
										class="book-thumbnail me-2"
										style="width: 140px; height: 80px; object-fit: cover; border-radius: 4px;">
										<div>
											<strong>${entry.key.name}</strong> - Quantity: ${entry.value}
											- ₹${entry.key.price * entry.value}
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!-- Right: Summary -->
						<div
							class="col-md-4 text-center d-flex align-items-center justify-content-center">
							<div>
								<h6>Order Total</h6>
								<h4 class="text-success">₹${order.totalprice}</h4>
								<a href="user?page=books&user_id=${user.id}"
									class="btn btn-primary btn-sm mt-3 w-100"> 📚 Continue
									Shopping </a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</c:forEach>

		<!-- No Orders Fallback -->
		<c:if test="${empty orders}">
			<div class="alert alert-info text-center mt-5">
				You have no orders yet 😔 <br> <a
					href="user?page=books&user_id=${user.id}"
					class="btn btn-primary mt-3">📚 Browse Books</a>
			</div>
		</c:if>

	</div>


</body>
</html>
