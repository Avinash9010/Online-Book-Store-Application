<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

/* Success Card */
.success-card {
	background: #ffffff;
	border-radius: 18px;
	padding: 40px 30px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	max-width: 550px;
	margin: auto;
}

/* Success Icon */
.success-icon {
	font-size: 70px;
	color: #28a745;
}

/* Button */
.continue-btn {
	background: linear-gradient(135deg, #0d6efd, #084298);
	color: white;
	padding: 12px 30px;
	border-radius: 10px;
	font-weight: 600;
	text-decoration: none;
	transition: all 0.3s ease;
}

.continue-btn:hover {
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 8px 18px rgba(13, 110, 253, 0.4);
}
</style>
</head>

<body>

	<div class="container my-5">
		<div class="success-card text-center">

			<div class="success-icon mb-3">✅</div>

			<h2 class="fw-bold mb-3">Order Placed Successfully!</h2>

			<p class="text-muted mb-4">
				Thank you for your purchase 📚 <br> Your order has been
				confirmed and will be delivered soon.
			</p>

			<!-- Use absolute path with /user to ensure GET request works -->
			<a href="/orderSuccess?user_id=${user.id}" class="continue-btn">
				🛍️ Continue Shopping </a>

		</div>
	</div>


</body>
</html>
