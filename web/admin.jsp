<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard - CinemaX</title>
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

        /* Dashboard Content */
        .dashboard-container {
            flex: 1;
            padding: 3rem 5%;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        .dashboard-header {
            margin-bottom: 3rem;
            text-align: center;
        }

        .dashboard-header h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--light);
            position: relative;
            display: inline-block;
        }

        .dashboard-header h1::after {
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

        .dashboard-header p {
            color: rgba(255, 255, 255, 0.7);
            max-width: 600px;
            margin: 0 auto;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .dashboard-card {
            background: var(--gray);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary);
        }

        .dashboard-card h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--light);
        }

        .dashboard-card p {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
        }

        .btn-card {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border-radius: 8px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-card:hover {
            box-shadow: 0 5px 15px rgba(255, 62, 0, 0.3);
        }

        .logout-container {
            text-align: center;
            margin-top: 3rem;
        }

        .btn-logout {
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

        .btn-logout:hover {
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
            
            .dashboard-header h1 {
                font-size: 2rem;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                display: none;
            flex-direction: column;
                gap: 1rem;
            }
            
            .dashboard-grid {
                grid-template-columns: 1fr;
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
            <li><a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            
            <li><a href="AdminLogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <div class="dashboard-container">
        <div class="dashboard-header">
            <h1>Admin Dashboard</h1>
            <p>Manage all aspects of your cinema system from this centralized control panel</p>
        </div>

        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h3>Add New Film</h3>
                <p>Add a new movie to your cinema's repertoire</p>
                <a href="addFilm.jsp" class="btn-card">Go to Add Film</a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-film"></i>
                </div>
                <h3>View Films</h3>
                <p>Manage all current and upcoming films</p>
                <a href="adminView?action=films" class="btn-card">View Films</a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-users"></i>
                </div>
                <h3>View Customers</h3>
                <p>View and manage customer accounts</p>
                <a href="adminView?action=customers" class="btn-card">View Customers</a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <h3>View Bookings</h3>
                <p>Monitor all ticket bookings and reservations</p>
                <a href="adminView?action=bookings" class="btn-card">View Bookings</a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <h3>View Payments</h3>
                <p>Track all payment transactions</p>
                <a href="adminView?action=payments" class="btn-card">View Payments</a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Reports & Analytics</h3>
                <p>View business insights and statistics</p>
                <a href="#" class="btn-card">Coming Soon</a>
            </div>
        </div>

        
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
</body>
</html>
