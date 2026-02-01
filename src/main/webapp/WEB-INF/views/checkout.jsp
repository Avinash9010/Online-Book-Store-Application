<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
/* 🔹 Page background */
body {
    background: #f4f6f9;
}

/* 🔹 Card wrapper */
.checkout-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 25px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
}

/* 🔹 Section titles */
.section-title {
    font-weight: 600;
    margin-bottom: 20px;
}

/* 🔹 Checkout button */
.checkout-btn {
    background: linear-gradient(135deg, #0d6efd, #084298);
    color: white;
    padding: 14px;
    width: 100%;
    border-radius: 10px;
    font-weight: 600;
    border: none;
    transition: all 0.3s ease;
}

.checkout-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 15px rgba(13,110,253,0.4);
}

/* 🔹 Summary box */
.summary-box {
    background: #ffffff;
    border-radius: 16px;
    padding: 22px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
}

/* 🔹 Payment badge */
.payment-badge {
    background: #e7f1ff;
    color: #0d6efd;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 500;
}
</style>
</head>

<body>

<div class="container my-5">

    <div class="row g-4">

        <!-- 🔹 LEFT : BILLING ADDRESS -->
        <div class="col-md-7">
            <div class="checkout-card">

                <h4 class="section-title">📍 Billing Address</h4>

                <form action="placeOrder/${user.id}" method="post">

                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">First Name</label>
                            <input type="text" name="firstname"
                                   value="${user.firstname}"
                                   class="form-control" required>
                        </div>

                        <div class="col">
                            <label class="form-label">Last Name</label>
                            <input type="text" name="lastname"
                                   value="${user.lastname}"
                                   class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email"
                               value="${user.email}"
                               class="form-control"
                               name="email" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" name="phone"
                               class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" name="address"
                               class="form-control" required>
                    </div>

                    <div class="row mb-4">
                        <div class="col">
                            <label class="form-label">City</label>
                            <input type="text" name="city"
                                   class="form-control" required>
                        </div>

                        <div class="col">
                            <label class="form-label">Zip Code</label>
                            <input type="text" name="zipcode"
                                   class="form-control" required>
                        </div>
                    </div>

                    <!-- 🔹 PAYMENT MODE -->
                    <div class="mb-4">
                        <label class="fw-bold mb-2 d-block">Payment Method</label>

                        <div class="form-check mb-2">
                            <input class="form-check-input"
                                   type="radio"
                                   name="paymentMode"
                                   value="COD" checked>
                            <label class="form-check-label">
                                Cash on Delivery
                                <span class="payment-badge ms-2">Available</span>
                            </label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="radio" disabled>
                            <label class="form-check-label text-muted">
                                Online Payment (Coming Soon)
                            </label>
                        </div>
                    </div>

                    <button class="checkout-btn">
                        ✅ Place Order
                    </button>

                </form>
            </div>
        </div>

        <!-- 🔹 RIGHT : CART SUMMARY -->
        <div class="col-md-5">
            <div class="summary-box">

                <h5 class="section-title">🛒 Order Summary</h5>

                <c:set var="total" value="0" />

                <c:forEach var="c" items="${cartList}">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <strong>${c.book.name}</strong><br>
                            <small class="text-muted">Qty: ${c.quantity}</small>
                        </div>
                        <div class="fw-semibold">
                            ₹${c.book.price * c.quantity}
                        </div>
                    </div>

                    <c:set var="total"
                           value="${total + (c.book.price * c.quantity)}" />
                </c:forEach>

                <hr>

                <div class="d-flex justify-content-between fs-5">
                    <strong>Total</strong>
                    <strong class="text-success">₹${total}</strong>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>
