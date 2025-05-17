<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>CinemaX - Premium Movie Experience</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary: #ff3e00;
      --primary-dark: #e63900;
      --secondary: #00a8ff;
      --dark: #121212;
      --darker: #0a0a0a;
      --light: #f5f5f5;
      --gray: #2a2a2a;
      --light-gray: #444;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--darker);
      color: var(--light);
      line-height: 1.6;
    }

    /* Navigation Bar */
    nav {
      background-color: rgba(18, 18, 18, 0.95);
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.2rem 5%;
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 1000;
      backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.05);
      transition: all 0.3s ease;
    }

    nav.scrolled {
      padding: 0.8rem 5%;
      background-color: rgba(10, 10, 10, 0.98);
    }

    nav .logo {
      font-size: 1.8rem;
      font-weight: 700;
      background: linear-gradient(45deg, var(--primary), #ff6b00);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    nav .logo i {
      font-size: 1.5rem;
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 2rem;
    }

    nav ul li {
      position: relative;
    }

    nav ul li a {
      color: var(--light);
      text-decoration: none;
      font-weight: 500;
      font-size: 1rem;
      transition: color 0.3s;
      display: flex;
      align-items: center;
      gap: 0.3rem;
    }

    nav ul li a i {
      font-size: 0.9rem;
    }

    nav ul li a:hover {
      color: var(--primary);
    }

    nav ul li a.btn-login {
      background: var(--primary);
      padding: 0.5rem 1.2rem;
      border-radius: 50px;
      color: white;
      font-weight: 600;
      transition: all 0.3s;
    }

    nav ul li a.btn-login:hover {
      background: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(255, 62, 0, 0.3);
      color: white;
    }

    /* Hero Section */
    .hero {
      height: 100vh;
      min-height: 700px;
      background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                  url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80') no-repeat center center/cover;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 0 2rem;
      margin-top: 80px;
    }

    .hero h1 {
      font-size: 4rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      background: linear-gradient(45deg, var(--light), #e0e0e0);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      line-height: 1.2;
    }

    .hero p {
      font-size: 1.2rem;
      max-width: 700px;
      margin-bottom: 2.5rem;
      color: rgba(255, 255, 255, 0.8);
    }

    .hero .btn-explore {
      padding: 0.8rem 2rem;
      background: var(--primary);
      border: none;
      border-radius: 50px;
      color: white;
      font-weight: 600;
      font-size: 1rem;
      cursor: pointer;
      transition: all 0.3s;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .hero .btn-explore:hover {
      background: var(--primary-dark);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 62, 0, 0.3);
    }

    /* Now Showing Section */
    .section-title {
      text-align: center;
      font-size: 2.5rem;
      margin-bottom: 3rem;
      position: relative;
      display: inline-block;
      left: 50%;
      transform: translateX(-50%);
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 0;
      width: 100%;
      height: 4px;
      background: linear-gradient(90deg, var(--primary), transparent);
      border-radius: 2px;
    }

    .now-showing {
      padding: 5rem 5%;
      background-color: var(--dark);
    }

    .movies-container {
      max-width: 1400px;
      margin: 0 auto;
    }

    .movies {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2.5rem;
    }

    .movie {
      background: var(--gray);
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0, 1);
      position: relative;
    }

    .movie:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(255, 62, 0, 0.2);
    }

    .movie-poster {
      width: 100%;
      height: 380px;
      position: relative;
      overflow: hidden;
    }

    .movie-poster img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s;
    }

    .movie:hover .movie-poster img {
      transform: scale(1.05);
    }

    .movie-rating {
      position: absolute;
      top: 15px;
      right: 15px;
      background: rgba(0, 168, 255, 0.9);
      color: white;
      padding: 0.3rem 0.6rem;
      border-radius: 50px;
      font-size: 0.9rem;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 0.3rem;
    }

    .movie-rating i {
      font-size: 0.7rem;
      color: gold;
    }

    .movie-info {
      padding: 1.5rem;
    }

    .movie-info h3 {
      font-size: 1.3rem;
      margin-bottom: 0.5rem;
      color: var(--light);
    }

    .movie-meta {
      display: flex;
      justify-content: space-between;
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.9rem;
      margin-bottom: 1.2rem;
    }

    .movie-prices {
      display: flex;
      justify-content: space-between;
      margin-bottom: 1rem;
      font-size: 0.9rem;
    }

    .movie-price {
      background: rgba(0, 0, 0, 0.3);
      padding: 0.3rem 0.6rem;
      border-radius: 4px;
    }

    .price-premium {
      color: gold;
    }

    .price-standard {
      color: var(--light);
    }

    .price-accessible {
      color: var(--secondary);
    }

    .movie-info .btn-book {
      width: 100%;
      padding: 0.7rem;
      background: var(--primary);
      border: none;
      border-radius: 8px;
      color: white;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    .movie-info .btn-book:hover {
      background: var(--primary-dark);
      box-shadow: 0 5px 15px rgba(255, 62, 0, 0.3);
    }

    /* Upcoming Movies */
    .upcoming {
      padding: 5rem 5%;
      background-color: var(--darker);
    }

    .upcoming .movie {
      opacity: 0.85;
    }

    .upcoming .movie:hover {
      opacity: 1;
    }

    .coming-soon-badge {
      position: absolute;
      top: 15px;
      left: 15px;
      background: rgba(255, 62, 0, 0.9);
      color: white;
      padding: 0.3rem 0.8rem;
      border-radius: 50px;
      font-size: 0.8rem;
      font-weight: 600;
      text-transform: uppercase;
    }

    /* Features Section */
    .features {
      padding: 5rem 5%;
      background-color: var(--dark);
    }

    .features-container {
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
    }

    .feature-card {
      background: var(--gray);
      border-radius: 12px;
      padding: 2rem;
      text-align: center;
      transition: all 0.3s;
    }

    .feature-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    .feature-icon {
      font-size: 2.5rem;
      color: var(--primary);
      margin-bottom: 1.5rem;
    }

    .feature-card h3 {
      font-size: 1.3rem;
      margin-bottom: 1rem;
      color: var(--light);
    }

    .feature-card p {
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.95rem;
    }

    /* Newsletter */
    .newsletter {
      padding: 4rem 5%;
      background: linear-gradient(135deg, var(--dark), var(--darker));
      text-align: center;
    }

    .newsletter-container {
      max-width: 600px;
      margin: 0 auto;
    }

    .newsletter h2 {
      font-size: 2rem;
      margin-bottom: 1rem;
    }

    .newsletter p {
      color: rgba(255, 255, 255, 0.7);
      margin-bottom: 2rem;
    }

    .newsletter-form {
      display: flex;
      max-width: 500px;
      margin: 0 auto;
    }

    .newsletter-form input {
      flex: 1;
      padding: 0.8rem 1.2rem;
      border: none;
      border-radius: 50px 0 0 50px;
      font-size: 1rem;
      background: rgba(255, 255, 255, 0.1);
      color: white;
    }

    .newsletter-form input::placeholder {
      color: rgba(255, 255, 255, 0.6);
    }

    .newsletter-form button {
      padding: 0 1.5rem;
      background: var(--primary);
      border: none;
      border-radius: 0 50px 50px 0;
      color: white;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.3s;
    }

    .newsletter-form button:hover {
      background: var(--primary-dark);
    }

    /* Footer */
    footer {
      background-color: var(--darker);
      color: var(--light);
      padding: 4rem 5% 2rem;
      border-top: 1px solid rgba(255, 255, 255, 0.05);
    }

    .footer-container {
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 2rem;
      margin-bottom: 3rem;
    }

    .footer-logo {
      font-size: 1.8rem;
      font-weight: 700;
      background: linear-gradient(45deg, var(--primary), #ff6b00);
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      margin-bottom: 1rem;
      display: inline-block;
    }

    .footer-about p {
      color: rgba(255, 255, 255, 0.7);
      margin-bottom: 1.5rem;
    }

    .social-links {
      display: flex;
      gap: 1rem;
    }

    .social-links a {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      background: var(--gray);
      border-radius: 50%;
      color: var(--light);
      transition: all 0.3s;
    }

    .social-links a:hover {
      background: var(--primary);
      transform: translateY(-3px);
    }

    .footer-links h3 {
      font-size: 1.2rem;
      margin-bottom: 1.5rem;
      color: var(--light);
      position: relative;
      padding-bottom: 0.5rem;
    }

    .footer-links h3::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 40px;
      height: 2px;
      background: var(--primary);
    }

    .footer-links ul {
      list-style: none;
    }

    .footer-links li {
      margin-bottom: 0.8rem;
    }

    .footer-links a {
      color: rgba(255, 255, 255, 0.7);
      text-decoration: none;
      transition: color 0.3s;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .footer-links a:hover {
      color: var(--primary);
    }

    .footer-links i {
      font-size: 0.8rem;
    }

    .footer-contact p {
      display: flex;
      align-items: center;
      gap: 0.8rem;
      margin-bottom: 1rem;
      color: rgba(255, 255, 255, 0.7);
    }

    .footer-contact i {
      color: var(--primary);
      width: 20px;
      text-align: center;
    }

    .copyright {
      text-align: center;
      padding-top: 2rem;
      border-top: 1px solid rgba(255, 255, 255, 0.05);
      color: rgba(255, 255, 255, 0.5);
      font-size: 0.9rem;
    }

    /* Responsive Styles */
    @media (max-width: 992px) {
      .hero h1 {
        font-size: 3rem;
      }
    }

    @media (max-width: 768px) {
      nav {
        padding: 1rem 5%;
      }
      
      nav ul {
        gap: 1.2rem;
      }
      
      .hero {
        padding: 0 1.5rem;
        min-height: 600px;
      }
      
      .hero h1 {
        font-size: 2.5rem;
      }
      
      .section-title {
        font-size: 2rem;
      }
      
      .newsletter-form {
        flex-direction: column;
      }
      
      .newsletter-form input {
        border-radius: 50px;
        margin-bottom: 0.5rem;
      }
      
      .newsletter-form button {
        border-radius: 50px;
        padding: 0.8rem;
      }
    }

    @media (max-width: 576px) {
      nav ul {
        display: none;
      }
      
      .hero h1 {
        font-size: 2rem;
      }
      
      .hero p {
        font-size: 1rem;
      }
      
      .movie-poster {
        height: 320px;
      }
      
      .movie-prices {
        flex-direction: column;
        gap: 0.5rem;
      }
    }
    
    .movie-meta {
  display: flex;
  justify-content: space-between;
  color: rgba(255, 255, 255, 0.7);
  font-size: 0.9rem;
  margin-bottom: 1.2rem;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.showtime {
  color: var(--primary);
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 0.3rem;
}

.showtime i {
  font-size: 0.8rem;
}

@media (max-width: 400px) {
  .movie-meta {
    flex-direction: column;
  }
}
  </style>
</head>
<body>

  <nav id="navbar">
    <div class="logo">
      <i class="fas fa-film"></i> CinemaX
    </div>
    <ul>
      <li><a href="#now-showing">Movies</a></li>
      <li><a href="#upcoming">Coming Soon</a></li>
      <li><a href="#features">Why Us</a></li>
      <li><a href="adminLogin.jsp"><i class="fas fa-user-shield"></i> Admin</a></li>
      <li><a href="customerLogin.jsp" class="btn-login"><i class="fas fa-sign-in-alt"></i> Sign In</a></li>
    </ul>
  </nav>

  <section class="hero">
    <h1>Experience Movies Like Never Before</h1>
    <p>Book tickets for the latest blockbusters in premium theaters with state-of-the-art sound and projection systems.</p>
    <button class="btn-explore" onclick="window.location.href='#now-showing'">
      <i class="fas fa-ticket-alt"></i> Book Now
    </button>
  </section>

 

<section class="now-showing" id="now-showing">
    <div class="movies-container">
      <h2 class="section-title">Now Showing</h2>
      <div class="movies">
        <div class="movie">
          <div class="movie-poster">
            <img src="https://cdn.marvel.com/content/1x/avengersendgame_lob_crd_05.jpg" alt="Avengers: Endgame">
            <div class="movie-rating">
              <i class="fas fa-star"></i> 8.4
            </div>
          </div>
          <div class="movie-info">
            <h3>Avengers: Endgame</h3>
            <div class="movie-meta">
              <span>Action</span>
              <span>3h 1m</span>
              <span class="showtime"><i class="far fa-clock"></i> 10:00 AM</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" onclick="window.location.href='customerLogin.jsp'">
              <i class="fas fa-ticket-alt"></i> Book Tickets
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://m.media-amazon.com/images/I/81fk-N7tvbL.AC_UF894,1000_QL80.jpg" alt="John Wick 4">
            <div class="movie-rating">
              <i class="fas fa-star"></i> 7.7
            </div>
          </div>
          <div class="movie-info">
            <h3>John Wick: Chapter 4</h3>
            <div class="movie-meta">
              <span>Action</span>
              <span>2h 49m</span>
              <span class="showtime"><i class="far fa-clock"></i> 1:00 PM</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" onclick="window.location.href='customerLogin.jsp'">
              <i class="fas fa-ticket-alt"></i> Book Tickets
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://upload.wikimedia.org/wikipedia/en/4/4a/Oppenheimer_%28film%29.jpg" alt="Oppenheimer">
            <div class="movie-rating">
              <i class="fas fa-star"></i> 8.6
            </div>
          </div>
          <div class="movie-info">
            <h3>Oppenheimer</h3>
            <div class="movie-meta">
              <span>Biography</span>
              <span>3h</span>
              <span class="showtime"><i class="far fa-clock"></i> 10:00 PM</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" onclick="window.location.href='customerLogin.jsp'">
              <i class="fas fa-ticket-alt"></i> Book Tickets
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://cdn.marvel.com/content/1x/spider-mannowayhome_lob_crd_03.jpg" alt="Spider-Man">
            <div class="movie-rating">
              <i class="fas fa-star"></i> 8.2
            </div>
          </div>
          <div class="movie-info">
            <h3>Spider-Man: No Way Home</h3>
            <div class="movie-meta">
              <span>Action</span>
              <span>2h 28m</span>
              <span class="showtime"><i class="far fa-clock"></i> 7:00 PM</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" onclick="window.location.href='customerLogin.jsp'">
              <i class="fas fa-ticket-alt"></i> Book Tickets
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>


    
  <section class="upcoming" id="upcoming">
    <div class="movies-container">
      <h2 class="section-title">Coming Soon</h2>
      <div class="movies">
        <div class="movie">
          <div class="movie-poster">
            <img src="https://m.media-amazon.com/images/M/MV5BOGRlN2ViNTUtMjFlZS00ZWZiLWEwN2EtY2U1YjAzNDI5ZjI2XkEyXkFqcGc@.V1.jpg" alt="Walampoori">
            <div class="coming-soon-badge">Coming Soon</div>
          </div>
          <div class="movie-info">
            <h3>Walampoori</h3>
            <div class="movie-meta">
              <span>Drama</span>
              <span>2025</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" disabled>
              <i class="far fa-bell"></i> Notify Me
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://auslankatickets.com/wp-content/uploads/2025/01/PHOTO-2025-01-10-01-34-27-1.jpg" alt="Rani">
            <div class="coming-soon-badge">Coming Soon</div>
          </div>
          <div class="movie-info">
            <h3>Rani</h3>
            <div class="movie-meta">
              <span>Drama</span>
              <span>2025</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" disabled>
              <i class="far fa-bell"></i> Notify Me
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://cdn.kinocheck.com/i/w=1200/myjb3xzzow.jpg" alt="Ballerina">
            <div class="coming-soon-badge">Coming Soon</div>
          </div>
          <div class="movie-info">
            <h3>Ballerina</h3>
            <div class="movie-meta">
              <span>Action</span>
              <span>2025</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" disabled>
              <i class="far fa-bell"></i> Notify Me
            </button>
          </div>
        </div>
        <div class="movie">
          <div class="movie-poster">
            <img src="https://m.media-amazon.com/images/M/MV5BZGQ5NGEyYTItMjNiMi00Y2EwLTkzOWItMjc5YjJiMjMyNTI0XkEyXkFqcGc@.V1.jpg" alt="Mission Impossible">
            <div class="coming-soon-badge">Coming Soon</div>
          </div>
          <div class="movie-info">
            <h3>Mission: Impossible - The Final Reckoning</h3>
            <div class="movie-meta">
              <span>Action</span>
              <span>2025</span>
            </div>
            <div class="movie-prices">
              <span class="movie-price price-premium">Premium: Rs.1500</span>
              <span class="movie-price price-standard">Standard: Rs.2500</span>
              <span class="movie-price price-accessible">Accessible: Rs.2000</span>
            </div>
            <button class="btn-book" disabled>
              <i class="far fa-bell"></i> Notify Me
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="features" id="features">
    <div class="features-container">
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-couch"></i>
        </div>
        <h3>Premium Comfort</h3>
        <p>Experience luxury with our recliner seats, ample legroom, and premium viewing angles in all our theaters.</p>
      </div>
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-ticket-alt"></i>
        </div>
        <h3>Easy Booking</h3>
        <p>Book your tickets in just a few clicks with our user-friendly platform and secure payment options.</p>
      </div>
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-utensils"></i>
        </div>
        <h3>Gourmet Snacks</h3>
        <p>Enjoy a curated selection of gourmet snacks and beverages delivered right to your seat.</p>
      </div>
    </div>
  </section>

  <section class="newsletter">
    <div class="newsletter-container">
      <h2>Stay Updated</h2>
      <p>Subscribe to our newsletter for the latest movie news, special offers, and exclusive deals.</p>
      <form class="newsletter-form">
        <input type="email" placeholder="Enter your email address" required>
        <button type="submit">Subscribe</button>
      </form>
    </div>
  </section>

  <footer>
    <div class="footer-container">
      <div class="footer-about">
        <div class="footer-logo">
          <i class="fas fa-film"></i> CinemaX
        </div>
        <p>Your premier destination for the ultimate movie experience. We bring you the latest blockbusters in state-of-the-art theaters with unmatched comfort and service.</p>
        <div class="social-links">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div class="footer-links">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="#now-showing"><i class="fas fa-chevron-right"></i> Now Showing</a></li>
          <li><a href="#upcoming"><i class="fas fa-chevron-right"></i> Coming Soon</a></li>
          <li><a href="#features"><i class="fas fa-chevron-right"></i> Our Features</a></li>
          <li><a href="customerLogin.jsp"><i class="fas fa-chevron-right"></i> My Account</a></li>
          <li><a href="RegisterForm.jsp"><i class="fas fa-chevron-right"></i> Register</a></li>
        </ul>
      </div>
      <div class="footer-links">
        <h3>Information</h3>
        <ul>
          <li><a href="#"><i class="fas fa-chevron-right"></i> About Us</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> Privacy Policy</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> Terms & Conditions</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> FAQ</a></li>
          <li><a href="#"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
        </ul>
      </div>
      <div class="footer-contact">
        <h3>Contact Us</h3>
        <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo 07, Sri Lanka</p>
        <p><i class="fas fa-phone-alt"></i> +94 70 3848480</p>
        <p><i class="fas fa-envelope"></i> info@cinemax.lk</p>
        <p><i class="fas fa-clock"></i> Open daily: 9:00 AM - 11:00 PM</p>
      </div>
    </div>
    <div class="copyright">
      <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
    </div>
  </footer>

  <script>
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
      const navbar = document.getElementById('navbar');
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        
        document.querySelector(this.getAttribute('href')).scrollIntoView({
          behavior: 'smooth'
        });
      });
    });
  </script>
</body>
</html>
