<%@page import="cinema.model.com.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Details - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

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

        nav ul {
            list-style: none;
            display: flex;
            gap: 2rem;
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

        .content-container {
            padding: 8rem 2rem 4rem;
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: var(--light);
            margin-bottom: 2rem;
            font-size: 2rem;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 800px;
            background-color: var(--gray);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light-gray);
        }

        th {
            background-color: var(--dark);
            color: var(--light);
            font-weight: 600;
        }

        td {
            color: rgba(255, 255, 255, 0.9);
        }

        tr:hover {
            background-color: var(--light-gray);
        }

        .no-details {
            color: #ff4c4c;
            font-size: 1.2rem;
            margin-top: 2rem;
        }

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

        @media (max-width: 768px) {
            nav ul {
                gap: 1rem;
            }

            table {
                font-size: 0.9rem;
            }

            .content-container {
                padding: 6rem 1rem 3rem;
            }
        }

        @media (max-width: 576px) {
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
        <li><a href="customerLogin.jsp"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="content-container">
    <h2>My Details</h2>

    <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
    %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>NIC</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= customer.getId() %></td>
                <td><%= customer.getFullname() %></td>
                <td><%= customer.getNic() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getPassword() %></td>
            </tr>
        </tbody>
    </table>
    <% } else { %>
        <p class="no-details">No customer details found. Please login.</p>
    <% } %>
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
