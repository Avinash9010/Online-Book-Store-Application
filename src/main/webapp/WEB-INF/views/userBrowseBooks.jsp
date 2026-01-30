<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- 🔹 Categories -->
<ul class="nav nav-pills mb-4">
    <li class="nav-item">
        <a href="user?page=books&category=all" class="nav-link active">All</a>
    </li>
    <li class="nav-item">
        <a href="user?page=books&category=programming" class="nav-link">Programming</a>
    </li>
    <li class="nav-item">
        <a href="user?page=books&category=fiction" class="nav-link">Fiction</a>
    </li>
    <li class="nav-item">
        <a href="user?page=books&category=business" class="nav-link">Business</a>
    </li>
    <li class="nav-item">
        <a href="user?page=books&category=science" class="nav-link">Science</a>
    </li>
</ul>

<!-- 🔹 HORIZONTAL BOOK LIST -->
<c:forEach var="b" items="${listOfBooks}">
    <div class="card mb-3 shadow-sm">
        <div class="row g-0 align-items-center">

            <!-- Image -->
            <div class="col-md-2 text-center">
                <img src="showimage/${b.id}"
                     class="img-fluid rounded-start"
                     style="height:140px; object-fit:cover;"
                     alt="Book Image">
            </div>

            <!-- Book Info -->
            <div class="col-md-6">
                <div class="card-body">
                    <h5 class="card-title">${b.name}</h5>
                    <p class="card-text text-muted">${b.description}</p>
                </div>
            </div>

            <!-- Price & Actions -->
            <div class="col-md-4 text-center">
                <div class="card-body">
                    <h5 class="text-success mb-3">₹${b.price}</h5>

                    <!-- Buy Now -->
                    <a href="buyBook?book_id=${b.id}&user_id=${user.id}"
                       class="btn btn-sm btn-primary mb-2 w-75">
                        Buy Now
                    </a>

                    <!-- Add to Cart -->
                    <a href="addToCart?book_id=${b.id}&user_id=${user.id}&category=${b.category}"
                       class="btn btn-sm btn-outline-success w-75">
                        🛒 Add to Cart
                    </a>
                </div>
            </div>

        </div>
    </div>
</c:forEach>
