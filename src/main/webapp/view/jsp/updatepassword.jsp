<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password - XYZ Bookstore</title>
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

        /* Change Password Box */
        .change-password-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
        }

        .change-password-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 2em;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 10px 30px;
            border-radius: 12px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.6s ease-out;
        }

        .change-password-box:hover {
            transform: scale(1.05);
        }

        .change-password-box h3 {
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

        /* Back to Dashboard Button */
        .back-to-dashboard-btn {
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            width: 100%;
            margin-top: 20px;
        }

        .back-to-dashboard-btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        /* Info Text */
        .info {
            font-size: 0.9em;
            margin-top: 1em;
            color: #bbb;
        }

        /* Error Message */
        .error {
            color: red;
            margin-top: 10px;
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
            .change-password-box {
                width: 90%;
                padding: 1.5em;
            }
        }
    </style>
</head>

<body>

    <div class="change-password-container">
                    <c:if test="${not empty errorMessage}">
                        <div class="error">
                            <p>${errorMessage}</p>
                        </div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="error">
                            <p>${success}</p>
                        </div>
                    </c:if>

        <div class="change-password-box">
            <h3>Change Password</h3>
            <form id="passwordForm" method="post" action="/submitPasswordChange">
                <div class="input-group">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="oldpassword" placeholder="Enter your current password" required>
                </div>

                <div class="input-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newpassword" placeholder="Enter your new password" required>
                </div>

                <div class="input-group">
                    <label for="confirmPassword">Confirm New Password</label>
                    <input type="password" id="confirmPassword" name="confirmpassword" placeholder="Confirm your new password" required>
                </div>

                <button type="submit">Change Password</button>

                <p class="info">Please ensure your new password and confirm password match.</p>

                <div id="errorMessage" class="error" style="display: none;">
                    <p>The new password and confirm password do not match. Please try again.</p>
                </div>
            </form>


            <form action="/admindashboard" method="get">
                <button type="submit" class="back-to-dashboard-btn">Back to Admin Dashboard</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById("passwordForm").onsubmit = function(event) {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (newPassword !== confirmPassword) {
                event.preventDefault();
                document.getElementById("errorMessage").style.display = "block";
            }
        };
    </script>

</body>

</html>
