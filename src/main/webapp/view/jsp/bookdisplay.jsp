    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Display</title>
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
        }

        .container {
            max-width: 1200px;
            width: 100%;
            padding: 20px;
        }

        .title {
            text-align: center;
            margin-top:40%;
            font-size: 2.5rem;
            color: #ff7043;
            margin-bottom: 40px;
        }

        .book-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background-color: white;
            width: 250px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card-img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card-info {
            padding: 15px;
            text-align: center;
        }

        .book-title {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
        }

        .book-price {
            font-size: 1.1rem;
            color: #ff7043;
            font-weight: bold;
        }

        .card:hover .card-img {
            transform: scale(1.05);
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            gap: 10px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 1rem;
            font-weight: bold;
            text-align: center;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 48%;
            border: none;
        }

        .btn-buy-now {
            background-color: #ff7043;
            color: white;
            box-shadow: 0 4px 6px rgba(255, 112, 67, 0.3);
            width:100%;
        }

        .btn-buy-now:hover {
            background-color: #e65c37;
            box-shadow: 0 6px 8px rgba(255, 112, 67, 0.5);
            transform: translateY(-3px);
        }

        .btn-buy-now:active {
            background-color: #e65c37;
            transform: translateY(1px);
            box-shadow: 0 3px 4px rgba(255, 112, 67, 0.3);
        }

        .btn-add-to-cart {
            background-color: #007bff;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.3);
            width:100%;
        }

        .btn-add-to-cart:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 8px rgba(0, 123, 255, 0.5);
            transform: translateY(-3px);
        }

        .btn-add-to-cart:active {
            background-color: #0056b3;
            transform: translateY(1px);
            box-shadow: 0 3px 4px rgba(0, 123, 255, 0.3);
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .card {
            animation: fadeIn 0.5s ease forwards;
        }

        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            display: none;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Book Collection</h1>
        <div class="book-cards">
            <c:forEach var="book" items="${books}">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/books/${book.photos}" alt="${book.name}" class="card-img">
                    <div class="card-info">
                        <h2 class="book-title">${book.name}</h2>
                        <p class="book-price">$${book.price}</p>
                    </div>
                    <div class="buttons">
                        <!-- Form for "Buy Now" button -->
                        <form action="/buy/${book.id}" method="POST">
                            <button type="submit" class="btn btn-buy-now">Buy Now</button>
                        </form>

                        <form action="/addtocart/${book.id}" method="POST" onsubmit="showAlert(event)">
                            <input type="hidden" name="bookId" value="${book.id}">
                            <button type="submit" class="btn btn-add-to-cart" >Add to Cart</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

        <div id="alertMessage" class="alert">
        Book has been added to the cart.
    </div>

    <script>
        function showAlert(event) {
            event.preventDefault();

            const alertMessage = document.getElementById('alertMessage');
            alertMessage.style.display = 'block';

            setTimeout(function() {
                alertMessage.style.display = 'none';
                event.target.submit();
            }, 2000);
        }
    </script>
</body>
</html>
