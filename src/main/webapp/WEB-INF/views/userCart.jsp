<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<!-- Bootstrap -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

</head>
<body>

<div class="container my-5">

    <h3 class="mb-4">🛒 My Cart</h3>

    <!-- 🔴 Empty Cart -->
    <c:if test="${empty cartList}">
        <div class="alert alert-warning text-center">
            Your cart is empty 😔 <br>
            <a href="user?page=books" class="btn btn-primary mt-3">
                Browse Books
            </a>
        </div>
    </c:if>

    <!-- 🟢 Cart Items -->
    <c:if test="${not empty cartList}">

        <table class="table table-bordered align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>Image</th>
                    <th>Book Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
            </thead>

            <tbody>
                <c:set var="total" value="0" />

                <c:forEach var="c" items="${cartList}">
                    <tr>

                        <!-- Image -->
                        <td>
                            <img src="showimage/${c.book.id}"
                                 style="height:80px;">
                        </td>

                        <!-- Name -->
                        <td>${c.book.name}</td>

                        <!-- Price -->
                        <td>₹${c.book.price}</td>

                        <!-- Quantity -->
                        <td>
                            <div class="d-flex justify-content-center align-items-center gap-2">

                                <a href="decreaseQty?cart_id=${c.id}&user_id=${c.user.id}"
                                   class="btn btn-sm btn-outline-danger">➖</a>

                                <span class="fw-bold">${c.quantity}</span>

                                <a href="increaseQty?cart_id=${c.id}&user_id=${c.user.id}"
                                   class="btn btn-sm btn-outline-success">➕</a>

                            </div>
                        </td>

                        <!-- Subtotal -->
                        <td>
                            ₹${c.book.price * c.quantity}
                            <c:set var="total"
                                value="${total + (c.book.price * c.quantity)}" />
                        </td>

                        <!-- Remove -->
                        <td>
                            <a href="removeFromCart?cart_id=${c.id}&user_id=${c.user.id}"
                               class="btn btn-sm btn-danger">
                                ❌
                            </a>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 🧾 Total -->
        <div class="text-end mt-4">
            <h4>Total Amount: 
                <span class="text-success">₹${total}</span>
            </h4>

            <a href="checkout?user_id=${user.id}" class="btn btn-lg btn-success mt-3">
                Proceed to Checkout
            </a>
        </div>

    </c:if>

</div>

</body>
</html>
