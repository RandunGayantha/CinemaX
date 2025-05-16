<%@ page import="java.util.List" %>
<%@ page import="cinema.model.com.Payment" %>
<%
    List<Payment> payments = (List<Payment>) request.getAttribute("payments");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Payments - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #ff3e00;
            --dark: #121212;
            --darker: #0a0a0a;
            --light: #f5f5f5;
            --gray: #2a2a2a;
            --light-gray: #444;
            --danger: #ff4c4c;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--darker);
            color: var(--light);
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: rgba(18, 18, 18, 0.95);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 999;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
        }

        .logo {
            font-size: 1.6rem;
            font-weight: bold;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            color: transparent;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 1.5rem;
        }

        nav ul li a {
            text-decoration: none;
            color: var(--light);
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: var(--primary);
        }

        .content {
            padding: 7rem 2rem 4rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--light);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--gray);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        th, td {
            padding: 1rem;
            border-bottom: 1px solid var(--light-gray);
            text-align: left;
        }

        th {
            background-color: var(--dark);
        }

        tr:hover {
            background-color: var(--light-gray);
        }

        td {
            color: rgba(255,255,255,0.95);
        }

        .no-payments {
            text-align: center;
            color: var(--danger);
            padding: 2rem 0;
            font-size: 1.2rem;
        }

        .back-link {
            display: inline-block;
            margin: 2rem auto;
            padding: 0.8rem 1.5rem;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.3s;
            display: flex;
            justify-content: center;
            width: fit-content;
        }

        .back-link:hover {
            background-color: #e63900;
        }

        @media (max-width: 768px) {
            .content {
                padding: 6rem 1rem 3rem;
            }

            table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<nav>
    <div class="logo"><i class="fas fa-film"></i> CinemaX</div>
    <ul>
        <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
        <li><a href="customerLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="content">
    <h2>My Payments</h2>

    <%
        if (payments == null || payments.isEmpty()) {
    %>
        <div class="no-payments">No payments found.</div>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Film</th>
                    <th>Show Time</th>
                    <th>Seats</th>
                    <th>Amount (Rs.)</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% for (Payment p : payments) { %>
                <tr>
                    <td><%= p.getFilmName() %></td>
                    <td><%= p.getShowTime() %></td>
                    <td><%= p.getSeats() %></td>
                    <td><%= p.getAmount() %></td>
                    <td><%= p.getStatus() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <%
        }
    %>

    <a class="back-link" href="customerDashboard.jsp"><i class="fas fa-arrow-left"></i>&nbsp; Back to Dashboard</a>
</div>

</body>
</html>
