<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Your Orders - Book Haven</title>
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
            background-color: #f1f1f1;
            color: #333;
            padding: 2rem;
        }

        h2 {
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 1rem;
            color: #ff7043;
        }

        .orders-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ff7043;
            color: white;
            font-weight: bold;
        }

        td {
            background-color: #f9f9f9;
        }

        .btn-back {
            background-color: #ff7043;
            color: white;
            padding: 0.8rem 2rem;
            font-size: 1rem;
            text-decoration: none;
            border-radius: 30px;
            text-align: center;
            display: inline-block;
            margin: 2rem auto;
            width: 200px;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #ff5722;
        }

        .empty-message {
            text-align: center;
            font-size: 1.2rem;
            color: #ff5722;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <h2>Your Orders</h2>

    <div class="orders-container">
        <c:if test="${not empty orders}">
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Item ID</th>
                        <th>User ID</th>
                        <th>Payment Mode</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><a href="orderView/${order.orderId}">${order.orderId}</a></td>
                            <td>${order.itemId}</td>
                            <td>${order.userId}</td>
                            <td>${order.paymentMode}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty orders}">
            <p class="empty-message">You have no orders yet. Start shopping now!</p>
        </c:if>

        <a href="/index" class="btn-back">Back to Home</a>
    </div>
</body>
</html>
