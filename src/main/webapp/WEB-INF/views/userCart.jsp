<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
body {
    background: #f4f6f9;
}

/* CART CARD */
.cart-card {
    border-radius: 18px;
    border: none;
}

/* BOOK IMAGE */
.cart-img {
    height: 90px;
    border-radius: 10px;
}

/* QTY BUTTON */
.qty-btn {
    width: 32px;
    height: 32px;
    padding: 0;
}

/* TOTAL BOX */
.total-box {
    background: #ffffff;
    border-radius: 18px;
    padding: 25px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}
</style>

</head>
<body>

<div class="container my-5">

    <h3 class="fw-bold mb-4">🛒 My Cart</h3>

    <!-- 🔴 EMPTY CART -->
    <c:if test="${empty cartList}">
        <div class="card text-center p-5 shadow-sm">
            <h4 class="mb-3">Your cart is empty 😔</h4>
            <p class="text-muted">
                Looks like you haven't added anything yet
            </p>
            <a href="user?page=books" class="btn btn-primary px-4 mt-3">
                Browse Books
            </a>
        </div>
    </c:if>

    <!-- 🟢 CART ITEMS -->
    <c:if test="${not empty cartList}">

        <div class="card cart-card shadow-sm p-4 mb-4">

            <c:set var="total" value="0" />

            <c:forEach var="c" items="${cartList}">
                <div class="row align-items-center border-bottom py-3">

                    <!-- IMAGE -->
                    <div class="col-md-2 text-center">
                        <img src="showimage/${c.book.id}" class="cart-img">
                    </div>

                    <!-- BOOK INFO -->
                    <div class="col-md-3">
                        <h6 class="fw-bold mb-1">${c.book.name}</h6>
                        <small class="text-muted">Price: ₹${c.book.price}</small>
                    </div>

                    <!-- QUANTITY -->
                    <div class="col-md-3 text-center">
                        <div class="d-inline-flex align-items-center gap-2">

                            <a href="decreaseQty?cart_id=${c.id}&user_id=${c.user.id}"
                               class="btn btn-outline-danger qty-btn">−</a>

                            <span class="fw-bold">${c.quantity}</span>

                            <a href="increaseQty?cart_id=${c.id}&user_id=${c.user.id}"
                               class="btn btn-outline-success qty-btn">+</a>

                        </div>
                    </div>

                    <!-- SUBTOTAL -->
                    <div class="col-md-2 text-center fw-bold text-success">
                        ₹${c.book.price * c.quantity}
                        <c:set var="total"
                               value="${total + (c.book.price * c.quantity)}" />
                    </div>

                    <!-- REMOVE -->
                    <div class="col-md-2 text-center">
                        <a href="removeFromCart?cart_id=${c.id}&user_id=${c.user.id}"
                           class="btn btn-outline-danger btn-sm">
                            ❌ Remove
                        </a>
                    </div>

                </div>
            </c:forEach>
        </div>

        <!-- 🧾 TOTAL SECTION -->
        <div class="row justify-content-end">
            <div class="col-md-4">
                <div class="total-box">
                    <h5 class="fw-bold mb-3">Order Summary</h5>

                    <div class="d-flex justify-content-between mb-2">
                        <span>Total Amount</span>
                        <span class="fw-bold text-success">₹${total}</span>
                    </div>

                    <a href="checkout?user_id=${user.id}"
                       class="btn btn-success w-100 mt-3 btn-lg">
                        Proceed to Checkout
                    </a>
                </div>
            </div>
        </div>

    </c:if>

</div>

</body>
</html>
