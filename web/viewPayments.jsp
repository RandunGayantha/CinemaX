<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Payments - Cinema Booking</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        h2 {
            font-size: 2.5em;
            margin: 20px 0;
            text-shadow: 2px 2px 4px #000;
        }

        table {
            width: 100%;
            max-width: 1000px;
            border-collapse: collapse;
            background-color: rgba(0,0,0,0.7);
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #1c1c1c;
            color: #fff;
            font-size: 1.1em;
        }

        td {
            font-size: 0.95em;
        }

        a {
            color: #e50914;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>Payment Records</h2>

<%
    List<Map<String, String>> payments = (List<Map<String, String>>) request.getAttribute("payments");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Customer ID</th>
        <th>Booking ID</th>
        <th>Amount</th>
        <th>Payment Date</th>
    </tr>
    <% if (payments != null) {
           for (Map<String, String> payment : payments) { %>
    <tr>
        <td><%= payment.get("id") %></td>
        <td><%= payment.get("customer_id") %></td>
        <td><%= payment.get("booking_id") %></td>
        <td><%= payment.get("amount") %></td>
        <td><%= payment.get("payment_date") %></td>
    </tr>
    <%    }
       } else { %>
    <tr>
        <td colspan="5">No payment records found.</td>
    </tr>
    <% } %>
</table>

<p class="back-link"><a href="admin.jsp">Back to Admin Dashboard</a></p>

</body>
</html>
