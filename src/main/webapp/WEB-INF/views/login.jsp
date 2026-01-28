<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Login - Online Book Store</title>

<style>
body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

/* Center form vertically */
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

/* Card style */
.login-card {
    background: #fff;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 400px;
}

/* Form heading */
.login-card h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #333;
}

/* Input styling */
.login-card .form-control {
    border-radius: 8px;
    padding: 10px 15px;
    margin-bottom: 1rem;
    font-size: 14px;
}

/* Submit button */
.login-card .btn-primary {
    width: 100%;
    border-radius: 8px;
    padding: 10px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.login-card .btn-primary:hover {
    background-color: #04AA6D;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    transform: translateY(-2px);
}

/* Link under form */
.login-card .text-center a {
    color: #04AA6D;
    text-decoration: none;
    font-weight: 500;
}

.login-card .text-center a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="login-container">
    <div class="login-card">
        <h2>Login to Your Account</h2>
        <form action="login" method="post">
            <input type="text" class="form-control" name="username" placeholder="Username or Email" required>
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="text-center mt-3">
            Don't have an account? <a href="signup">Sign Up here</a>
        </div>
        <div class="text-center mt-2">
            <a href="/forgot-password">Forgot Password?</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
