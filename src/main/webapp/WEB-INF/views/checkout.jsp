<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.checkout-btn {
	background: #0d6efd;
	color: white;
	padding: 12px;
	width: 100%;
	border-radius: 6px;
	font-weight: 600;
	border: none;
}

.summary-box {
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 8px;
	background: #fff;
}
</style>
</head>

<body>

	<div class="container my-5">

		<div class="row">

			<!-- 🔹 LEFT SIDE : BILLING ADDRESS -->
			<div class="col-md-7">
				<h4 class="mb-4">Billing Address</h4>

				<form action="placeOrder" method="post">

					<div class="row mb-3">
						<div class="col">
							<label>First Name</label> <input type="text" name="fname"
								value="${sessionScope.user.firstname}" class="form-control"
								required>
						</div>
						<div class="col">
							<label>Last Name</label> <input type="text" name="fname"
								value="${sessionScope.user.lastname}" class="form-control"
								required>
						</div>
					</div>

					<div class="mb-3">
						<label>Email</label> <input type="email"
							value="${sessionScope.user.email}" class="form-control" readonly>
					</div>

					<div class="mb-3">
						<label>Phone</label> <input type="text" name="phone"
							class="form-control" required>
					</div>

					<div class="mb-3">
						<label>Address</label> <input type="text" name="address"
							class="form-control" required>
					</div>

					<div class="row mb-3">
						<div class="col">
							<label>City</label> <input type="text" name="city"
								class="form-control" required>
						</div>
						<div class="col">
							<label>Zip Code</label> <input type="text" name="zip"
								class="form-control" required>
						</div>
					</div>

					<!-- 🔹 PAYMENT MODE -->
					<div class="mb-4">
						<label class="fw-bold mb-2 d-block">Payment Mode</label>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMode"
								value="COD" checked> <label class="form-check-label">
								Cash on Delivery </label>
						</div>

						<div class="form-check mt-1">
							<input class="form-check-input" type="radio" disabled> <label
								class="form-check-label text-muted"> Online Payment
								(Coming Soon) </label>
						</div>
					</div>

					<button class="checkout-btn">Continue to Checkout</button>

				</form>
			</div>

			<!-- 🔹 RIGHT SIDE : CART SUMMARY -->
			<div class="col-md-5">
				<div class="summary-box">
					<h5 class="mb-3">Your Cart</h5>

					<c:set var="total" value="0" />

					<c:forEach var="c" items="${cartList}">
						<div class="d-flex justify-content-between mb-2">
							<div>
								<b>${c.book.name}</b><br> <small class="text-muted">
									Qty: ${c.quantity} </small>
							</div>
							<div>₹${c.book.price * c.quantity}</div>
						</div>

						<c:set var="total" value="${total + (c.book.price * c.quantity)}" />
					</c:forEach>

					<hr>

					<div class="d-flex justify-content-between">
						<strong>Total</strong> <strong>₹${total}</strong>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
