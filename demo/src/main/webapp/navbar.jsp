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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Font Awesome CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <title>Responsive Navbar</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    header {
      width: 100%;
      height: auto;
      background-color: #1a1a1a;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 20px;
      position: relative;
    }
    .logo-section {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .logo1 {
      font-size: 1.2rem;
      color: #f0c541;
      font-weight: 100;
      text-decoration: none;
    }
    .logo {
      width: 35px;
      height: 35px;
      border-radius: 50%;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    nav {
      display: flex;
      gap: 10px;
    }
    nav a {
      color: #fff;
      padding: 5px 10px;
      font-size: 16px;
      transition: 0.2s;
      text-decoration: none;
    }
    a.active {
      background: #f0c541;
      border-radius: 2px;
      color: #1a1a1a;
    }
    a:hover {
      background: #f0c541;
      border-radius: 2px;
      color: #1a1a1a;
    }
    .hamburger {
      display: none; /* Hidden by default */
      flex-direction: column; /* Stack bars vertically */
      cursor: pointer; /* Pointer cursor on hover */
    }
    .bar {
      width: 25px;
      height: 2px;
      background-color: #f0c541; /* Color of the bars */
      margin: 3px 0; /* Space between bars */
      transition: all 0.3s ease; /* Transition for smooth effect */
    }
    .login-icon {
      right: 5px; /* Adjust the position */
      font-size: 18px; /* Size of the login icon */
      color: #f0c541; /* Color of the icon */
      cursor: pointer; /* Pointer cursor on hover */
    }
    @media screen and (max-width: 768px) {
      .hamburger {
        display: flex; /* Show hamburger menu in mobile view */
        z-index: 10; /* Ensure it is above other elements */
        position: relative; /* Position relative for stacking context */
        margin-left:auto; /* Align it to the right */
        transition-duration :0.3s ; /* Smooth transition for hamburger menu */
        transform-origin : center ; /* Set transform origin for rotation effect */
      }
      nav {
        display: flex;
        flex-direction: column; /* Stack menu items vertically */
        width: 100%; /* Full width for mobile view */
        position: absolute; /* Position below the header */
        top: 100%;
        left: 0;
        background-color: #1a1a1a;
        padding: 0 5px 0px 5px;
        overflow: hidden; /* Hide overflowing items */
        max-height: 0; /* Initially collapsed */
        transition: max-height 0.3s ease-out; /* Smooth dropdown effect */
      }
      nav.active {
        max-height: 300px; /* Expand to fit all items */
      }
      nav a {
        width :100% ;
        text-align : center ;
        padding :10px ;
        margin-bottom :5px ;
      }
      .logo-section {
        width :100% ;
        justify-content : space-between ;
        align-items : center ;
      }
    }
  </style>
</head>
<body>

  <header>
    <nav id="navMenu">
      <a href="" class="active">Home</a>
      <a href="">Movies</a>
      <a href="">Genres</a>
      <a href="">Trending</a>
      <a href="">Contact</a>
    </nav>

    <div class="logo-section">
      <a href="#" class="logo1">Movie|Land</a>
      <i class="fas fa-user login-icon"></i>
      <div class="hamburger" onclick="toggleMenu()">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
      </div>
    </div>
  </header>

<script>
  function toggleMenu() {
    const nav = document.getElementById('navMenu');
    const bars = document.querySelectorAll('.bar');

    // Toggle active class for navigation
    nav.classList.toggle('active');
  }
</script>

</body>
</html>
