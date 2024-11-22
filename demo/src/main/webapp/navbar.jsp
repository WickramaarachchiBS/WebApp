<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 23/11/2024
  Time: 1:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    /* Header Section */
    header {
      width: 100%;
      max-width: 100%;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: space-between; /* Align left and right sections */
      padding: 0 20px;
      background-color: #1a1a1a; /* Dark background for contrast */
      position: relative;
      z-index: 1000;
    }
    .logo1 {
      font-size: 1.2rem;
      color: #f0c541; /* Golden color for the logo text */
      font-weight: 100;
      margin-left: 1100px; /* Align text logo to the left */
    }
    .logo {
      width: 35px; /* Adjust logo size */
      height: 35px;
      border-radius: 50%; /* Rounded logo */
      margin-left: 10px; /* Add space to the left of the logo */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional shadow for styling */
    }
    header nav a {
      color: #fff; /* Golden color for navigation links */
      padding: 5px 10px;
      font-size: 16px;
      transition: 0.2s;
      text-decoration: none;
      margin-right: 10px; /* Spacing between navigation links */
    }
    a.active {
      background: #f0c541; /* Golden highlight for active link */
      border-radius: 2px;
    }
    a:hover {
      background: #f0c541; /* Golden highlight on hover */
      border-radius: 2px;
    }
  </style>
</head>
<body>

<header>

  <nav>
    <a href="" class="active">Home</a>
    <a href="">Movies</a>
    <a href="">Genres</a>
    <a href="">Trending</a>
    <a href="">Contact</a>
  </nav>

  <a href="#" class="logo1">Movie|Land</a>
  <div class="logo-container">
    <img src="login.png" alt="Site Logo" class="logo">
  </div>

</header>

</body>
</html>
