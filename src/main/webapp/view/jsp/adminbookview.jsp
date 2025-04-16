<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book Haven - Book List</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Roboto', sans-serif;
            height: 100%;
            margin: 0;
            color: #333;
            background-image: url('/images/bookstore.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
        }

        header {
            background: rgba(255, 255, 255, 1);
            padding: 20px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 2rem;
            color: #4CAF50;
        }

        .nav-links {
            list-style: none;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            padding: 0;
        }

        .nav-links li a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            font-size: 1.1rem;
        }

        .nav-links li a:hover {
            color: #4CAF50;
            transition: color 0.3s ease;
        }

        .book-list-section {
            padding: 120px 20px 20px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .book-list-header h2 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: #4CAF50;
        }

        .book-items {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
        }

        .book-item {
            width: 700px;
            background-color: #fff;
            border-radius: 15px;
            display: flex;
            padding: 20px;
            text-align: center;
            justify-content:space-evenly;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .book-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
        }

        .book-item img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .book-item-name {
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .book-item-price {
            font-size: 1.2rem;
            color: #4CAF50;
            margin-bottom: 1rem;
        }

        .book-item-category {
            font-size: 1rem;
            color: #777;
            margin-bottom: 1rem;
        }

        .book-item button {
            background-color: #4CAF50;
            color: white;
            padding: 0.5rem;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
            width: 100%;
            transition: background-color 0.3s, transform 0.2s;
        }

        .book-item button:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        footer {
            text-align: center;
            padding: 1.5rem;
            background-color: #333;
            color: white;
            margin-top: 20px;
        }

        .profile-button {
            position: fixed;
            top: 20px;
            right: 30px;
            width: 60px;
            height: 60px;
            background: #4CAF50;
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 1.8rem;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: background 0.3s, transform 0.2s;
            z-index: 10;
        }

        .profile-button:hover {
            background: #45a049;
            transform: scale(1.05);
        }
        .address{
            width:250px;
            margin-top:50px;
        }
        .book{
            width:200px;
        }
         .address-item {
                    width: 250px;
                    background-color: #fff;
                    border-radius: 15px;
                    padding: 20px;
                    text-align: center;
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                    transition: transform 0.3s, box-shadow 0.3s;
         }
        .address-item-name {
                    font-size: 1.4rem;
                    font-weight: 600;
                    margin-top: 3rem;
                    margin-bottom: 0.5rem;
                    color: #333;
                }
                .address-item-order {
                    font-size: 1.4rem;
                    font-weight: 600;
                    margin-top: 1rem;
                    margin-bottom: 0.5rem;
                    color: #333;
                }

                .address-item-city {
                    font-size: 1.2rem;
                    color: #4CAF50;
                    margin-bottom: 1rem;
                }
        .address-item-country {
            font-size: 1rem;
            color: #777;
            margin-bottom: 1rem;
        }
        .address-item-state{
                    font-size: 1rem;
                    color: #777;
                    margin-bottom: 1rem;
        }

    </style>
</head>
<body>

    <header>
        <h1>Book Haven</h1>
        <ul class="nav-links">
            <li><a href="/admindashboard">Home</a></li>
            <li><a href="/books">Books</a></li>
            <li><a href="/orders">orders</a></li>

        </ul>
    </header>

    <section class="book-list-section">
        <div class="book-list-header">
            <h2>${books.name}</h2>
        </div>

        <div class="book-items">
            <div class="book-item">
                <div class="book">
                    <img src="${pageContext.request.contextPath}/view/books/${book.photos}" alt="${books.name}">
                    <div class="book-item-name">${book.name}</div>
                    <div class="book-item-price">$${book.price}</div>
                    <div class="book-item-category">Category:${book.categoryName}</div>
                </div>
                <div class="address">
                    <div class="address-item-order">Order Details</div>
                    <div class="address-item-name">Name:${address.name}</div>
                    <div class="address-item-city">City:${address.city}</div>
                    <div class="address-item-state">State:${address.state}</div>
                    <div class="address-item-country">Country:${address.country}</div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Book Haven. All rights reserved.</p>
    </footer>
</body>
</html>
