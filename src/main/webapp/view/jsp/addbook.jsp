<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Book - XYZ Bookstore</title>
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
      max-height: 300px; /* Set a fixed height for scrolling */
      overflow-y: auto; /* Enable vertical scroll */
    }

    .image-preview img {
      width: 100px;  /* Fixed width */
      height: 100px; /* Fixed height */
      object-fit: cover;  /* Ensures images fit without stretching */
      border-radius: 8px;
      margin: 5px;
    }

    /* Back to Dashboard Button */
    .back-to-dashboard-btn {
      background-color: #ff5733;
      color: white;
      padding: 15px 30px;
      border-radius: 30px;
      border: none;
      font-size: 1.2rem;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
      margin-top: 30px;
      display: block;
      width: 100%;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .back-to-dashboard-btn:hover {
      background-color: #ff704d;
      transform: scale(1.05);
    }
  </style>
</head>

<body>

  <div class="header">
    <h1>XYZ Bookstore</h1>
  </div>

  <div class="form-container">
    <h2>Add a New Book</h2>

    <form action="/addnewbook" method="POST" enctype="multipart/form-data">
      <div class="form-group">
        <label for="name">Book Name</label>
        <input type="text" id="name" name="name" required placeholder="Enter book name">
      </div>

      <div class="form-group">
        <label for="price">Price</label>
        <input type="text" id="price" name="price" required placeholder="Enter book price">
      </div>

      <div class="image-preview" id="imagePreview">
        <p>No images selected</p>
      </div>

      <div class="form-group file-upload-container">
        <label for="photos" class="file-upload-btn">Upload Book Photos</label>
        <input type="file" id="photos" name="photos" multiple required onchange="displayImages(this)">
      </div>

      <div class="form-group">
        <label for="category">Select Category</label>
        <select id="category" name="category" required>
          <option value="">Select Category</option>
          <c:forEach var="category" items="${categoryList}">
            <option value="${category.id}">${category.name}</option>
          </c:forEach>
        </select>
      </div>

      <div class="form-group">
        <button type="submit">Add Book</button>
      </div>
    </form>

    <!-- Back to Dashboard Button -->
    <button class="back-to-dashboard-btn" onclick="window.location.href='/dashboard'">Back to Dashboard</button>
  </div>

  <script>
    function displayImages(input) {
      const previewContainer = document.getElementById('imagePreview');
      previewContainer.innerHTML = '';
      if (input.files && input.files.length > 0) {
        for (let i = 0; i < input.files.length; i++) {
          let reader = new FileReader();
          reader.onload = function (e) {
            let img = document.createElement('img');
            img.src = e.target.result;
            previewContainer.appendChild(img);
          };
          reader.readAsDataURL(input.files[i]);
        }
      } else {
        previewContainer.innerHTML = "<p>No images selected</p>";
      }
    }
  </script>

</body>

</html>
