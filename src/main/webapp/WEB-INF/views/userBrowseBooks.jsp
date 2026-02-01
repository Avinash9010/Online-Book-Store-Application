<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Books</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
/* 🔹 Sticky category bar FIX */
.category-wrapper {
    position: sticky;
    top: 70px; /* below navbar */
    z-index: 100;
}

/* transparent + glass effect */
.category-bar {
    padding: 10px 0;
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    border-bottom: 1px solid rgba(0,0,0,0.08);
}

/* spacing so content never hides behind bar */
.books-section {
    padding-top: 20px;
}

/* Book cards */
.book-card img {
    height: 140px;
    object-fit: cover;
}

.book-card {
    transition: 0.2s ease;
}

.book-card:hover {
    transform: translateY(-2px);
}
</style>
</head>

<body>

<div class="container my-4">

    <h4 class="fw-bold mb-3">📚 Browse Books</h4>

    <!-- 🔹 CATEGORY BAR -->
    <div class="category-wrapper">
        <div class="category-bar">
            <ul class="nav nav-pills gap-2">
                <li class="nav-item">
                    <a href="user?page=books&category=all"
                       class="nav-link ${empty param.category || param.category=='all' ? 'active' : ''}">
                        All
                    </a>
                </li>
                <li class="nav-item">
                    <a href="user?page=books&category=programming"
                       class="nav-link ${param.category=='programming' ? 'active' : ''}">
                        Programming
                    </a>
                </li>
                <li class="nav-item">
                    <a href="user?page=books&category=fiction"
                       class="nav-link ${param.category=='fiction' ? 'active' : ''}">
                        Fiction
                    </a>
                </li>
                <li class="nav-item">
                    <a href="user?page=books&category=business"
                       class="nav-link ${param.category=='business' ? 'active' : ''}">
                        Business
                    </a>
                </li>
                <li class="nav-item">
                    <a href="user?page=books&category=science"
                       class="nav-link ${param.category=='science' ? 'active' : ''}">
                        Science
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- 🔹 BOOK LIST -->
    <div class="books-section">

        <c:forEach var="b" items="${listOfBooks}">
            <div class="card mb-3 shadow-sm book-card">
                <div class="row g-0 align-items-center">

                    <div class="col-md-2 text-center">
                        <img src="showimage/${b.id}" class="img-fluid rounded-start">
                    </div>

                    <div class="col-md-6">
                        <div class="card-body">
                            <h5>${b.name}</h5>
                            <p class="text-muted small">${b.description}</p>
                        </div>
                    </div>

                    <div class="col-md-4 text-center">
                        <div class="card-body">
                            <h5 class="text-success mb-3">₹${b.price}</h5>

                            <a href="buyBook?book_id=${b.id}&user_id=${user.id}"
                               class="btn btn-primary btn-sm w-75 mb-2">
                                Buy Now
                            </a>

                            <a href="addToCart?book_id=${b.id}&user_id=${user.id}&category=${b.category}"
                               class="btn btn-outline-success btn-sm w-75">
                                🛒 Add to Cart
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </c:forEach>

        <c:if test="${empty listOfBooks}">
            <div class="alert alert-warning text-center">
                No books found 😔
            </div>
        </c:if>

    </div>

</div>

</body>
</html>
