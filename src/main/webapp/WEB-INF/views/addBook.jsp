<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.add-book-card {
    max-width: 600px;
    margin: 40px auto;
    padding: 30px;
    border-radius: 15px;
    background: #ffffff;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.add-book-card h3 {
    text-align: center;
    margin-bottom: 25px;
    font-weight: bold;
    color: #0d6efd;
}

.form-label {
    font-weight: 600;
}

.btn-submit {
    background-color: #0d6efd;
    color: #fff;
    font-weight: 600;
    padding: 10px;
    border-radius: 8px;
}

.btn-submit:hover {
    background-color: #0b5ed7;
}
</style>

</head>
<body>

<div class="add-book-card">
    <h3>➕ Add New Book</h3>

    <form action="addBook" method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <label class="form-label">Book Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter book name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" name="category" class="form-control" placeholder="Eg: Fiction, Science" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="3" placeholder="Book description" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Price (₹)</label>
            <input type="text" name="price" class="form-control" placeholder="Enter price" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Upload Image</label>
            <input type="file" name="image" class="form-control" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-submit">Add Book</button>
        </div>

    </form>
</div>

</body>
</html>
