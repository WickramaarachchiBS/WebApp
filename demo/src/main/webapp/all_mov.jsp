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

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        *{
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }
        body{
            background: #ebf2ff;
            color: #ffffff;
            background-image: linear-gradient(to bottom right, #1d2b22, rgb(26, 26, 1));
        }
        /* cards css */
        .cardArea{
            padding: 50px 0;
            background-image: linear-gradient(to bottom right, #1d2b22, rgb(26, 26, 1));
        }
        .header{
            text-align: center;
            background-color: rgb(13, 68, 68);
            margin-top: 20px;
        }
        .wrapper{
            padding: 10px 10%;
        }
        .box-area{
            display: grid;
            align-content: center;
            gap: 50px;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            grid-row: auto;
            margin-top: 20px;
        }
        .box {
            border-radius: 20px;
            position: relative;
            overflow: hidden;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.9);
        }
        .box img{
            width: 100%;
            height: 100%;
            border-radius: 20px;
            display: block;
            transition: transform 0.5s;
        }
        .box:hover img{
            transform: scale(1.1);
        }
        .box:hover .overlay{
            height: 100%;
        }
        .overlay {
            width: 100%;
            height: 0;
            background: linear-gradient(transparent,#333333 150%);
            border-radius: 20px;
            position: absolute;
            left: 0;
            bottom: 0;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            font-size: 14px;
            transition: height 0.5s;
        }
        .btn {
            margin-top: 325px;
            /* border: none; */
            background-color: rgb(23, 131, 131);
            transition: 0.5s;
        }
        .btn:hover {
            scale: 1.2;
            background-color: rgb(13, 68, 68);
        }
        .btn a{
            color: #ebebeb;
        }
        .btn:active{
            background-color: #ebebeb;
        }
        .text{
            padding-top: 10px;
            text-align: center;
            font-size: 20px;
        }
    </style>

    <!-- title -->
    <title>Movie Land - Book ur fav Movie</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
    <!-- navbar -->

    <!-- mov cards -->
    <div class="cardArea">
        <div class="header">
            <h2>NOW SHOWING</h2>
        </div>
        <!-- movie cards -->
        <div class="wrapper">
            <div class="box-area">
                <!-- Loop through movies -->
<%--                <c:forEach var="movie" items="${movies}">--%>
                <div class="col">
                    <div class="box">
                        <img src="Assets/wild-robot.jpg" alt="#">
                        <div class="overlay">
                            <button type="button" class="btn" data-bs-target="#staticBackdrop2">
                                <a href="#">Buy Tickets</a>
                            </button>
                        </div>
                    </div>
                    <div class="text">
                        The Wild Robot
                    </div>
                </div>
                <div class="col">
                    <div class="box">
                        <img src="Assets/wild-robot.jpg" alt="#">
                        <div class="overlay">
                            <button type="button" class="btn" data-bs-target="#staticBackdrop2">
                                <a href="#">Buy Tickets</a>
                            </button>
                        </div>
                    </div>
                    <div class="text">
                        The Wild Robot
                    </div>
                </div>
<%--                </c:forEach>--%>
            </div>
        </div>
        <!-- /movie cards -->
    </div>

</body>
</html>
