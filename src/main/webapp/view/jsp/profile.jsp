<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <title>Admin Profile</title>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:100,300,400,700);
    @import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);

    body,
    html {
      height: 100%;
      margin: 0;
    }

    body {
      background-color: #2c2c2c;
      font-family: 'Open Sans';
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
      padding: 1rem 0;
      position: absolute;
      top: 30px;
      left: 0;
      right: 0;
      z-index: 10;
      animation: fadeIn 2s ease-out;
    }

    .header h1 {
      margin: 0;
    }

    .nav-button {
      position: absolute;
      top: 110px;
      left: 30px;
      background: #4CAF50;
      border: none;
      border-radius: 5px;
      color: white;
      font-size: 1.2rem;
      padding: 10px 20px;
      cursor: pointer;
      transition: background 0.3s, transform 0.2s;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
      animation: fadeIn 2s ease-out;
    }

    .nav-button:hover {
      background: #45a049;
      transform: scale(1.05);
    }

    .profile-container {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      margin-top: 10rem;
      max-width: 70%;
      padding: 1rem;
      animation: slideIn 2s ease-out;
      margin-left: auto;
      margin-right: auto;
    }

    .profile-details {
      background-color: rgba(0, 0, 0, 0.8);
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
      flex: 1;
      margin-right: 1rem;
      color: white;
    }

    .profile-details h3 {
      text-align: center;
      margin-bottom: 1rem;
      font-size: 1.8rem;
    }

    .profile-details table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 1rem;
    }

    .profile-details th,
    .profile-details td {
      padding: 12px 15px;
      text-align: left;
      border: 1px solid rgba(255, 255, 255, 0.5);
      font-size: 1.2rem;
    }

    .profile-details th {
      background-color: rgba(255, 255, 255, 0.3);
      color: white;
    }

    .profile-details td {
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
    }

    .footer-buttons {
      display: flex;
      justify-content: center;
      margin-top: 2rem;
      animation: fadeIn 2s ease-out;
    }

    .footer-button {
      background: #4CAF50;
      border: 1px solid white;
      color: white;
      padding: 0.75rem 2rem;
      font-size: 1.2rem;
      cursor: pointer;
      transition: 250ms background ease-in;
      border-radius: 4px;
      box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.2);
      margin: 0 1rem;
    }

    .footer-button:hover,
    .footer-button:focus {
      background: white;
      color: black;
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
      display: flex;
      justify-content: center;
      margin-top: 2rem;
    }

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
    <h1>Admin Profile</h1>
  </div>

  <div class="profile-container">
    <div class="profile-details">
      <h3>Admin Details</h3>
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${admin.name}</td>
            <td>${admin.email}</td>
            <td>******</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="profile-picture">
    </div>
  </div>

  <div class="footer-buttons">
    <form action="/updateprofile" method="get" class="footer-button-form">
      <button type="submit" class="footer-button">
        Update Profile
      </button>
    </form>
    <form action="/updatepassword" method="get" class="footer-button-form">
      <button type="submit" class="footer-button">
        Update Password
      </button>
    </form>
    <form action="/logout" method="get" class="footer-button-form">
      <button type="submit" class="footer-button">
        Logout
      </button>
    </form>
  </div>


  <div class="back-to-dashboard-btn-container">
    <form action="/admindashboard" method="get">
      <button type="submit" class="back-to-dashboard-btn">Back to Admin Dashboard</button>
    </form>
  </div>

</body>

</html>
