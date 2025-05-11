<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>View Bookings - CinemaX</title>
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
        .main-content {
            flex: 1;
            padding: 3rem 5%;
            max-width: 1400px;
            margin: 0 auto;
            width: 100%;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .page-header h2 {
            font-size: 2rem;
            color: var(--light);
            position: relative;
        }

        .page-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary);
        }

        .filter-controls {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .filter-controls select, 
        .filter-controls input {
            padding: 0.8rem 1rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            min-width: 200px;
        }

        .filter-controls button {
            padding: 0 1.5rem;
            background: var(--primary);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        /* Bookings Table */
        .bookings-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--gray);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .bookings-table thead {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .bookings-table th {
            padding: 1rem;
            text-align: left;
            color: white;
            font-weight: 600;
        }

        .bookings-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .bookings-table tr:last-child td {
            border-bottom: none;
        }

        .bookings-table tr:hover {
            background: rgba(255, 255, 255, 0.02);
        }

        .status-badge {
            display: inline-block;
            padding: 0.3rem 0.6rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-confirmed {
            background-color: rgba(76, 175, 80, 0.2);
            color: #4CAF50;
        }

        .status-cancelled {
            background-color: rgba(255, 82, 82, 0.2);
            color: #FF5252;
        }

        .action-link {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .action-link.delete {
            color: #ff5252;
        }

        .action-link:hover {
            color: #00d4ff;
        }

        .action-link.delete:hover {
            color: #ff0000;
        }

        .back-link {
            margin-top: 2rem;
            text-align: center;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-back:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.2);
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
            
            .bookings-table {
                display: block;
                overflow-x: auto;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                display: none;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .filter-controls {
                flex-direction: column;
            }
            
            .filter-controls select, 
            .filter-controls input {
                width: 100%;
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
            <li><a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            
            
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <div class="main-content">
        <div class="page-header">
            <h2>Booking Management</h2>
            <div class="filter-controls">
                <select>
                    <option value="">All Statuses</option>
                    <option value="confirmed">Confirmed</option>
                    <option value="cancelled">Cancelled</option>
                </select>
                <input type="date" placeholder="Filter by date">
                <button type="submit"><i class="fas fa-filter"></i> Filter</button>
            </div>
        </div>

        <table class="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer</th>
                    <th>Film</th>
                    <th>Show Time</th>
                    <th>Seats</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Map<String, String>> bookings = (List<Map<String, String>>) request.getAttribute("bookings");
                for (Map<String, String> booking : bookings) { 
                %>
                <tr>
                    <td><%= booking.get("id") %></td>
                    <td>
                        <a href="viewCustomer.jsp?id=<%= booking.get("customer_id") %>" class="action-link">
                            <i class="fas fa-user"></i> <%= booking.get("customer_id") %>
                        </a>
                    </td>
                    <td><%= booking.get("film_name") %></td>
                    <td><%= booking.get("show_time") %></td>
                    <td><%= booking.get("seat") %></td>
                    <td>
                        <span class="status-badge status-confirmed">
                            <i class="fas fa-check-circle"></i> Confirmed
                        </span>
                    </td>
                    <td>
                        <a href="#" class="action-link">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="#" class="action-link delete">
                            <i class="fas fa-trash-alt"></i> Cancel
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        
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
                <p><i class="fas fa-envelope"></i> admin@cinemax.lk</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
        </div>
    </footer>

    <script>
        // Confirm before cancelling booking
        document.querySelectorAll('.action-link.delete').forEach(link => {
            link.addEventListener('click', function(e) {
                if (!confirm('Are you sure you want to cancel this booking?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
