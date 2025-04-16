<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shipping Address</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            width: 40%;
            margin-top:20%;
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .title {
            text-align: center;
            font-size: 2rem;
            color: #ff7043;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: #333;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            box-sizing: border-box;
            transition: border 0.3s ease;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #ff7043;
        }

        .form-group input[type="text"] {
            float: left;
            margin-bottom:20px;
        }

        #address, #city, #state, #postalCode, #country {
            width: 100%;
        }

        .form-group .half-width {
            width: 48%;
            display: inline-block;
            margin-right: 4%;
        }

        .form-group .half-width:last-child {
            margin-right: 0;
        }

        .submit-btn {
            width: 100%;
            padding: 15px;
            background-color: #ff7043;
            color: white;
            font-size: 1.2rem;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            outline: none;
        }

        .submit-btn:hover {
            background-color: #e65c37;
        }

        .submit-btn:active {
            background-color: #e65c37;
            transform: translateY(1px);
            box-shadow: 0 3px 4px rgba(255, 112, 67, 0.3);
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9rem;
            color: #777;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Custom Styles for the Checkbox */
        .form-group.checkbox-group {
               display: flex;
              flex-direction: row-reverse;
              justify-content: space-evenly;
              align-content: space-around;
              align-items: baseline;
        }

        .form-group.checkbox-group input[type="checkbox"] {
            margin-right: 10px;
        }
    </style>
    <script>
        function confirmBooking(event) {
            var confirmation = confirm("To confirm your booking, press OK.");
            if (confirmation) {
                document.getElementById('shippingForm').submit();
            } else {
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="title">Shipping Address</h1>
        <form id="shippingForm" action="/booking" method="POST" onsubmit="confirmBooking(event)">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="name" required value="${address.name}">
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required value="${address.address}">
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city" required value="${address.city}">
            </div>

            <div class="form-group">
                <label for="state">State</label>
                <input type="text" id="state" name="state" required value="${address.state}">
            </div>

            <div class="form-group">
                <label for="postalCode">Postal Code</label>
                <input type="text" id="postalCode" name="pincode" required value="${address.pincode}">
            </div>

            <div class="form-group">
                <label for="country">Country</label>
                <select id="country" name="country" required>
                    <option value="">Select your country</option>
                    <option value="USA">United States</option>
                    <option value="Canada">Canada</option>
                    <option value="UK">United Kingdom</option>
                    <option value="INDIA">India</option>
                </select>
            </div>

            <div class="form-group checkbox-group">
                <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                <label for="agreeTerms">COD</label>
            </div>

            <button type="submit" class="submit-btn">Submit Address</button>
        </form>

        <div class="footer">
            <p>Have a question? <a href="/contact">Contact us</a></p>
        </div>
    </div>
</body>
</html>
