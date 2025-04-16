<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <title>Update Admin Profile</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);

    body, html {
      height: 100%;
      margin: 0;
      font-family: 'Open Sans', sans-serif;
    }

    body {
      background-image: url('/images/bookstore-background.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      display: flex;
      flex-direction: column;
      align-items: center;
      overflow: scroll;
    }

    .header {
      color: black;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      position: absolute;
      padding: 1rem 0;
      top: 25px;
      left: 0;
      right: 0;
      z-index: 10;
    }

    .header h1 {
      margin: 0;
    }

    .form-container {
      min-height: 10rem;
      margin: 6rem auto 0;
      max-width: 70%;
      padding: 1rem;
    }

    form {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 1.5rem;
      border-radius: 10px;
      color: white;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    label {
      margin: 0.5rem 0 0.2rem;
    }

    input[type="text"], input[type="email"], input[type="password"] {
      padding: .75rem;
      border: 1px solid rgba(255, 255, 255, 0.5);
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1.1rem;
      border-radius: 5px;
    }

    button {
      padding: .75rem;
      background-color: rgba(255, 255, 255, 0.3);
      border: none;
      color: white;
      background: #4CAF50;
      font-size: 1.1rem;
      cursor: pointer;
      border-radius: 5px;
    }

    button:hover {
      background-color: rgba(255, 255, 255, 0.5);
    }

    /* Back Button */
    .back-button {
      background-color: #f44336;
      color: white;
      padding: .75rem;
      font-size: 1.1rem;
      border-radius: 5px;
      margin-top: 1rem;
      text-align: center;
      width: 100%;
      cursor: pointer;
      border: none;
    }

    .back-button:hover {
      background-color: #e53935;
    }

    .underlay-photo {
      animation: hue-rotate 6s infinite;
      background: url('https://31.media.tumblr.com/41c01e3f366d61793e5a3df70e46b462/tumblr_n4vc8sDHsd1st5lhmo1_1280.jpg');
      background-size: cover;
      -webkit-filter: grayscale(30%);
      z-index: -1;
    }

    .underlay-black {
      background: rgba(0,0,0,0.7);
      z-index: -1;
    }

    .form-text {
      font-weight: 400;
      font-size: xx-large;
    }

    /* Circular profile photo */
    .profile-photo-container {
      position: relative;
      display: flex;
      justify-content: center;
      margin-bottom: 1rem;
    }

    .profile-photo {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 4px solid white;
      object-fit: cover;
    }

    .profile-photo-update-button {
      position: absolute;
      bottom: 0;
      background-color: rgba(0, 0, 0, 0.5);
      border-radius: 50%;
      padding: 60px;
      cursor: pointer;
      font-size: 1rem;
    }

    .profile-photo-update-button:hover {
      background-color: rgba(0, 0, 0, 0.7);
    }

    .profile-photo-update-button input {
      display: none;
    }

    .profile-photo-update-button i {
      color: white;
      font-size: 1.5rem;
    }

    @keyframes hue-rotate {
      from {
        -webkit-filter: grayscale(30%) hue-rotate(0deg);
      }
      to {
        -webkit-filter: grayscale(30%) hue-rotate(360deg);
      }
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>XYZ Bookstore Admin</h1>
  </div>

  <div class="form-container">
    <p class="form-text">Update Admin Profile</p>

    <form action="/submitProfileUpdate" method="post" enctype="multipart/form-data">
        <c:if test="${not empty errorMessage}">
             <h3 class="error-message">${errorMessage}</h3>
        </c:if>

        <div class="profile-photo-container">
            <img src="${imgurl}" id="profilePhoto" class="profile-photo" alt="Profile Photo">
            <label class="profile-photo-update-button">
              <input type="file" name="profile" value="" accept="image/*" onchange="previewProfileImage(event)">
            </label>
        </div>

        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="${admin.name}" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${admin.email}" readonly>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" value="${admin.password}" required>

        <button type="submit">Update Profile</button>
    </form>

    <form action="/admindashboard" method="get">
      <button type="submit" class="back-button">Back to Dashboard</button>
    </form>
  </div>

  <div class="underlay-photo"></div>
  <div class="underlay-black"></div>

  <script>
    function previewProfileImage(event) {
      var reader = new FileReader();
      reader.onload = function() {
        var output = document.getElementById('profilePhoto');
        output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
    }

    function removeProfileImage() {
      var output = document.getElementById('profilePhoto');
      output.src = '/images/default-profile.jpg';
    }
  </script>

</body>
</html>
