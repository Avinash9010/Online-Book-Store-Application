<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>
/* 🔹 Layout */
body {
    background-color: #f5f7fb;
}

/* 🔹 Sidebar */
.sidebar {
    height: 100vh;
    position: sticky;
    top: 0;
    background: linear-gradient(180deg, #0d6efd, #084298);
    padding-top: 20px;
}

/* Admin title */
.sidebar h4 {
    font-weight: 700;
    letter-spacing: 1px;
}

/* Sidebar links */
.sidebar a {
    color: #e9f1ff;
    padding: 12px 22px;
    display: flex;
    align-items: center;
    gap: 10px;
    text-decoration: none;
    font-size: 15px;
    border-left: 4px solid transparent;
    transition: 0.3s ease;
}

/* Hover effect */
.sidebar a:hover {
    background-color: rgba(255, 255, 255, 0.15);
    border-left: 4px solid #fff;
}

/* Active menu */
.sidebar a.active {
    background-color: rgba(255, 255, 255, 0.25);
    border-left: 4px solid #fff;
    font-weight: 600;
}

/* Content area */
.content-area {
    padding: 25px;
    min-height: 100vh;
}

/* Top header inside content */
.page-header {
    background: white;
    padding: 15px 25px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.06);
    margin-bottom: 20px;
}
</style>
</head>

<body>

<div class="container-fluid">
    <div class="row">

        <!-- 🔹 SIDEBAR -->
        <div class="col-md-2 sidebar">
            <h4 class="text-white text-center mb-4">ADMIN PANEL</h4>

            <a href="admin?page=home"
               class="${empty page || page == 'home' ? 'active' : ''}">
                🏠 Home
            </a>

            <a href="admin?page=addBook"
               class="${page == 'addBook' ? 'active' : ''}">
                ➕ Add Book
            </a>

            <a href="admin?page=updateBook"
               class="${page == 'updateBook' ? 'active' : ''}">
                ✏ Update Book
            </a>

            <a href="admin?page=adminListBooks"
               class="${page == 'adminListBooks' ? 'active' : ''}">
                📚 List Books
            </a>

            <a href="admin?page=adminOrders"
               class="${page == 'adminOrders' ? 'active' : ''}">
                🛒 Orders
            </a>

            <hr class="text-white mx-3">

            <a href="adminLogout">
                🚪 Logout
            </a>
        </div>

        <!-- 🔹 RIGHT CONTENT -->
        <div class="col-md-10 content-area">

            <!-- Header -->
            <div class="page-header">
                <h5 class="mb-0">
                    👋 Welcome, Admin
                </h5>
            </div>

            <c:choose>

                <c:when test="${empty page || page == 'home'}">
                    <jsp:include page="adminHome.jsp" />
                </c:when>

                <c:when test="${page == 'addBook'}">
                    <jsp:include page="addBook.jsp" />
                </c:when>

                <c:when test="${page == 'updateBook'}">
                    <jsp:include page="updateBook.jsp" />
                </c:when>

                <c:when test="${page == 'adminListBooks'}">
                    <jsp:include page="adminListBooks.jsp" />
                </c:when>

                <c:when test="${page == 'adminOrders'}">
                    <jsp:include page="adminOrders.jsp" />
                </c:when>

                <c:otherwise>
                    <h4>Welcome Admin</h4>
                </c:otherwise>

            </c:choose>

        </div>

    </div>
</div>

</body>
</html>
