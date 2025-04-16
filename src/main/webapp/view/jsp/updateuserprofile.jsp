<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User Profile</title>
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

        /* Styling the form section */
        .form-container {
            max-width: 600px;
            margin: 3rem auto;
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #ff7043;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .form-container label {
            font-size: 1.1rem;
            color: #333;
        }

        .form-container input {
            padding: 0.8rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: border 0.3s ease;
        }

        .form-container input:focus {
            border-color: #ff7043;
        }

        .form-container button {
            padding: 1rem 2rem;
            font-size: 1.1rem;
            background-color: #ff7043;
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #ff5722;
        }

        .form-container .checkbox-label {
            font-size: 1rem;
            color: #333;
        }

        .form-container .checkbox-input {
            margin-right: 0.5rem;
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
                <li><a href="#shop">Shop</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <div class="form-container">
        <h2>Update Profile</h2>
        <form action="/updateProfile" method="POST">
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${user.name}" required />
            </div>

            <!-- Email input field, populated with the current user's email (disabled) -->
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" disabled />
            </div>

            <div>
                <label for="mobile">Mobile:</label>
                <input type="text" id="mobile" name="mobile" value="${user.mobile}" required />
            </div>

            <div>
                <label class="checkbox-label" for="emailVerification">
                    <input type="checkbox" class="checkbox-input" id="emailVerification" name="emailVerification"
                           <c:if test="${user.emailVerification}">checked</c:if>
                    /> Email Verified
                </label>
            </div>

            <div>
                <button type="submit">Update Profile</button>
            </div>
        </form>
    </div>
</body>
</html>
