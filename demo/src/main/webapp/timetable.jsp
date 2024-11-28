<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/11/2024
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie Timetable</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
      :root {
          --primary-color: #ce3530;
          --secondary-color: #2f2a72;
          --background-color: #181818;
          --text-color: #333;
          --white: #fff;
      }

      * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
      }

      body {
          font-family: 'Arial', sans-serif;
          background-color: var(--background-color);
          color: var(--text-color);
          line-height: 1.6;
      }

      .container {
          width: 100%;
          max-width: 1200px;
          margin: 0 auto;
          padding: 0 15px;
      }

      /* Header Styles */
      .header {
          background-color: var(--primary-color);
          color: var(--white);
          padding: 15px 0;
      }

      .header-content {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
          align-items: center;
          gap: 15px;
      }

      .header h1 {
          font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
          font-size: 1.5rem;
      }

      .search-container {
          display: flex;
          align-items: center;
          gap: 15px;
          flex-grow: 1;
      }

      .search-bar {
          flex-grow: 1;
          padding: 10px;
          border-radius: 5px;
          border: 2px solid transparent;
          max-width: 300px;
      }

      .sign-in {
          background-color: var(--secondary-color);
          color: var(--white);
          border: none;
          padding: 10px 15px;
          border-radius: 5px;
          cursor: pointer;
          transition: background-color 0.3s ease;
      }

      .sign-in:hover {
          background-color: #4a41b3;
      }

      /* Banner Styles */
      .banner {
          position: relative;
          height: 50vh;
          background: url('pic1.jpg') no-repeat center center/cover;
          display: flex;
          align-items: flex-end;
          color: var(--white);
      }

      .banner::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background: rgba(0, 0, 0, 0.5);
      }

      .movie-info {
          position: relative;
          z-index: 2;
          padding: 20px;
      }

      .movie-info h2 {
          font-size: 2rem;
          margin-bottom: 10px;
      }

      /* Date Selector Styles */
      .date-selector {
          display: flex;
          justify-content: center;
          margin: 20px 0;
          overflow-x: auto;
          gap: 10px;
          padding: 0 15px;
      }

      .date-button {
          background-color: #f8f9fa;
          color: var(--text-color);
          border: 1px solid #ddd;
          padding: 10px 15px;
          cursor: pointer;
          border-radius: 5px;
          white-space: nowrap;
          transition: all 0.3s ease;
      }

      .date-button.active {
          background-color: var(--secondary-color);
          color: var(--white);
      }

      /* Timetable Styles */
      .timetable {
          max-width: 800px;
          margin: 0 auto;
          padding: 20px;
          background: rgba(202, 191, 191, 0.65);
          border-radius: 8px;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      .theater {
          margin-bottom: 20px;
          background: #000;
          padding: 15px;
          border-radius: 8px;
      }

      .theater h3 {
          color: #ff9800;
          margin-bottom: 15px;
      }

      .showtimes {
          display: flex;
          flex-wrap: wrap;
          gap: 10px;
      }

      .time-button {
          padding: 10px 15px;
          background-color: #ff5722;
          color: var(--white);
          border: none;
          border-radius: 5px;
          cursor: pointer;
          transition: background-color 0.3s ease;
      }

      .time-button:hover {
          background-color: #4a41b3;
      }

      /* Responsive Adjustments */
      @media screen and (max-width: 768px) {
          .header-content {
              flex-direction: column;
              text-align: center;
          }

          .search-container {
              width: 100%;
              flex-direction: column;
          }

          .search-bar {
              width: 100%;
              max-width: 100%;
          }

          .banner {
              height: 40vh;
          }

          .movie-info h2 {
              font-size: 1.5rem;
          }

          .date-selector {
              justify-content: flex-start;
              overflow-x: auto;
          }
      }
  </style>
</head>
<body>
  <header class="header">
    <div class="container">
        <div class="header-content">
            <h1>Movie Booking</h1>
            <div class="search-container">
                <input type="text" placeholder="Search for Movies and Events" class="search-bar" />
                <button class="sign-in">
                    <i class="fas fa-user"></i> Sign In
                </button>
            </div>
        </div>
    </div>
</header>

<main>
    <div class="banner">
        <div class="container">
            <div class="movie-info">
                <h2>Venom</h2>
                <p>Action | Sci-fi</p>
                <p>Duration: 1 hr 49 mins</p>
            </div>
        </div>
    </div>

    <div class="date-selector">
        <button class="date-button active">20 Today</button>
        <button class="date-button">21 TOM</button>
        <button class="date-button">22 FRI</button>
        <button class="date-button">23 SAT</button>
    </div>

    <section class="container">
        <div class="timetable">
            <div class="theater">
                <h3>Cinemax 3D: Ja ela</h3>
                <div class="showtimes">
                    <button class="time-button">01:00 PM</button>
                    <button class="time-button">07:00 PM</button>
                    <button class="time-button">10:15 PM</button>
                </div>
            </div>
            <div class="theater">
                <h3>City Cinema: Kochchikade</h3>
                <div class="showtimes">
                    <button class="time-button">02:30 PM</button>
                    <button class="time-button">10:00 PM</button>
                </div>
            </div>
            <div class="theater">
                <h3>Eros Cinema: Colombo</h3>
                <div class="showtimes">
                    <button class="time-button">02:00 PM</button>
                    <button class="time-button">09:30 PM</button>
                    <button class="time-button">11:00 PM</button>
                </div>
            </div>
            <div class="theater">
                <h3>Regal Cinema: Gampaha</h3>
                <div class="showtimes">
                    <button class="time-button">01:00 PM</button>
                    <button class="time-button">07:00 PM</button>
                    <button class="time-button">10:15 PM</button>
                </div>
            </div>
        </div>
    </section>
</main>

<script>
    // Optional: Add interactivity for date and time selection
    document.querySelectorAll('.date-button').forEach(button => {
        button.addEventListener('click', () => {
            document.querySelectorAll('.date-button').forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
        });
    });
</script>
</body>
</html>
