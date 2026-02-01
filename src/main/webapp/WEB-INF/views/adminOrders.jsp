<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Orders</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>

	<div class="container my-4">

		<h4 class="fw-bold mb-4">📦 All Orders</h4>

		<c:forEach var="order" items="${orders}">

			<div class="card mb-4 shadow-sm">
				<div class="card-body">

					<!-- HEADER -->
					<div class="d-flex justify-content-between align-items-center mb-3">
						<div>
							<h6 class="mb-1">Order #${order.id}</h6>
							<small class="text-muted"> ${order.firstname}
								${order.lastname} </small>
						</div>

						<h5 class="text-success mb-0">₹${order.totalprice}</h5>
					</div>

					<!-- BOOKS -->
					<div class="mb-3">
						<c:forEach var="entry" items="${order.booksMap}">
							<div class="d-flex align-items-center mb-2">
								<img src="showimage/${entry.key.id}" class="rounded me-3"
									style="width: 70px; height: 55px; object-fit: cover;">
								<div>
									<div class="fw-semibold">${entry.key.name}</div>
									<small class="text-muted"> qty: ${entry.value} </small>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- ADDRESS -->
					<div class="bg-light p-3 rounded mb-3">
						<small class="fw-semibold">Delivery Address</small><br> <small
							class="text-muted"> ${order.address.name},
							${order.address.city} - ${order.address.zipcode} </small>
					</div>

					<!-- STATUS -->
					<div class="mt-2">
						<small class="fw-semibold d-block mb-2">Order Status</small>

						<div class="btn-group" role="group">

							<!-- PENDING -->
							<button type="button"
								class="btn btn-sm 
            ${order.status == 'pending' ? 'btn-warning' : 'btn-outline-warning'}">
								<a href="updateStatus?status=pending&order_id=${order.id}">pending</a></button>

							<!-- OUT FOR DELIVERY -->
							<button type="button"
								class="btn btn-sm 
            ${order.status == 'outfordelivery' ? 'btn-primary' : 'btn-outline-primary'}">
								<a href="updateStatus?status=out for delivery&order_id=${order.id}">out for delivery</a></button>

							<!-- DELIVERED -->
							<button type="button"
								class="btn btn-sm 
            ${order.status == 'delivered' ? 'btn-success' : 'btn-outline-success'}">
								<a href="updateStatus?status=delivered&order_id=${order.id}">delivered</a></button>

						</div>
					</div>


				</div>
			</div>

		</c:forEach>

		<!-- NO ORDERS -->
		<c:if test="${empty orders}">
			<div class="alert alert-info text-center">No orders found</div>
		</c:if>

	</div>

</body>
</html>
