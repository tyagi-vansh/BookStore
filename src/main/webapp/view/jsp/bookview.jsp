<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <title>Books Management</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);

    body,
    html {
      height: 100%;
      margin: 0;
      background-color: #2c2c2c;
      font-family: 'Open Sans', sans-serif;
      font-weight: 100;
      display: flex;
      flex-direction: column;
      overflow: scroll;
    }

    .header {
      color: white;
      text-align: center;
      font-size: 2rem;
      font-weight: bold;
      z-index: 10;
      animation: fadeIn 2s ease-out;
    }

    .header h1 {
      margin: 0;
    }

    .add-book-btn-container {
      display: flex;
      justify-content: flex-end;
      padding: 1rem;
      position: relative;
      z-index: 20;
    }

    .add-book-btn,
    .back-to-dashboard-btn {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 1.2rem;
      cursor: pointer;
      border-radius: 5px;
      transition: background 0.3s, transform 0.2s;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
      animation: fadeIn 2s ease-out;
    }

    .add-book-btn:hover,
    .back-to-dashboard-btn:hover {
      background: #45a049;
      transform: scale(1.05);
    }

    .table-container {
      animation: slideIn 2s ease-out;
      max-width: 80%;
      margin-left: auto;
      margin-right: auto;
    }

    .table-text {
      color: white;
      margin: auto;
      font-size: 35px;
      text-align: center;
    }

    table {
      width: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      border-collapse: collapse;
      margin: 1rem 0;
    }

    th,
    td {
      padding: 12px 15px;
      text-align: left;
      border: 1px solid rgba(255, 255, 255, 0.5);
      font-size: 1.2rem;
      color: white;
    }

    th {
      background-color: rgba(255, 255, 255, 0.3);
    }

    td {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .delete-button,
    .update-button {
      padding: 10px 20px;
      background-color: indianred;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      transition: background-color 0.3s;
      margin: 5px;
    }

    .delete-button:hover {
      background-color: #66bb6a;
    }

    .update-button {
      background-color: #ff9800;
    }

    .update-button:hover {
      background-color: #f57c00;
    }

    @keyframes fadeIn {
      0% {
        opacity: 0;
      }

      100% {
        opacity: 1;
      }
    }

    @keyframes slideIn {
      0% {
        transform: translateX(-100%);
      }

      100% {
        transform: translateX(0);
      }
    }

    .back-to-dashboard-btn-container {
      margin-top: 20px;
      text-align: center;
    }
  </style>
</head>

<body>

  <div class="header">
    <h1>Books Management</h1>
  </div>

  <div class="table-container">
    <p class="table-text">Manage Your Books</p>

    <div class="add-book-btn-container">
      <form class="add-book-form" action="/addbook" method="get">
        <button class="add-book-btn" type="submit">Add Book</button>
      </form>
    </div>

    <table>
      <thead>
        <tr>
          <th>Sequence</th>
          <th>Book Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:set var="counter" value="1"/>
        <c:forEach var="book" items="${Books}">
          <tr>
            <td>${counter}</td>
            <td>${book.name}</td>
            <td>${book.categoryName}</td>
            <td>${book.price}</td>
            <td>
              <a href="/updatebook/${book.id}" class="update-button">Update</a>
              <form action="/deletebook/${book.id}" method="post" style="display:inline;">
                <button type="submit" class="delete-button">Delete</button>
              </form>
            </td>
          </tr>
        <c:set var="counter" value="${counter+1}"/>
        </c:forEach>
      </tbody>
    </table>

    <div class="back-to-dashboard-btn-container">
      <form action="/admindashboard" method="get">
        <button class="back-to-dashboard-btn" type="submit">Back to Dashboard</button>
      </form>
    </div>

  </div>

</body>

</html>
