<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Order Card</title>

<!-- Bootstrap (optional but recommended) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f5f5;
	padding: 20px;
}

.order-card {
	display: flex;
	align-items: center;
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 15px;
	max-width: 700px;
	margin: auto;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
}

.order-icon {
	font-size: 30px;
	margin-right: 15px;
}

.order-details {
	flex: 1;
}

.book-names {
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 5px;
}

.order-info {
	font-size: 13px;
	color: #666;
	margin-bottom: 4px;
}

.order-meta {
	font-size: 13px;
	color: #333;
}

.order-status {
	text-align: right;
}

.price {
	font-weight: bold;
	font-size: 15px;
	margin-bottom: 8px;
}

.status-btn {
	border: 1px solid #28a745;
	background: #fff;
	color: #28a745;
	padding: 4px 12px;
	border-radius: 6px;
	font-size: 12px;
	cursor: default;
}
</style>
</head>

<body>

	<h4 class="text-center mb-4">My Book Order</h4>

	<div class="order-card">

		<!-- Left Icon -->
		<div class="order-icon">📚</div>

		<!-- Middle Content -->
		<div class="order-details">
			<p class="book-names">Java Programming x 2, Data Structures x 1,
				Clean Code x 1</p>

			<p class="order-info">Bangalore, Karnataka, India - 78456</p>

			<p class="order-meta">
				Items: <strong>4</strong>
			</p>
		</div>

		<!-- Right Content -->
		<div class="order-status">
			<p class="price">₹1462.00</p>
			<button class="status-btn">Out for delivery</button>
		</div>

	</div>

</body>
</html>