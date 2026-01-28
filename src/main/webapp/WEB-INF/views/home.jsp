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

  <style type="text/css">
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .container {
      text-align: center;
      margin-top: 20px;
    }

    .topnav {
      background-color: #333;
      overflow: hidden;
    }

    .topnav a {
      float: left;
      color: #f2f2f2;
      text-align: center;
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
  </style>
</head>

<body>

  <div class="topnav">
    <a class="active" href="/home.html">Home</a>
    <a href="/about.html">About Us</a>
    <a href="/contact.html">Contact Us</a>
  </div>

  <div class="container">
    <h1>Welcome to Our Website!</h1>
  </div>

  <hr size="5" color="blue">

  <h1 class="text-center my-4">Top Courses Pdf Books Free Download</h1>

  <!-- 🔥 DYNAMIC BOOKS FROM DATABASE -->
  <div class="row row-cols-1 row-cols-md-3 m-auto my-4">

    <c:forEach var="b" items="${listOfBooks}">
      <div class="col-md-3 m-auto mb-4">
        <div class="card h-100">

          <!-- Book Image -->
          <img src="showimage/${b.id}" class="card-img-top"
               style="height:200px; object-fit:cover;" />

          <div class="card-body">
            <h5 class="card-title">${b.name}</h5>

            <p class="card-text">
              ${b.description}
            </p>

            <p class="fw-bold">
              Price : ₹${b.price}
            </p>

            <a href="download/${b.id}"
               class="btn btn-info"
               target="_blank"
               title="Download Book">
              Download Book
            </a>
          </div>

        </div>
      </div>
    </c:forEach>

  </div>

  <div class="container">
    <h2><b>Thank you for visiting. We hope you enjoy your stay.</b></h2>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>