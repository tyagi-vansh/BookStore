<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>About Us - Book Haven</title>
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

        .hero {
            background-image: url('${pageContext.request.contextPath}/view/books/lib.jpg');
            background-size: cover;
            background-position: center;
            height: 50vh;
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

        /* About Section */
        .about {
            padding: 3rem 1rem;
            text-align: center;
            background-color: #ffffff;
            animation: fadeInUp 1s ease-out;
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

        /* Team Section */
        .team {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 3rem;
        }

        .team-member {
            text-align: center;
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 1rem;
        }

        .team-member h3 {
            font-size: 1.6rem;
            margin-bottom: 0.5rem;
        }

        .team-member p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 1.5rem;
        }

        .team-member:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 1rem;
            background-color: #333;
            color: white;
        }

        /* Animation */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
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
                <li><a href="/index">Home</a></li>
                <li><a href="/shopbooks">Shop</a></li>
                <li><a href="/about">About Us</a></li>
                <li><a href="/admincontact">Contact</a></li>
                <li><a href="/cart">Cart</a></li>
                <li><a href="/ordersDisplay">Order</a></li>

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
            <h2>About Us</h2>
            <p>Learn more about our story and team at Book Haven.</p>
        </div>
    </div>

    <section class="about">
        <h2>Our Story</h2>
        <p>Book Haven was founded with the mission of bringing high-quality, affordable books to readers everywhere. We started as a small online bookstore, and over time, we have grown into a beloved brand, known for offering a wide range of genres and authors.</p>
    </section>

    <!-- Team Section -->
    <section class="team">
        <div class="team-member">
            <img src="${pageContext.request.contextPath}/view/books/1.jpg" alt="Team Member 1">
            <h3>Nimisha Manglik</h3>
            <p>Founder & CEO</p>
            <p>Nimisha is passionate about books and reading. He founded Book Haven with a vision of making books more accessible to readers everywhere.</p>
        </div>
        <div class="team-member">
            <img src="${pageContext.request.contextPath}/view/books/2.jpg" alt="Team Member 2">
            <h3>Vansh Tyagi</h3>
            <p>Marketing Director</p>
            <p>Vansh oversees our marketing strategy, making sure we connect with book lovers all around the world.</p>
        </div>
        <div class="team-member">
            <img src="${pageContext.request.contextPath}/view/books/3.png" alt="Team Member 3">
            <h3>Xyz</h3>
            <p>Head of Operations</p>
            <p>Xyz ensures our operations run smoothly, from order fulfillment to customer support.</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Book Haven. All Rights Reserved.</p>
    </footer>
</body>
</html>
