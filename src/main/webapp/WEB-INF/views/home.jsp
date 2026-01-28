<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

  <title>Online Book Store</title>

  <style>
    body {
      background-color: #f2f2f2;
      font-family: Arial, sans-serif;
    }

    .topnav {
      background-color: #333;
      overflow: hidden;
    }

    .topnav a {
      float: left;
      color: #f2f2f2;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }

    .topnav a:hover {
      background-color: #ddd;
      color: black;
    }

    .topnav a.active {
      background-color: #04AA6D;
      color: white;
    }

    /* ⭐ CARD FIXES */
    .card {
      height: 100%;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .card-img-top {
      height: 200px;
      object-fit: cover;
    }

    .card-text {
      font-size: 14px;
      color: #555;

      /* limit description lines */
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
    }
  </style>
</head>

<body>

  <!-- NAVBAR -->
  <div class="topnav">
    <a class="active" href="/home.html">Home</a>
    <a href="/about.html">About Us</a>
    <a href="/contact.html">Contact Us</a>
  </div>

  <div class="container text-center mt-4">
    <h1>Welcome to Our Website!</h1>
  </div>

  <hr class="my-4">

  <h1 class="text-center mb-4">Top Courses Pdf Books Free Download</h1>

  <!-- 🔥 BOOK LIST -->
  <div class="container">
    <div class="row g-4">

      <c:forEach var="b" items="${listOfBooks}">
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card h-100">

            <!-- Image -->
            <img src="showimage/${b.id}" class="card-img-top" alt="Book Image">

            <div class="card-body d-flex flex-column">
              <h5 class="card-title">${b.name}</h5>

              <p class="card-text">${b.description}</p>

              <p class="fw-bold mt-auto">
                Price : ₹${b.price}
              </p>

              <a href="download/${b.id}"
                 class="btn btn-info w-100"
                 target="_blank">
                Download Book
              </a>
            </div>

          </div>
        </div>
      </c:forEach>

    </div>
  </div>

  <div class="container text-center my-5">
    <h4><b>Thank you for visiting. We hope you enjoy your stay.</b></h4>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
