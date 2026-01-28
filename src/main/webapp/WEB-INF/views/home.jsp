<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<title>Online Book Store</title>

<style>
body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

/* ---------------- NAVBAR ---------------- */
.topnav {
    background-color: #333;
    padding: 0.5rem 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.topnav .nav-links a {
    color: #f2f2f2;
    text-decoration: none;
    font-size: 17px;
    padding: 10px 15px;
    transition: 0.3s;
}

.topnav .nav-links a:hover {
    background-color: #ddd;
    color: black;
    border-radius: 5px;
}

.topnav .nav-links a.active {
    background-color: #04AA6D;
    color: white;
    border-radius: 5px;
}

/* Right side buttons */
.auth-buttons .btn {
    font-size: 15px;
    font-weight: 500;
    margin-left: 10px;
    transition: transform 0.2s, box-shadow 0.2s;
}

.auth-buttons .btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.auth-buttons .btn-outline-light {
    border: 1px solid #f2f2f2;
    color: #f2f2f2;
}

.auth-buttons .btn-outline-light:hover {
    background-color: #f2f2f2;
    color: #333;
}

/* ---------------- CARD FIXES ---------------- */
.card {
    height: 100%;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.card-img-top {
    height: 200px;
    object-fit: cover;
}

.card-text {
    font-size: 14px;
    color: #555;
    /* limit description lines */
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="topnav">
    <!-- Left links -->
    <div class="nav-links d-flex">
        <a class="active" href="/">Home</a>
        <a href="aboutUs">About Us</a>
        <a href="contactUs">Contact Us</a>
    </div>

    <!-- Right buttons -->
    <div class="auth-buttons d-flex">
        <a href="login" class="btn btn-outline-light">Login</a>
        <a href="signUp" class="btn btn-light">Sign Up</a>
    </div>
</div>

<div class="container text-center mt-4">
    <h1>Welcome to Our Website!</h1>
</div>

<hr class="my-4">

<h1 class="text-center mb-4">Top Courses Pdf Books Free Download</h1>

<!-- BOOK LIST -->
<div class="container">
    <div class="row g-4">
        <c:forEach var="b" items="${listOfBooks}">
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card h-100">
                    <!-- Image -->
                    <img src="showimage/${b.id}" class="card-img-top" alt="Book Image">

                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${b.name}</h5>

                        <p class="card-text">${b.description}</p>

                        <p class="fw-bold mt-auto">Price : ₹${b.price}</p>

                        <a href="buyBook" class="btn btn-info w-100" target="_blank">
                            Buy Now
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="container text-center my-5">
    <h4><b>Thank you for visiting. We hope you enjoy your stay.</b></h4>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
