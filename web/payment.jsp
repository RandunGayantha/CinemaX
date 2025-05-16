<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    String film = (String) session.getAttribute("film");
    String time = (String) session.getAttribute("time");
    String seats = (String) session.getAttribute("seats");
    Integer amount = (Integer) session.getAttribute("amount");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #ff3e00;
            --dark: #121212;
            --gray: #1e1e1e;
            --light: #ffffff;
            --hover: #292929;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--dark);
            color: var(--light);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .payment-container {
            background-color: var(--gray);
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.6);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: var(--primary);
            margin-bottom: 1.5rem;
        }

        .order-summary {
            text-align: left;
            margin-bottom: 2rem;
        }

        .order-item {
            margin-bottom: 10px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: var(--primary);
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e03900;
        }

        .error {
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="payment-container">
    <h2>Order Summary</h2>

    <%
        if (film == null || time == null || seats == null || amount == null) {
    %>
        <div class="error">Session expired or booking details are missing. Please go back and select your seats again.</div>
    <%
        } else {
    %>

    <div class="order-summary">
        <div class="order-item"><strong>Film:</strong> <%= film %></div>
        <div class="order-item"><strong>Show Time:</strong> <%= time %></div>
        <div class="order-item"><strong>Selected Seats:</strong> <%= seats %></div>
        <div class="order-item"><strong>Total Amount:</strong> Rs. <%= amount %></div>
    </div>

    <form action="PaymentServlet" method="post">
        <input type="submit" value="Confirm & Pay" />
    </form>

    <% } %>
</div>

</body>
</html>
