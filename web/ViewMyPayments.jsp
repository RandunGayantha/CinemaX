<%-- 
    Document   : ViewMyPayments
    Created on : May 15, 2025, 6:04:40?PM
    Author     : oshan
--%>

<%@ page import="java.util.List" %>
<%@ page import="cinema.model.com.Payment" %>
<%
    List<Payment> payments = (List<Payment>) request.getAttribute("payments");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Payments</title>
</head>
<body>
<h2>My Payments</h2>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Film</th>
        <th>Show Time</th>
        <th>Seats</th>
        <th>Amount (Rs.)</th>
        <th>Status</th>
    </tr>
    <%
        if (payments == null || payments.isEmpty()) {
    %>
    <tr>
        <td colspan="5">No payments found.</td>
    </tr>
    <%
        } else {
            for (Payment p : payments) {
    %>
    <tr>
        <td><%= p.getFilmName() %></td>
        <td><%= p.getShowTime() %></td>
        <td><%= p.getSeats() %></td>
        <td><%= p.getAmount() %></td>
        <td><%= p.getStatus() %></td>
    </tr>
    <%
            }
        }
    %>
</table>

<a href="customerDashboard.jsp">Back to Dashboard</a>
</body>
</html>