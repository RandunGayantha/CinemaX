<%-- 
    Document   : payment
    Created on : May 16, 2025, 6:07:04?PM
    Author     : oshan
--%>

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
    <title>Payment</title>
    <link rel="stylesheet" href="styles.css"> <!-- optional -->
</head>
<body>
    <div class="payment-container">
        <h2>Order Summary</h2>

        <%
            if (film == null || time == null || seats == null || amount == null) {
        %>
            <p style="color:red;">Session expired or booking details are missing. Please go back and select your seats again.</p>
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

