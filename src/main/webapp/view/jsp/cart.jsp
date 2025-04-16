<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book Haven - Cart</title>
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

        /* Cart Section Styles */
        .cart-section {
            padding: 3rem 1rem;
            background-color: #fff;
            margin-top: 3rem;
        }

        .cart-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .cart-header h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .cart-items {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .cart-item img {
            width: 120px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 1rem;
        }

        .cart-item-info {
            flex-grow: 1;
        }

        .cart-item-name {
            font-size: 1.4rem;
            font-weight: 600;
        }

        .cart-item-price {
            font-size: 1.2rem;
            color: #ff7043;
        }

        .cart-item-quantity {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .cart-item-quantity button {
            background-color: #ff7043;
            color: white;
            padding: 0.5rem;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .cart-item-quantity button:hover {
            background-color: #ff5722;
        }

        .cart-total {
            display: flex;
            justify-content: space-between;
            font-size: 1.5rem;
            font-weight: 600;
            padding: 1.5rem 0;
            border-top: 2px solid #f1f1f1;
            border-bottom: 2px solid #f1f1f1;
            margin-top: 2rem;
        }

        .cart-total span {
            color: #333;
        }

        /* Checkout Section */
        .checkout-btn {
            display: flex;
            justify-content: flex-end;
            margin-top: 2rem;
        }

        .checkout-btn a {
            background-color: #ff7043;
            color: white;
            padding: 1rem 3rem;
            border-radius: 30px;
            font-size: 1.2rem;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .checkout-btn a:hover {
            background-color: #ff5722;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 1rem;
            background-color: #333;
            color: white;
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
                <li><a href="/viewcart">View Cart</a></li>

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

    <!-- Cart Section -->
    <section class="cart-section">
        <div class="cart-header">
            <h2>Your Shopping Cart</h2>
        </div>

        <div class="cart-items">

                <div class="cart-item">
                    <img src="${pageContext.request.contextPath}/view/books/${book.photos}" alt="${book.name}">
                    <div class="cart-item-info">
                        <div class="cart-item-name">${book.name}</div>
                        <div class="cart-item-price">${book.price}</div>
                    </div>
                    <div class="cart-item-quantity">
                        <button>-</button>
                        <span></span>
                        <button>+</button>
                    </div>
                </div>
        
        </div>

        <div class="cart-total">
            <span>Total:</span>
            <span>${price}</span>
        </div>

        <div class="checkout-btn">
            <a href="/address/${book.id}" >Proceed to Checkout</a>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Book Haven. All rights reserved.</p>
    </footer>
</body>
</html>
