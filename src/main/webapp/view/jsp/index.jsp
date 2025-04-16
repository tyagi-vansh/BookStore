<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book Haven - Your Bookstore</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body and Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
        }

        /* Header Styles */
        header {
            background-color: #ff7043;
            color: white;
            padding: 1.5rem;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        header .logo h1 {
            font-size: 2rem;
            font-weight: 600;
        }

        header .nav-links {
            list-style: none;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        header .nav-links li {
            margin-left: 2rem;
            position: relative;
        }

        header .nav-links li a {
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
        }

        header .nav-links li a:hover {
            color: #ffd54f;
            transition: color 0.3s ease;
        }

        /* Dropdown Styles */
        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #ff7043;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ff5722;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Styling for the dropdown link to make it match other list items */
        .dropdown-link {
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            position: relative;
        }

        .dropdown-link:hover {
            color: #ffd54f;
            transition: color 0.3s ease;
        }

        /* Optional: adjust the margin for consistent spacing */
        .dropdown {
            margin-left: 2rem;
        }

        /* Hero Section */
        .hero {
            background-image: url('${pageContext.request.contextPath}/view/books/lib.jpg');
            background-size: cover;
            background-position: center;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            padding: 2rem;
            position: relative;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        .hero-content {
            z-index: 2;
        }

        .hero h2 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }

        .cta-btn {
            background-color: #ff7043;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            border-radius: 30px;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .cta-btn:hover {
            background-color: #ff5722;
        }

        /* Shop Section */
        .shop {
            padding: 3rem 1rem;
            text-align: center;
            background-color: #f7f7f7;
        }

        .shop h2 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
        }

        .book-cards {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 2rem;
        }

        .book-card {
            background-color: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 200px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .book-card img {
            width: 150px;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .book-card h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .book-card p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 1rem;
        }

        .book-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        /* About Section */
        .about {
            padding: 3rem 1rem;
            text-align: center;
            background-color: #ffffff;
        }

        .about h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .about p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
            color: #555;
        }

        /* Contact Section */
        .contact {
            padding: 3rem 1rem;
            text-align: center;
            background-color: #ff7043;
            color: white;
        }

        .contact h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .contact p {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
        }

        footer {
            text-align: center;
            padding: 1rem;
            background-color: #333;
            color: white;
        }

        /* Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-content, .shop, .about, .contact {
            animation: fadeIn 1s ease-out;
        }

        .auth-links {
            font-size: 1rem;
            color: white;
            font-weight: 600;
        }

        .auth-links a {
            text-decoration: none;
            color: white;
        }

        .auth-links a:hover {
            color: #ffd54f;
            transition: color 0.3s ease;
        }

        .auth-links span {
            margin: 0 0.5rem;
            color: #ffd54f;
        }

    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <h1>Book Haven</h1>
            </div>
            <ul class="nav-links">
                <li class="dropdown">
                    <a href="#" class="dropdown-link">Categories</a>
                    <div class="dropdown-content">
                        <c:forEach var="category" items="${categoryList}">
                            <a href="/category/${category.id}">${category.name}</a>
                        </c:forEach>
                    </div>
                </li>
                <li><a href="/shopbooks">Shop</a></li>
                <li><a href="/cart">Cart</a></li>
                <li><a href="/ordersDisplay">Order</a></li>
                <li><a href="/about">About Us</a></li>
                <li><a href="/admincontact">Contact Us</a></li>


                <li class="auth-links">
                    <c:if test="${not empty sessionScope.user}">
                        <a href="/updateuserprofile">Welcome, ${sessionScope.user.name}</a>
                        <span>/</span>
                        <a href="/userlogout">Logout</a>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <a href="/signup">Sign Up</a>
                        <span>/</span>
                        <a href="/login">Login</a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </header>

    <div class="hero">
        <div class="hero-content">
            <h2>Welcome to Book Haven</h2>
            <p>Your favorite online bookstore with a wide selection of books.</p>
            <a href="/shopbooks" class="cta-btn">Shop Now</a>
        </div>
    </div>

    <section class="shop">
        <h2>Top Sellers</h2>

        <div class="book-cards">
        <c:forEach var="book" items="${books}">
            <div class="book-card">
                <img src="${pageContext.request.contextPath}/view/books/${book.photos}" alt="Book Image">
                <h3>${book.name}</h3>
                <p>$${book.price}</p>
            </div>
        </c:forEach>
        </div>

    </section>

    <section class="about" onclick="location.href='/about'">
        <h2>About Us</h2>
        <p>Book Haven is a platform dedicated to bringing you the best books from various genres. We offer an extensive collection of books at affordable prices.</p>
    </section>

    <section class="contact" onclick="location.href='/admincontact'">
        <h2>Contact Us</h2>
        <p>Have any questions? Reach out to us!</p>
    </section>

    <footer>
        <p>&copy; 2025 Book Haven. All Rights Reserved.</p>
    </footer>
</body>
</html>
