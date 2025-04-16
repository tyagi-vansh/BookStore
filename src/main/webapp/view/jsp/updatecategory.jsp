<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Category - XYZ Bookstore</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700);

    body,
    html {
      height: 100%;
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background-image: url('/images/background.jpg');
      background-size: cover;
      background-position: center;
      color: #fff;
      display: flex;
      flex-direction: column;
    }

    .header {
      background: rgba(0, 0, 0, 0.8);
      text-align: center;
      padding: 20px 0;
      position: absolute;
      width: 100%;
      top: 0;
      z-index: 10;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
    }

    .header h1 {
      margin: 0;
      font-size: 2.5rem;
    }

    /* Form styling */
    .form-container {
      background: rgba(0, 0, 0, 0.7);
      padding: 30px;
      border-radius: 10px;
      max-width: 600px;
      margin: 100px auto;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
      display: flex;
      flex-direction: column;
    }

    .form-group label {
      font-size: 1.1rem;
      margin-bottom: 10px;
    }

    .form-group input,
    .form-group select {
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #4CAF50;
      background-color: transparent;
      color: black; /* Change the font color to black */
      font-size: 1.1rem;
      outline: none;
      transition: border-color 0.3s;
    }

    .form-group input:focus,
    .form-group select:focus {
      border-color: #45a049;
    }

    .form-group button {
      background-color: #4CAF50;
      color: white;
      padding: 15px 30px;
      border-radius: 30px;
      border: none;
      font-size: 1.2rem;
      cursor: pointer;
      transition: background-color 0.3s;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .form-group button:hover {
      background-color: #45a049;
      transform: scale(1.05);
    }

    /* Back to Dashboard Button Styling */
    .back-to-dashboard-btn {
      background: #4CAF50;
      border: 1px solid white;
      color: white;
      padding: 0.75rem 2rem;
      font-size: 1.2rem;
      cursor: pointer;
      transition: 250ms background ease-in;
      border-radius: 4px;
      box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
      margin-top: 20px; /* Adds space between the update button and this button */
    }

    .back-to-dashboard-btn:hover,
    .back-to-dashboard-btn:focus {
      background: white;
      color: black;
    }
  </style>
</head>

<body>

  <div class="header">
    <h1>XYZ Bookstore</h1>
  </div>

  <div class="form-container">
    <h2>Update Category</h2>

    <form action="/edit/${upcategory.id}" method="POST">

      <div class="form-group">
        <label for="name">Category Name</label>
        <input type="text" id="name" name="name" value="${upcategory.name}" required placeholder="Enter category name">
      </div>

      <div class="form-group">
        <button type="submit">Update Category</button>
      </div>

       </form>

      <div class="form-group">
        <form action="/admindashboard" method="get">
          <button type="submit" class="back-to-dashboard-btn">Back to Admin Dashboard</button>
        </form>
      </div>


  </div>

</body>

</html>
