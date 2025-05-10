<%-- 
    Document   : paymentsuccess.jsp
    Created on : May 4, 2025, 7:38:11 PM
    Author     : Rajith Dewmina
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f0fff0;
        }
        .success-box {
            border: 2px solid #28a745;
            background-color: #d4edda;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h2>🎉 Payment Successful!</h2>
        <p>Thank you <strong><%= request.getParameter("cardName") %></strong>, your booking has been confirmed.</p>
        <p><strong>Film:</strong> <%= request.getParameter("film") %></p>
        <p><strong>Show Time:</strong> <%= request.getParameter("time") %></p>
        <p><strong>Seats:</strong> <%= request.getParameter("seats") %></p>
        <p><strong>Total Paid:</strong> Rs. <%= request.getParameter("amount") %></p>
    </div>
</body>
</html>

