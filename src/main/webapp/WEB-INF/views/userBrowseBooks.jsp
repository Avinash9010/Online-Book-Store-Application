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
body {
    background: #f4f6f9;
}

/* 🔹 Sticky category bar */
.category-wrapper {
    position: sticky;
    top: 70px;
    z-index: 100;
}

.category-bar {
    padding: 10px 0;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(6px);
    border-bottom: 1px solid rgba(0,0,0,0.08);
}

/* 🔹 Books section spacing */
.books-section {
    padding-top: 20px;
}

/* 🔹 Book card */
.book-card {
    transition: 0.2s ease;
}
.book-card:hover {
    transform: translateY(-2px);
}

/* 🔹 Image FIX */
.book-img {
    height: 140px;
    width: 90px;
    object-fit: contain;
    background: #fff;
    padding: 6px;
}

.book-img-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
</head>

<body>

<div class="container my-4">

    <h4 class="fw-bold mb-3">📚 Browse Books</h4>

    <!-- 🔹 CATEGORY BAR -->
    <div class="category-wrapper">
        <div class="category-bar">
            <ul class="nav nav-pills gap-2 flex-wrap">

                <!-- ALL -->
                <li class="nav-item">
                    <a href="user?page=books&category=all"
                       class="nav-link ${empty param.category || param.category=='all' ? 'active' : ''}">
                        All
                    </a>
                </li>

                <!-- TECH -->
                <li class="nav-item"><a href="user?page=books&category=Programming" class="nav-link ${param.category=='Programming' ? 'active' : ''}">Programming</a></li>
                <li class="nav-item"><a href="user?page=books&category=Technology" class="nav-link ${param.category=='Technology' ? 'active' : ''}">Technology</a></li>
                <li class="nav-item"><a href="user?page=books&category=Computer Science" class="nav-link ${param.category=='Computer Science' ? 'active' : ''}">Computer Science</a></li>
                <li class="nav-item"><a href="user?page=books&category=Database" class="nav-link ${param.category=='Database' ? 'active' : ''}">Database</a></li>
                <li class="nav-item"><a href="user?page=books&category=Cyber Security" class="nav-link ${param.category=='Cyber Security' ? 'active' : ''}">Cyber Security</a></li>

                <!-- BUSINESS / FINANCE -->
                <li class="nav-item"><a href="user?page=books&category=Business" class="nav-link ${param.category=='Business' ? 'active' : ''}">Business</a></li>
                <li class="nav-item"><a href="user?page=books&category=Finance" class="nav-link ${param.category=='Finance' ? 'active' : ''}">Finance</a></li>
                <li class="nav-item"><a href="user?page=books&category=Economics" class="nav-link ${param.category=='Economics' ? 'active' : ''}">Economics</a></li>

                <!-- FICTION -->
                <li class="nav-item"><a href="user?page=books&category=Fiction" class="nav-link ${param.category=='Fiction' ? 'active' : ''}">Fiction</a></li>
                <li class="nav-item"><a href="user?page=books&category=Science Fiction" class="nav-link ${param.category=='Science Fiction' ? 'active' : ''}">Sci-Fi</a></li>
                <li class="nav-item"><a href="user?page=books&category=Literature" class="nav-link ${param.category=='Literature' ? 'active' : ''}">Literature</a></li>
                <li class="nav-item"><a href="user?page=books&category=Poetry" class="nav-link ${param.category=='Poetry' ? 'active' : ''}">Poetry</a></li>

                <!-- EDUCATION / SELF -->
                <li class="nav-item"><a href="user?page=books&category=Education" class="nav-link ${param.category=='Education' ? 'active' : ''}">Education</a></li>
                <li class="nav-item"><a href="user?page=books&category=Self-Help" class="nav-link ${param.category=='Self-Help' ? 'active' : ''}">Self-Help</a></li>
                <li class="nav-item"><a href="user?page=books&category=Motivation" class="nav-link ${param.category=='Motivation' ? 'active' : ''}">Motivation</a></li>
                <li class="nav-item"><a href="user?page=books&category=Personal Development" class="nav-link ${param.category=='Personal Development' ? 'active' : ''}">Personal Dev</a></li>
                <li class="nav-item"><a href="user?page=books&category=Psychology" class="nav-link ${param.category=='Psychology' ? 'active' : ''}">Psychology</a></li>
                <li class="nav-item"><a href="user?page=books&category=Spirituality" class="nav-link ${param.category=='Spirituality' ? 'active' : ''}">Spirituality</a></li>

                <!-- HISTORY / SOCIAL -->
                <li class="nav-item"><a href="user?page=books&category=History" class="nav-link ${param.category=='History' ? 'active' : ''}">History</a></li>
                <li class="nav-item"><a href="user?page=books&category=Social Science" class="nav-link ${param.category=='Social Science' ? 'active' : ''}">Social Science</a></li>
                <li class="nav-item"><a href="user?page=books&category=Political Science" class="nav-link ${param.category=='Political Science' ? 'active' : ''}">Political Science</a></li>

                <!-- HEALTH / OTHERS -->
                <li class="nav-item"><a href="user?page=books&category=Science" class="nav-link ${param.category=='Science' ? 'active' : ''}">Science</a></li>
                <li class="nav-item"><a href="user?page=books&category=Health" class="nav-link ${param.category=='Health' ? 'active' : ''}">Health</a></li>
                <li class="nav-item"><a href="user?page=books&category=Medical" class="nav-link ${param.category=='Medical' ? 'active' : ''}">Medical</a></li>
                <li class="nav-item"><a href="user?page=books&category=Children" class="nav-link ${param.category=='Children' ? 'active' : ''}">Children</a></li>
                <li class="nav-item"><a href="user?page=books&category=Biography" class="nav-link ${param.category=='Biography' ? 'active' : ''}">Biography</a></li>
                <li class="nav-item"><a href="user?page=books&category=Travel" class="nav-link ${param.category=='Travel' ? 'active' : ''}">Travel</a></li>
                <li class="nav-item"><a href="user?page=books&category=Environment" class="nav-link ${param.category=='Environment' ? 'active' : ''}">Environment</a></li>
                <li class="nav-item"><a href="user?page=books&category=Career" class="nav-link ${param.category=='Career' ? 'active' : ''}">Career</a></li>

            </ul>
        </div>
    </div>

    <!-- 🔹 BOOK LIST -->
    <div class="books-section">

        <c:forEach var="b" items="${listOfBooks}">
            <div class="card mb-3 shadow-sm book-card">
                <div class="row g-0 align-items-center">

                    <div class="col-md-2 book-img-wrapper">
                        <img src="showimage/${b.id}" class="book-img rounded">
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
