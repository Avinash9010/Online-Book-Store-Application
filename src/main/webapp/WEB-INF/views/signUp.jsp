<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Sign Up - Online Book Store</title>

<style>
body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

/* Center form vertically */
.signup-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

/* Card style */
.signup-card {
    background: #fff;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 450px;
}

/* Form heading */
.signup-card h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #333;
}

/* Input styling */
.signup-card .form-control {
    border-radius: 8px;
    padding: 10px 15px;
    margin-bottom: 1rem;
    font-size: 14px;
}

/* Submit button */
.signup-card .btn-primary {
    width: 100%;
    border-radius: 8px;
    padding: 10px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.signup-card .btn-primary:hover {
    background-color: #04AA6D;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    transform: translateY(-2px);
}

/* Link under form */
.signup-card .text-center a {
    color: #04AA6D;
    text-decoration: none;
    font-weight: 500;
}

.signup-card .text-center a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="signup-container">
    <div class="signup-card">
        <h2>Create Your Account</h2>
        <form action="signup" method="post">
            <input type="text" class="form-control" name="firstname" placeholder="First Name" required>
            <input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
            <input type="text" class="form-control" name="number" placeholder="Number" required>
            <input type="email" class="form-control" name="email" placeholder="Email Address" required>
            <input type="text" class="form-control" name="username" placeholder="Username" required>
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
            <c:if test="${not empty msg}">
            	<p align="center" style="color:red">${msg}</p>
            </c:if>
            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>
        <div class="text-center mt-3">
            Already have an account? <a href="login">Login here</a>
        </div>
        <div class="text-center mt-3">
            <a href="/">Go to Home</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
