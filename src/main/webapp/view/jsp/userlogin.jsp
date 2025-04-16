<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Login - XYZ Bookstore</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background-image: url('https://via.placeholder.com/1600x900');
            background-size: cover;
            background-position: center;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
        }

        .login-box {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 2.5em;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 10px 50px;
            border-radius: 12px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.6s ease-out;
        }

        .login-box h3 {
            font-size: 2em;
            color: #ffd54f; /* Contrast color */
            margin-bottom: 1.5em;
        }

        .input-group {
            margin-bottom: 1.5em;
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
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ffd54f; /* Light blue border */
            font-size: 1.1em;
            background-color: transparent;
            color: #fff;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #ff5722; /* Focus effect with pink color */
        }

        button {
            background-color: #ff7043; /* Teal color */
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 30px;
            font-size: 1.2em;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        button:hover {
            background-color: #ff5722; /* On hover, use a pink color */
            transform: scale(1.05);
        }

        .forgot-password {
            text-align: right;
            margin-top: 1em;
        }

        .forgot-password a {
            color: #ffd54f;
            font-size: 0.9em;
            text-decoration: none;
            transition: color 0.3s;
        }

        .forgot-password a:hover {
            color: #ff5722;
        }

        .info {
            font-size: 0.9em;
            margin-top: 1em;
            color: #bbb;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }

        @keyframes fadeInError {
            0% {
                opacity: 0;
                transform: translateY(-10px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

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

        /* Media Query */
        @media (max-width: 600px) {
            .login-box {
                width: 90%;
                padding: 1.5em;
            }
        }
    </style>
</head>

<body>

    <div class="login-container">
        <div class="login-box">
            <h3>User Login</h3>

            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    <h4>${errorMessage}</h4>
                </div>
            </c:if>

            <form method="post" action="/userlogin" onsubmit="return validateLoginForm()">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <div class="forgot-password">
                    <a href="/resetpassword">Forgot Password?</a>
                </div>

                <button type="submit">Login</button>

                <p class="info">Please enter your credentials to log in.</p>
            </form>
        </div>
    </div>

    <script>
        function validateLoginForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("error-message");

            if (!email || !password) {
                errorMessage.textContent = "Both fields are required.";
                return false;
            }

            errorMessage.textContent = "";
            return true;
        }
         window.onload = function() {
                            var errorMessageElement = document.getElementById("error-message");
                            if (errorMessageElement && errorMessageElement.textContent.trim() !== "") {
                                errorMessageElement.style.display = "block";
                            }
                        };
    </script>

</body>
</html>
