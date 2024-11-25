<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/11/2024
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- title -->
    <title>ThankYou...</title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/pay_confirm.css">

</head>
<body>

<div class="background-elements">
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="cloud"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
    <div class="diagonal-line"></div>
</div>

<main class="main-content">
    <div class="logo">
        <svg viewBox="0 0 24 24">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.88-11.71L10 14.17l-1.88-1.88a.996.996 0 1 0-1.41 1.41l2.59 2.59c.39.39 1.02.39 1.41 0L17.3 9.7a.996.996 0 1 0-1.41-1.41z"/>
        </svg>
    </div>
    <h1>Your Booking is Confirmed!</h1>
    <h2>Thank you for choosing us...</h2> <br>
    <p>An email containing your reciept will be sent to you. <br>
        Please check your email. </p>
    <p class="bottom-text">You will redirected to home page shortly.<a href="index.html">&nbsp;&nbsp;&nbsp;<u>Redirect Now →</u></a></p>
</main>


<script>
    setTimeout(function() {
      window.location.href = "index.html"; // Replace with your desired URL
    }, 30000); // 30 seconds
</script>

</body>
</html>
