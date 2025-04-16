<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Email Verification - XYZ Bookstore</title>

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
            border: 1px solid #ffd54f; /* Light yellow border */
            font-size: 1.1em;
            background-color: transparent;
            color: #fff;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #ff5722; /* Focus effect with orange color */
        }

        button {
            background-color: #ff7043; /* Coral color */
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
            background-color: #ff5722; /* On hover, use a deeper orange color */
            transform: scale(1.05);
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

        .otp-info {
            font-size: 1em;
            color: #ffd54f;
            margin-bottom: 1em;
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
            <h3>Email Verification</h3>

            <div class="error-message" id="error-message"></div>

            <form method="post" action="/verifyotp" onsubmit="return validateOTPForm()">
                <div class="otp-info">
                    <p>We've sent an OTP to <strong>${authEmail}</strong>. Please enter it below to verify your account.</p>
                </div>

                <div class="input-group">
                    <label for="otp">Enter OTP</label>
                    <input type="text" id="userotp" name="userotp" placeholder="Enter the OTP" required maxlength="6">
                </div>

                <button type="submit">Verify OTP</button>

                <p class="info">If you haven't received an OTP, check your email or <a href="#">resend OTP</a>.</p>
            </form>
        </div>
    </div>

    <script>
        function validateOTPForm() {
            var otp = document.getElementById("otp").value;
            var errorMessage = document.getElementById("error-message");

            if (otp.length !== 6) {
                errorMessage.textContent = "OTP must be 6 digits.";
                return false;
            }

            errorMessage.textContent = "";
            return true;
        }
    </script>

</body>

</html>
