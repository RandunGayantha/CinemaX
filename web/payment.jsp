<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Summary</title>
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
            color: #f5f5f5;
            line-height: 1.6;
        }

        /* Header/Navbar */
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

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #ff4b2b;
        }

        /* Payment Form Section */
        .container {
            max-width: 600px;
            margin: 3rem auto;
            padding: 2rem;
            background-color: #1a1a1a;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 75, 43, 0.2);
        }

        h2, h3 {
            color: #ff4b2b;
            margin-bottom: 1rem;
        }

        p {
            margin: 0.5rem 0;
        }

        label {
            display: block;
            margin-top: 1rem;
            font-weight: 500;
        }

        input[type="text"],
        input[type="month"],
        input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            margin-top: 0.3rem;
            border: none;
            border-radius: 8px;
            background-color: #2a2a2a;
            color: #fff;
        }

        input[type="checkbox"] {
            margin-right: 0.5rem;
        }

        input[type="submit"] {
            margin-top: 1.5rem;
            padding: 0.8rem 1.5rem;
            background-color: #ff4b2b;
            border: none;
            border-radius: 25px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e84321;
        }

        /* Footer */
        footer {
            background-color: #1a1a1a;
            color: #aaa;
            text-align: center;
            padding: 1rem;
            font-size: 0.9rem;
            border-top: 1px solid #333;
            margin-top: 3rem;
        }

        @media (max-width: 600px) {
            nav ul {
                flex-direction: column;
                gap: 1rem;
            }

            .container {
                padding: 1.5rem;
                margin: 2rem 1rem;
            }
        }
    </style>
</head>
<body>

<!-- Header/Navbar -->
<nav>
    <div class="logo">CinemaX</div>
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="bookings.jsp">My Bookings</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</nav>

<!-- Payment Form -->
<div class="container">
    <h2>Payment Details</h2>
    <p><strong>Film:</strong> ${film}</p>
    <p><strong>Show Time:</strong> ${time}</p>
    <p><strong>Selected Seats:</strong> ${seats}</p>
    <p><strong>Total Amount:</strong> Rs. ${amount}</p>

    <h3>Enter Card Details</h3>
    <form action="PaymentServlet.jsp" method="post">
        <input type="hidden" name="film" value="${film}">
        <input type="hidden" name="time" value="${time}">
        <input type="hidden" name="seats" value="${seats}">
        <input type="hidden" name="amount" value="${amount}">

        <label for="cardName">Cardholder Name:</label>
        <input type="text" id="cardName" name="cardName" required>

        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" maxlength="16" pattern="\d{16}" required>

        <label for="expiry">Expiry Date:</label>
        <input type="month" id="expiry" name="expiry" required>

        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" maxlength="3" pattern="\d{3}" required>

        <label>
            <input type="checkbox" required> I agree to the Terms & Conditions
        </label>

        <input type="submit" value="Confirm & Pay">
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 CinemaX. All rights reserved.</p>
</footer>

</body>
</html>
