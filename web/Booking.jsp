<%@page import="cinema.dao.com.BookingsDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
    List<String> films = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinematicketsbookingsystem", "root", "1111")) {
        BookingsDAO dao = new BookingsDAO(conn);
        films = dao.getAllFilmNames();
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Tickets - CinemaX</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navigation Bar */
        nav {
            background-color: rgba(18, 18, 18, 0.95);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 5%;
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
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

        /* Main Content */
        .booking-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 3rem 5%;
            width: 100%;
        }

        .booking-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .booking-header h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--light);
            position: relative;
            display: inline-block;
        }

        .booking-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            border-radius: 2px;
        }

        .booking-form {
            background: var(--gray);
            border-radius: 16px;
            padding: 2.5rem;
            width: 100%;
            max-width: 800px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .booking-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.8);
        }

        .form-group select {
            width: 100%;
            padding: 0.8rem 1rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-group select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 62, 0, 0.2);
        }

        .seat-section {
            margin-bottom: 2rem;
        }

        .seat-section h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--light);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .seat-section h3 i {
            color: var(--secondary);
        }

        .seat-grid {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .seat-grid {
                grid-template-columns: repeat(5, 1fr);
            }
        }

        .seat-label {
            position: relative;
        }

        .seat-checkbox {
            position: absolute;
            opacity: 0;
        }

        .seat-checkbox:checked + .seat {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .seat-checkbox:disabled + .seat {
            background: var(--light-gray);
            color: rgba(255, 255, 255, 0.3);
            cursor: not-allowed;
        }

        .seat {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            background: var(--dark);
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 500;
        }

        .seat:hover {
            border-color: var(--secondary);
        }

        .screen {
            text-align: center;
            margin: 2rem 0;
            padding: 1rem;
            background: linear-gradient(to bottom, rgba(255,255,255,0.1), rgba(255,255,255,0.05));
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: var(--secondary);
        }

        .btn-book {
            width: 100%;
            padding: 0.8rem;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-book:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 62, 0, 0.3);
        }

        /* Footer */
        footer {
            background-color: var(--darker);
            color: var(--light);
            padding: 2rem 5%;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .footer-logo {
            font-size: 1.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 1rem;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
            margin-top: 2rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            nav ul {
                gap: 1.2rem;
            }
            
            .booking-form {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                display: none;
            }
            
            .seat-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <i class="fas fa-film"></i> CinemaX
        </div>
        <ul>
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="customerLogin.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
            <li><a href="RegisterForm.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
        </ul>
    </nav>

    <div class="booking-container">
        <div class="booking-header">
            <h2>Book Your Tickets</h2>
            <p>Select your preferred movie, showtime, and seats</p>
        </div>

        <form class="booking-form" action="BookingServlet" method="post">
            <div class="form-group">
                <label for="film">Movie</label>
                <select name="film" id="film" required>
                    <option value="">-- Select a movie --</option>
                    <% for (String film : films) { %>
                        <option value="<%= film %>"><%= film %></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label for="time">Show Time</label>
                <select name="time" id="time" required>
                    <option value="">-- Select show time --</option>
                    <option value="10:00 AM">10:00 AM</option>
                    <option value="1:00 PM">1:00 PM</option>
                    <option value="4:00 PM">4:00 PM</option>
                    <option value="7:00 PM">7:00 PM</option>
                    <option value="10:00 PM">10:00 PM</option>
                </select>
            </div>

            <div class="screen">
                <i class="fas fa-film"></i> SCREEN THIS WAY <i class="fas fa-film"></i>
            </div>

            <div class="seat-section">
                <h3><i class="fas fa-couch"></i> Premium Seats</h3>
                <div class="seat-grid">
                    <% for (int i = 1; i <= 20; i++) { %>
                        <label class="seat-label">
                            <input type="checkbox" class="seat-checkbox" name="seats" value="P<%= i %>">
                            <div class="seat">P<%= i %></div>
                        </label>
                    <% } %>
                </div>
            </div>

            <div class="seat-section">
                <h3><i class="fas fa-chair"></i> Standard Seats</h3>
                <div class="seat-grid">
                    <% for (int i = 1; i <= 60; i++) { %>
                        <label class="seat-label">
                            <input type="checkbox" class="seat-checkbox" name="seats" value="S<%= i %>">
                            <div class="seat">S<%= i %></div>
                        </label>
                    <% } %>
                </div>
            </div>

            <div class="seat-section">
                <h3><i class="fas fa-wheelchair"></i> Accessible Seats</h3>
                <div class="seat-grid">
                    <% for (int i = 1; i <= 10; i++) { %>
                        <label class="seat-label">
                            <input type="checkbox" class="seat-checkbox" name="seats" value="A<%= i %>">
                            <div class="seat">A<%= i %></div>
                        </label>
                    <% } %>
                </div>
            </div>

            <button type="submit" class="btn-book">
                <i class="fas fa-ticket-alt"></i> Book Selected Seats
            </button>
        </form>
    </div>

    <footer>
        <div class="footer-container">
            <div>
                <div class="footer-logo">
                    <i class="fas fa-film"></i> CinemaX
                </div>
                <p>Premium movie experience with state-of-the-art theaters and unmatched service.</p>
            </div>
            <div>
                <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo 07, Sri Lanka</p>
                <p><i class="fas fa-phone-alt"></i> +94 70 3848480</p>
                <p><i class="fas fa-envelope"></i> bookings@cinemax.lk</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
        </div>
    </footer>

    <script>
        // Simulate some booked seats (in a real app, this would come from the server)
        const bookedSeats = ['P3', 'S12', 'S25', 'A2'];
        
        document.addEventListener('DOMContentLoaded', function() {
            // Disable booked seats
            bookedSeats.forEach(seatCode => {
                const checkbox = document.querySelector(`input[value="${seatCode}"]`);
                if (checkbox) {
                    checkbox.disabled = true;
                }
            });

            // Limit seat selection to 8 seats
            const checkboxes = document.querySelectorAll('.seat-checkbox:not(:disabled)');
            let selectedCount = 0;
            
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    if (this.checked) {
                        selectedCount++;
                        if (selectedCount > 8) {
                            this.checked = false;
                            selectedCount--;
                            alert('You can select a maximum of 8 seats per booking.');
                        }
                    } else {
                        selectedCount--;
                    }
                });
            });
        });
    </script>
</body>
</html>
