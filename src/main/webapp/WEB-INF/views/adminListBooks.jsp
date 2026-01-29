<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="container mt-4">
    <h3 class="mb-4">📚 Book List</h3>

    <!-- 🔍 Search Bar -->
    <form action="admin" method="get" class="mb-4">
        <input type="hidden" name="page" value="adminListBooks">

        <div class="row">
            <div class="col-md-4">
                <input type="text" name="keyword"
                       value="${param.keyword}"
                       class="form-control"
                       placeholder="🔍 Search by name or category">
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary w-100">Search</button>
            </div>
        </div>
    </form>

    <!-- 📚 Book Cards -->
    <div class="row">
        <c:forEach var="b" items="${listOfBooks}">
            <div class="col-md-4 mb-4 book-card">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-primary">${b.name}</h5>
                        <p class="mb-1"><strong>Category:</strong> ${b.category}</p>
                        <p><strong>Price:</strong>
                            <span class="text-success fw-bold">₹${b.price}</span>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


