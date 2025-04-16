<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - XYZ Bookstore</title>
    <link rel="stylesheet" href="main.css">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@300&display=swap" rel="stylesheet">

    <!-- Google icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        /* Reset and Body */
        html, body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('/images/bookstore.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
        }

        /* Login Box */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
        }

        .login-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 2em;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 10px 30px;
            border-radius: 12px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.6s ease-out;
        }

        .login-box:hover {
            transform: scale(1.05);
        }

        .login-box h3 {
            font-size: 1.8em;
            margin-bottom: 1.5em;
            color: #fff;
        }

        /* Input Group */
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
            border: 1px solid #4CAF50;
            font-size: 1.1em;
            background-color: transparent;
            color: #fff;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #45a049;
        }

        /* Button */
        button {
            background-color: #4CAF50;
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
            background-color: #45a049;
            transform: scale(1.05);
        }

        /* Info Text */
        .info {
            font-size: 0.9em;
            margin-top: 1em;
            color: #bbb;
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

        /* Media Query */
        @media(max-width: 600px) {
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

            <h3>Admin Login</h3>
            <c:if test="${not empty errorMessage}">
                <div class="error">
                    <p>${error}</p>
                </div>
            </c:if>
            <form method="post" action="/submitLogin">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit">Login</button>

                    <p class="info">Please enter your credentials to access the admin panel.</p>

            </form>
        </div>
    </div>
    <script>
      window.onload = function() {
                                var errorMessageElement = document.getElementById("error");
                                if (errorMessageElement && errorMessageElement.textContent.trim() !== "") {
                                    errorMessageElement.style.display = "block";
                                }
                            };
    </script>

</body>

</html>
