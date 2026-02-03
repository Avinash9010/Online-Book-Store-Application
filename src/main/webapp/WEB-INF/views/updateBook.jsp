<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.update-book-card {
	max-width: 650px;
	margin: 40px auto;
	padding: 30px;
	border-radius: 15px;
	background: #ffffff;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.update-book-card h3 {
	text-align: center;
	margin-bottom: 25px;
	font-weight: bold;
	color: #198754;
}

.form-label {
	font-weight: 600;
}

.btn-update {
	background-color: #198754;
	color: #fff;
	font-weight: 600;
	padding: 10px;
	border-radius: 8px;
}

.btn-update:hover {
	background-color: #157347;
}
</style>

</head>
<body>

	<div class="update-book-card">
		<h3>✏ Update Book</h3>

		<form action="updateBook" method="post" enctype="multipart/form-data">

			<div class="mb-3">
				<label class="form-label">Book ID</label> <input type="text"
					name="id" class="form-control" placeholder="Enter Book ID" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Book Name</label> <input type="text"
					name="name" class="form-control" placeholder="Enter Book Name">
			</div>

			<div class="mb-3">
				<label class="form-label">Category</label> <input type="text"
					name="category" class="form-control"
					placeholder="Eg: Fiction, Science">
			</div>

			<div class="mb-3">
				<label class="form-label">Description</label>
				<textarea name="description" class="form-control" rows="3"
					placeholder="Update description"></textarea>
			</div>

			<div class="mb-3">
				<label class="form-label">Price (₹)</label> <input type="text"
					name="price" class="form-control" placeholder="Enter new price">
			</div>

			<div class="mb-3">
				<label class="form-label">Upload Image (optional)</label> <input
					type="file" name="image" class="form-control">
			</div>

			<c:if test="${msg == 'Book updated successfully'}">
				<p style="color: green, align:center">${msg}</p>
			</c:if>
			<c:if test="${msg == 'Book not updated'}">
				<p style="color: red, align:center">${msg}</p>
			</c:if>

			<div class="d-grid">
				<button type="submit" class="btn btn-update">Update Book</button>
			</div>

		</form>
	</div>

</body>
</html>
