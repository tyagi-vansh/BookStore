<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact Admin - Book Haven</title>
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

        /* Contact Form Section */
        .contact-form {
            padding: 3rem 1rem;
            text-align: center;
            background-color: #ffffff;
            max-width: 600px; /* Limit the max width of the form */
            margin: 0 auto; /* Center the form horizontally */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .contact-form h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .contact-form p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            font-weight: 600;
            font-size: 1rem;
            color: #333;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 1rem;
            margin-bottom: 1rem;
            outline: none;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #ff7043;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
        }

        .form-group button {
            background-color: #ff7043;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #ff5722;
        }

        /* Footer */
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

        .contact-form {
            animation: fadeIn 1s ease-out;
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
            </ul>
        </nav>
    </header>

    <section id="contact" class="contact-form">
        <h2>Contact Admin</h2>
        <p>If you have any questions or need assistance, please fill out the form below to contact our admin department.</p>
        <c:if test="${not empty success}">
            <div style="color: green; font-weight: bold;">
                ${success}
            </div>
        </c:if>
        <form method="post" action="/contact" onsubmit="return validateContactForm()">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" placeholder="Subject of your query" required>
            </div>

            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Write your message here" required></textarea>
            </div>

            <div class="form-group">
                <button type="submit">Send Message</button>
            </div>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Book Haven. All rights reserved.</p>
    </footer>

    <script>
        function validateContactForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var subject = document.getElementById("subject").value;
            var message = document.getElementById("message").value;

            if (!name || !email || !subject || !message) {
                alert("All fields are required.");
                return false;
            }
            return true;
        }
    </script>
</body>

</html>
