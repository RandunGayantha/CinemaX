<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Summary - CinemaX</title>
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

        /* Payment Container */
        .payment-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 3rem 5%;
            gap: 3rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        @media (max-width: 900px) {
            .payment-container {
                flex-direction: column;
                align-items: center;
            }
        }

        /* Order Summary */
        .order-summary {
            flex: 1;
            max-width: 400px;
            background: var(--gray);
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .order-summary h2 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--primary);
            position: relative;
            padding-bottom: 0.5rem;
        }

        .order-summary h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary);
        }

        .order-details {
            margin-bottom: 2rem;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item .label {
            color: rgba(255, 255, 255, 0.7);
        }

        .order-item .value {
            font-weight: 500;
        }

        .total-amount {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 1.2rem;
            font-weight: 600;
        }

        /* Payment Form */
        .payment-form {
            flex: 1;
            max-width: 500px;
            background: var(--gray);
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .payment-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .payment-form h2 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--light);
            position: relative;
        }

        .payment-form h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.8);
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 62, 0, 0.2);
        }

        .form-group i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(50%);
            color: rgba(255, 255, 255, 0.5);
        }

        .card-icons {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .card-icons img {
            height: 24px;
            filter: grayscale(100%);
            opacity: 0.7;
            transition: all 0.3s;
        }

        .card-icons img:hover {
            filter: grayscale(0);
            opacity: 1;
        }

        .form-row {
            display: flex;
            gap: 1rem;
        }

        .form-row .form-group {
            flex: 1;
        }

        .terms-checkbox {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }

        .terms-checkbox input {
            margin-right: 0.5rem;
        }

        .terms-checkbox label {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
        }

        .terms-checkbox a {
            color: var(--secondary);
            text-decoration: none;
        }

        .terms-checkbox a:hover {
            text-decoration: underline;
        }

        .btn-pay {
            width: 100%;
            padding: 0.8rem;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-pay:hover {
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
            .payment-container {
                padding: 2rem;
            }
            
            nav ul {
                gap: 1.2rem;
            }
        }

        @media (max-width: 576px) {
            .payment-container {
                padding: 1.5rem;
            }
            
            nav ul {
                display: none;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
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
            <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="Booking.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a></li>
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <div class="payment-container">
        <!-- Order Summary -->
        <div class="order-summary">
            <h2>Order Summary</h2>
            <div class="order-details">
                <div class="order-item">
                    <span class="label">Film:</span>
                    <span class="value">${film}</span>
                </div>
                <div class="order-item">
                    <span class="label">Show Time:</span>
                    <span class="value">${time}</span>
                </div>
                <div class="order-item">
                    <span class="label">Selected Seats:</span>
                    <span class="value">${seats}</span>
                </div>
            </div>
            <div class="total-amount">
                <span>Total Amount:</span>
                <span>Rs. ${amount}</span>
            </div>
        </div>

        <!-- Payment Form -->
        <div class="payment-form">
            <h2>Payment Details</h2>
            <form action="PaymentServlet.jsp" method="post">
                <input type="hidden" name="film" value="${film}">
                <input type="hidden" name="time" value="${time}">
                <input type="hidden" name="seats" value="${seats}">
                <input type="hidden" name="amount" value="${amount}">

                <div class="form-group">
                    <label for="cardName">Cardholder Name</label>
                    <i class="fas fa-user"></i>
                    <input type="text" id="cardName" name="cardName" placeholder="Name on card" required>
                </div>

                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <i class="fas fa-credit-card"></i>
                    <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" placeholder="1234 5678 9012 3456" required>
                    
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="expiry">Expiry Date</label>
                        <i class="far fa-calendar-alt"></i>
                        <input type="month" id="expiry" name="expiry" required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV</label>
                        <i class="fas fa-lock"></i>
                        <input type="password" id="cvv" name="cvv" maxlength="3" pattern="\d{3}" placeholder="123" required>
                    </div>
                </div>

                <div class="terms-checkbox">
                    <input type="checkbox" id="terms" required>
                    <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                </div>

                <button type="submit" class="btn-pay">
                    <i class="fas fa-lock"></i> Confirm & Pay
                </button>
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
