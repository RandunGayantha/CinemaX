<%-- 
    Document   : payment.jsp
    Created on : May 4, 2025, 7:31:55 PM
    Author     : Rajith Dewmina
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        input, select {
            padding: 5px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h2>Payment Details</h2>
    
    <p><strong>Film:</strong> ${film}</p>
    <p><strong>Show Time:</strong> ${time}</p>
    <p><strong>Selected Seats:</strong> ${seats}</p>
    <p><strong>Total Amount:</strong> Rs. ${amount}</p>

    <h3>Enter Card Details</h3>
    <form action="PaymentServlet.jsp" method="post">
        <!-- Hidden data to pass along -->
        <input type="hidden" name="film" value="${film}">
        <input type="hidden" name="time" value="${time}">
        <input type="hidden" name="seats" value="${seats}">
        <input type="hidden" name="amount" value="${amount}">

        <label>Cardholder Name:</label><br>
        <input type="text" name="cardName" required><br>

        <label>Card Number:</label><br>
        <input type="text" name="cardNumber" maxlength="16" pattern="\d{16}" required><br>

        <label>Expiry Date:</label><br>
        <input type="month" name="expiry" required><br>

        <label>CVV:</label><br>
        <input type="password" name="cvv" maxlength="3" pattern="\d{3}" required><br>

        <label>
            <input type="checkbox" required> I agree to the Terms & Conditions
        </label><br><br>

        <input type="submit" value="Confirm & Pay">
    </form>
</body>
</html>
