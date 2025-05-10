<%-- 
    Document   : dashboard
    Created on : Apr 26, 2025, 9:10:03 AM
    Author     : Randun Gayantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>CinemaX - Movie Tickets</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #0f0f0f;
      color: #fff;
    }

    /* Navigation Bar */
    nav {
      background-color: #1a1a1a;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    nav .logo {
      font-size: 1.5rem;
      font-weight: 600;
      color: #ff4b2b;
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 1.5rem;
    }

    nav ul li {
      display: inline;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }

    nav ul li a:hover {
      color: #ff4b2b;
    }

    header {
      background: linear-gradient(to right, #ff416c, #ff4b2b);
      padding: 2rem;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
    }

    header h1 {
      font-size: 2.5rem;
      color: #fff;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
    }

    .now-showing {
      padding: 3rem 2rem;
      max-width: 1200px;
      margin: auto;
    }

    .now-showing h2 {
      text-align: center;
      font-size: 2rem;
      margin-bottom: 2.5rem;
      color: #ff4b2b;
    }

    .movies {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 2rem;
    }

    .movie {
      background: #1c1c1c;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 0 15px rgba(255, 75, 43, 0.2);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .movie:hover {
      transform: scale(1.03);
      box-shadow: 0 0 25px rgba(255, 75, 43, 0.4);
    }

    .movie img {
      width: 100%;
      height: 350px;
      object-fit: cover;
    }

    .movie-info {
      padding: 1rem;
      text-align: center;
    }

    .movie-info h3 {
      font-size: 1.2rem;
      margin-bottom: 1rem;
      color: #f1f1f1;
    }

    .movie-info button {
      padding: 0.6rem 1.2rem;
      background-color: #ff4b2b;
      border: none;
      border-radius: 25px;
      color: white;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .movie-info button:hover {
      background-color: #e84321;
    }
    
    footer {
  background-color: #1a1a1a;
  color: #aaa;
  text-align: center;
  padding: 1rem;
  margin-top: 3rem;
  font-size: 0.9rem;
  border-top: 1px solid #333;
}


    @media (max-width: 600px) {
      nav ul {
        flex-direction: column;
        gap: 1rem;
      }
      .movie img {
        height: 280px;
      }
    }
  </style>
</head>
<body>

  <nav>
    <div class="logo">CinemaX</div>
    <ul>
      <li><a href="adminLogin.jsp">Admin Login</a></li>
      <li><a href="customerLogin.jsp">Customer Login</a></li>
      <li><a href="RegisterForm.jsp">Register</a></li>
    </ul>
  </nav>

  <header>
    <h1>🎬 Book Your Movie Tickets Now</h1>
  </header>

  <section class="now-showing">
    <h2>🎞️ Now Showing</h2>
    <div class="movies">
      <div class="movie">
        <img src="https://cdn.marvel.com/content/1x/avengersendgame_lob_crd_05.jpg" alt="Avengers">
        <div class="movie-info">
          <h3>Avengers: Endgame</h3>
          <button onclick="window.location.href='customerLogin.jsp'">Book Now</button>
        </div>
      </div>
      <div class="movie">
        <img src="https://m.media-amazon.com/images/I/81fk-N7tvbL._AC_UF894,1000_QL80_.jpg" alt="John Wick 4">
        <div class="movie-info">
          <h3>John Wick 4</h3>
          <button onclick="window.location.href='customerLogin.jsp'">Book Now</button>
        </div>
      </div>
      <div class="movie">
        <img src="https://upload.wikimedia.org/wikipedia/en/4/4a/Oppenheimer_%28film%29.jpg" alt="Oppenheimer">
        <div class="movie-info">
          <h3>Oppenheimer</h3>
          <button onclick="window.location.href='customerLogin.jsp'">Book Now</button>
        </div>
      </div>
      <div class="movie">
        <img src="https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg" alt="Spider-Man">
        <div class="movie-info">
          <h3>Spider-Man: No Way Home</h3>
          <button onclick="window.location.href='customerLogin.jsp'">Book Now</button>
        </div>
      </div>
    </div>
  </section>
 
<footer>
  <p>&copy; 2025 CinemaX. All rights reserved.</p>
</footer>

<!-- Added About Us, Contact & Location Section -->
<section style="padding: 20px; background-color: #f4f4f4; margin-top: 30px;">
  <h2>About Us</h2>
  <p>
    CinemaX is a modern and dynamic platform designed for movie lovers. We offer the latest movie schedules,
    online ticket booking, and detailed movie information. Our goal is to provide a seamless and enjoyable
    movie booking experience. Whether you're a casual viewer or a film enthusiast, CinemaX brings the cinema
    to your fingertips.
  </p>

  <h3>Contact Us</h3>
  <p>Phone: +94 70 3848480<br>
     Email: info@cinemax.lk</p>

  <h3>Location</h3>
  <p>No. 123, Main Street, Colombo 07, Sri Lanka</p>
</section>

</body>
</html>

</body>
</html>



