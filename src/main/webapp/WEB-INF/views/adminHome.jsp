<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container mt-4">

	<h2 class="mb-4">👋 Welcome Admin</h2>

	<div class="row g-4">

		<div class="col-md-3">
			<div class="card shadow text-center">
				<div class="card-body">
					<h5>📚 Total Books</h5>
					<h3>${totalBooks}</h3>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow text-center">
				<div class="card-body">
					<h5>🛒 Orders</h5>
					<h3>${totalOrders}</h3>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow text-center">
				<div class="card-body">
					<h5>👥 Users</h5>
					<h3>${totalUsers}</h3>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<div class="card shadow text-center">
				<div class="card-body">
					<h5>💰 Revenue</h5>
					<h3>₹ ${revenue}</h3>
				</div>
			</div>
		</div>

	</div>

	<hr class="my-4">

	<div class="alert alert-info">
		📌 Use the sidebar to manage books, orders, and users.
	</div>

</div>
