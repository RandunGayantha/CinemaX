<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Customer Registration - CinemaX</title>
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
            position: fixed;
            width: 100%;
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

        /* Registration Container */
        .register-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 6rem 2rem 4rem;
        }

        .register-card {
            background: var(--gray);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            padding: 3rem;
            position: relative;
            overflow: hidden;
        }

        .register-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .register-card h2 {
            font-size: 2rem;
            margin-bottom: 2rem;
            color: var(--light);
            position: relative;
            text-align: center;
        }

        .register-card h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: var(--primary);
            border-radius: 3px;
        }

        .register-form {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        @media (min-width: 600px) {
            .register-form {
                grid-template-columns: 1fr 1fr;
            }
            
            .full-width {
                grid-column: span 2;
            }
        }

        .input-group {
            position: relative;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
            font-size: 0.95rem;
        }

        .input-group input {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            transition: all 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 62, 0, 0.2);
        }

        .input-group i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(50%);
            color: rgba(255, 255, 255, 0.5);
        }

        .btn-register {
            padding: 0.8rem;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 0.5rem;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 62, 0, 0.3);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: rgba(255, 255, 255, 0.7);
            grid-column: span 2;
        }

        .login-link a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .login-link a:hover {
            color: #00d4ff;
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
            .register-card {
                padding: 2rem;
            }
            
            nav ul {
                gap: 1.2rem;
            }
        }

        @media (max-width: 576px) {
            .register-card {
                padding: 1.5rem;
            }
            
            nav ul {
                display: none;
            }
            
            .footer-container {
                flex-direction: column;
                text-align: center;
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
            <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="customerLogin.jsp"><i class="fas fa-sign-in-alt"></i> Customer Login</a></li>
        </ul>
    </nav>

    <div class="register-container">
        <div class="register-card">
            <h2>Create Your Account</h2>
            <form class="register-form" action="RegisterServlet" method="post">
                <div class="input-group full-width">
                    <label for="fullname">Full Name</label>
                    <i class="fas fa-user"></i>
                    <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
                </div>
                
                <div class="input-group">
                    <label for="nic">NIC Number</label>
                    <i class="fas fa-id-card"></i>
                    <input type="text" id="nic" name="nic" placeholder="Enter NIC number" required>
                </div>
                
                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <i class="fas fa-phone"></i>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="Enter phone number" required>
                </div>
                
                <div class="input-group full-width">
                    <label for="email">Email Address</label>
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Enter email address" required>
                </div>
                
                <div class="input-group full-width">
                    <label for="password">Password</label>
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Create password" required>
                </div>
                
                <button type="submit" class="btn-register full-width">
                    <i class="fas fa-user-plus"></i> Register Now
                </button>
                
                <div class="login-link">
                    Already have an account? <a href="customerLogin.jsp"><i class="fas fa-sign-in-alt"></i> Login here</a>
                </div>
            </form>
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
                <p><i class="fas fa-envelope"></i> support@cinemax.lk</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
