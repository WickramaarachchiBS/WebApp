<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25/11/2024
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <title>Movie Land</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- css -->
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');
      :root {
        --primary-color: #2c3e50;
        --secondary-color: #3498db;
        --background-gradient-1: #141e30;
        --background-gradient-2: #243b55;
        --text-color: #ecf0f1;
      }
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, var(--background-gradient-1), var(--background-gradient-2));
        color: var(--text-color);
        min-height: 100vh;
        line-height: 1.6;
      }
      .cardArea {
        padding: 50px 0;
        background: transparent;
      }
      .header {
        text-align: center;
        margin-bottom: 40px;
        position: relative;
      }
      .header h2 {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--text-color);
        position: relative;
        display: inline-block;
      }
      .header h2::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 4px;
        background: var(--secondary-color);
        border-radius: 2px;
      }
      .wrapper {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 15px;
      }
      .box-area {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 30px;
      }
      .box {
        position: relative;
        border-radius: 15px;
        overflow: hidden;
        transition: all 0.3s ease;
        box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        transform: translateY(0);
      }
      .box:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 25px rgba(0,0,0,0.4);
      }
      .box img {
        width: 100%;
        height: 400px;
        object-fit: cover;
        transition: transform 0.5s ease;
      }
      .box:hover img {
        transform: scale(1.1);
      }
      .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to bottom, transparent 60%, rgba(0,0,0,0.8) 100%);
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        align-items: center;
        opacity: 0;
        transition: opacity 0.3s ease;
        padding: 20px;
      }
      .box:hover .overlay {
        opacity: 1;
      }
      .btn {
        background-color: var(--secondary-color);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 25px;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
      }
      .btn:hover {
        background-color: #2980b9;
        transform: scale(1.05);
      }
      .text {
        text-align: center;
        margin-top: 15px;
        font-size: 1.1rem;
        font-weight: 500;
        color: var(--text-color);
      }
    </style>
</head>
<body>
    <!-- navbar -->
    <jsp:include page="navbar.jsp" />
    
    <div class="cardArea">
      <div class="header">
        <h2>NOW SHOWING</h2>
      </div>
      <div class="wrapper">
        <div class="box-area">
          <div class="col">
            <div class="box">
              <img src="Assets/wild-robot.jpg" alt="The Wild Robot">
              <div class="overlay">
                <button type="button" class="btn">
                  Buy Tickets
                </button>
              </div>
            </div>
            <div class="text">
              The Wild Robot
            </div>
          </div>
          <div class="col">
            <div class="box">
              <img src="Assets/wild-robot.jpg" alt="The Wild Robot">
              <div class="overlay">
                <button type="button" class="btn">
                  Buy Tickets
                </button>
              </div>
            </div>
            <div class="text">
              The Wild Robot
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
