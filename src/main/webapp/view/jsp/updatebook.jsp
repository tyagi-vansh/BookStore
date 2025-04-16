<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Book - XYZ Bookstore</title>
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
      color: black;
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

    /* File upload button outside the input field */
    .file-upload-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 20px;
    }

    .file-upload-container input[type="file"] {
      display: none;
    }

    .file-upload-btn {
      background: #4CAF50;
      padding: 12px 30px;
      border: none;
      border-radius: 5px;
      color: #fff;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s, transform 0.2s;
    }

    .file-upload-btn:hover {
      background: #45a049;
      transform: scale(1.05);
    }

    /* Image Preview Styling */
    .image-preview {
      margin-top: 20px;
      text-align: center;
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      max-height: 300px;
      overflow-y: auto;
    }

    .image-preview img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 8px;
      margin: 5px;
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
    <h2>Update Book</h2>

    <form action="/update/${books.id}" method="POST" enctype="multipart/form-data">

      <div class="form-group">
        <label for="name">Book Name</label>
        <input type="text" id="name" name="name" value="${books.name}" required placeholder="Enter book name">
      </div>

      <div class="form-group">
        <label for="price">Price</label>
        <input type="text" id="price" name="price" value="${books.price}" required placeholder="Enter price">
      </div>

      <div class="form-group">
        <label for="category">Category</label>
        <select id="category" name="category" required>
          <option value="">Select a category</option>
          <c:forEach var="category" items="${categories}">
            <option value="${category.id}" ${category.id == upbook.category ? 'selected' : ''}>${category.name}</option>
          </c:forEach>
        </select>
      </div>

      <div class="image-preview" id="imagePreview"></div>

      <div class="form-group">
        <button type="submit">Update Book</button>
      </div>
      </form>

      <!-- Back to Admin Dashboard Button inside the form -->
      <div class="form-group">
        <form action="/admindashboard" method="get">
          <button type="submit" class="back-to-dashboard-btn">Back to Admin Dashboard</button>
        </form>
      </div>


  </div>

</body>

</html>
