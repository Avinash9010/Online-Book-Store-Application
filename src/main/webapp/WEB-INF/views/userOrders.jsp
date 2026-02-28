<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
/* Page spacing */
.container {
    margin-top: 30px;
}

/* Order card */
.order-card {
    border-radius: 12px;
}

/* Book thumbnail FIX */
.book-thumbnail {
    width: 60px;          /* fixed width */
    height: 90px;         /* fixed height (book ratio) */
    object-fit: contain;  /* no stretch */
    border-radius: 6px;
    background: #fff;
    padding: 4px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

/* Order book list */
.order-books li {
    display: flex;
    align-items: center;
}

/* Status badges */
.status-badge {
    font-size: 0.75rem;
}
</style>
</head>

<body>

<div class="container">

    <!-- Heading -->
    <h4 class="fw-bold mb-4">🛒 My Orders</h4>

    <!-- Orders -->
    <c:forEach var="order" items="${orders}">
        <div class="card mb-4 shadow-sm order-card">
            <div class="card-body">
                <div class="row">

                    <!-- Left section -->
                    <div class="col-md-8">
                        <h5 class="mb-2">Order #${order.id}</h5>

                        <p class="mb-1">
                            <strong>Total Price:</strong> ₹${order.totalprice}
                            &nbsp;|&nbsp;
                            <strong>Status:</strong>

                            <c:choose>
                                <c:when test="${order.status == 'pending'}">
                                    <span class="badge bg-warning status-badge">Pending</span>
                                </c:when>
                                <c:when test="${order.status == 'out for delivery'}">
                                    <span class="badge bg-primary status-badge">Out for Delivery</span>
                                </c:when>
                                <c:when test="${order.status == 'delivered'}">
                                    <span class="badge bg-success status-badge">Delivered</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary status-badge">${order.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <p class="mb-2">
                            <strong>Shipping Address:</strong>
                            ${order.address.name},
                            ${order.address.city} - ${order.address.zipcode}
                        </p>

                        <h6 class="mt-3">Books in this order:</h6>

                        <ul class="order-books list-unstyled mt-2">
                            <c:forEach var="entry" items="${order.booksMap}">
                                <li class="mb-2">
                                    <img src="showimage/${entry.key.id}"
                                         alt="${entry.key.name}"
                                         class="book-thumbnail me-3">

                                    <div>
                                        <strong>${entry.key.name}</strong><br>
                                        Qty: ${entry.value}
                                        &nbsp;|&nbsp;
                                        ₹${entry.key.price * entry.value}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- Right section -->
                    <div class="col-md-4 text-center d-flex align-items-center justify-content-center">
                        <div>
                            <h6>Order Total</h6>
                            <h4 class="text-success">₹${order.totalprice}</h4>

                            <a href="user?page=books"
                               class="btn btn-primary btn-sm mt-3 w-100">
                                📚 Continue Shopping
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>

    <!-- No orders -->
    <c:if test="${empty orders}">
        <div class="alert alert-info text-center mt-5">
            You have no orders yet 😔 <br>
            <a href="user?page=books" class="btn btn-primary mt-3">
                📚 Browse Books
            </a>
        </div>
    </c:if>

</div>

</body>
</html>
