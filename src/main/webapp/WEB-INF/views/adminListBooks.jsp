<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<style>
/* 🔹 Page Card */
.page-card {
    background: #ffffff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.06);
}

/* 🔍 Search bar */
.search-box input {
    border-radius: 10px;
}

.search-box button {
    border-radius: 10px;
}

/* 📚 Book cards */
.book-card .card {
    border: none;
    border-radius: 14px;
    transition: all 0.3s ease;
}

.book-card .card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 22px rgba(0,0,0,0.12);
}

.book-card .card-title {
    font-weight: 600;
}

/* Category badge */
.category-badge {
    background: #e7f1ff;
    color: #0d6efd;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 13px;
}
</style>

<div class="container mt-3">

    <!-- 🔹 Page Header -->
    <div class="page-card mb-4">
        <h4 class="mb-3">📚 Book List</h4>

        <!-- 🔍 Search Bar -->
        <form action="admin" method="get" class="search-box">
            <input type="hidden" name="page" value="adminListBooks">

            <div class="row g-3 align-items-center">
                <div class="col-md-5">
                    <input type="text"
                           name="keyword"
                           value="${param.keyword}"
                           class="form-control"
                           placeholder="🔍 Search by book name or category">
                </div>

                <div class="col-md-2">
                    <button class="btn btn-primary w-100">
                        Search
                    </button>
                </div>
            </div>
        </form>
    </div>

    <!-- 📚 Book Cards -->
    <div class="row">
        <c:forEach var="b" items="${listOfBooks}">
            <div class="col-md-4 mb-4 book-card">
                <div class="card h-100">
                    <div class="card-body">

                        <h5 class="card-title text-primary mb-2">
                            ${b.name}
                        </h5>

                        <p class="mb-2">
                            <span class="category-badge">
                                ${b.category}
                            </span>
                        </p>

                        <p class="mb-0">
                            <strong>Price:</strong>
                            <span class="text-success fw-bold">
                                ₹${b.price}
                            </span>
                        </p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>
