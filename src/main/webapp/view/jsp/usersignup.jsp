<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Signup - XYZ Bookstore</title>
    <link rel="stylesheet" href="main.css">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            min-height: fit-content;
        }

        html, body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('/images/bookstore.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            height: 100vh;
        }

        .signup-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .signup-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 1.2em;
            margin-top: 50px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 10px 30px;
            border-radius: 12px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.6s ease-out;
        }

        /* Hover Effects */
        .signup-box:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease;
        }

        .signup-box h3 {
            font-size: 1.6em;
            margin-bottom: 1em;
            color: #ffd54f;
            font-weight: 600;
        }

        /* Input Group */
        .input-group {
            margin-bottom: 1.2em;
            text-align: left;
            display: flex;
            flex-direction: column;
        }

        .input-group label {
            font-weight: bold;
            font-size: 1em;
            color: #fff;
            margin-bottom: 8px;
        }

        .input-group input {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ff7043;
            font-size: 1em;
            background-color: transparent;
            color: #fff;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #ffd54f;
        }

        button {
            background-color: #ff7043;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            font-size: 1em;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #ff5722;
            transform: scale(1.05);
        }

        /* Info Text */
        .info {
            font-size: 0.9em;
            margin-top: 1em;
            color: #bbb;
        }

        /* Error Message */
        .error-message {
            color: #ff4c4c;
            font-size: 1em;
            margin-top: 0.5em;
            display: none; /* Initially hidden */
        }

        /* Fade In Animation */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Additional Animations */
        .input-group input {
            animation: fadeIn 1s ease-out;
        }

        button {
            animation: fadeIn 1.5s ease-out;
        }

        /* Media Query */
        @media(max-width: 600px) {
            .signup-box {
                width: 90%;
                padding: 1.5em;
            }
        }
    </style>
</head>

<body>

    <div class="signup-container">
        <div class="signup-box">
            <h3>User Signup</h3>
            <c:if test="${not empty errorMessage}">
                <p id="error-message" class="error-message">${errorMessage}</p>
            </c:if>
            <form method="post" action="/usersignup" onsubmit="return validateForm()">
                <div class="input-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name" required>
                </div>

                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="input-group">
                    <label for="mobile">Mobile Number</label>
                    <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <div class="input-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                </div>

                <p id="error-message" class="error-message"></p>

                <button type="submit">Sign Up</button>

                <p class="info">Please enter your details to create a new account.</p>
            </form>
        </div>
    </div>

    <script>
        function validatePasswordMatch() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorMessage = document.getElementById("error-message");
            if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match. Please make sure both fields are identical.";
                errorMessage.style.display = "block";
            } else {
                errorMessage.textContent = "";
                errorMessage.style.display = "none";
            }
        }
        document.getElementById("password").addEventListener("input", validatePasswordMatch);
        document.getElementById("confirmPassword").addEventListener("input", validatePasswordMatch);
         window.onload = function() {
                    var errorMessageElement = document.getElementById("error-message");
                    if (errorMessageElement && errorMessageElement.textContent.trim() !== "") {
                        errorMessageElement.style.display = "block";
                    }
                };
    </script>
</body>
</html>
