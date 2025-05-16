<%@page import="cinema.model.com.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("customerLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #ff3e00;
            --dark: #121212;
            --light: #ffffff;
            --gray: #1e1e1e;
            --hover: #292929;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--dark);
            color: var(--light);
        }

        nav {
            background-color: var(--gray);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }

        .logo {
            font-size: 1.6rem;
            font-weight: bold;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 1.5rem;
            margin: 0;
            padding: 0;
        }

        nav ul li a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: var(--primary);
        }

        .container {
            max-width: 900px;
            margin: 5rem auto;
            padding: 2rem;
            background-color: var(--gray);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }

        h1 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .greeting {
            text-align: center;
            font-size: 1.3rem;
            margin-bottom: 2rem;
        }

        .dashboard-links {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }

        .dashboard-links a {
            background-color: var(--primary);
            color: white;
            padding: 0.8rem 1.5rem;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            width: 250px;
            text-align: center;
            transition: background-color 0.3s;
        }

        .dashboard-links a:hover {
            background-color: #e03b00;
        }

        @media (max-width: 600px) {
            .dashboard-links a {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<nav>
    <div class="logo"><i class="fas fa-film"></i> CinemaX</div>
    <ul>
        <li><a href="customerLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="container">
    <h1>Customer Dashboard</h1>
    <div class="greeting">Hi, <%= customer.getFullname() %>!</div>

    <div class="dashboard-links">
        <a href="Booking.jsp"><i class="fas fa-chair"></i> Seat Booking</a>
        <a href="ViewMyDetails.jsp"><i class="fas fa-user"></i> My Details</a>
        <a href="ViewCustomerBookingsServlet"><i class="fas fa-ticket-alt"></i> My Bookings</a>
        <a href="ViewCustomerPaymentsServlet"><i class="fas fa-credit-card"></i> My Payments</a>
        <a href="ViewFilmDetailsServlet"><i class="fas fa-film"></i> Film Details</a>
        <a href="CustomerLogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

</body>
</html>
