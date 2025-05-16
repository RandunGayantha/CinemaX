<%-- 
    Document   : ViewBookingDetails
    Created on : May 16, 2025, 7:52:02 AM
    Author     : oshan
--%>
<%@page import="java.util.List"%>
<%@page import="cinema.model.com.Bookings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Booking Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        p {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Your Booking Details</h2>

<%
    List<Bookings> bookings = (List<Bookings>) request.getAttribute("bookings");
    if (bookings != null && !bookings.isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Film Name</th>
                <th>Show Time</th>
                <th>Seat</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Bookings b : bookings) {
            %>
            <tr>
                <td><%= b.getId() %></td>
                <td><%= b.getFilmName() %></td>
                <td><%= b.getShowTime() %></td>
                <td><%= b.getSeat() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
<%
    } else {
%>
    <p>No bookings found for your account.</p>
<%
    }
%>

</body>
</html>
