<%-- 
    Document   : admin
    Created on : Apr 26, 2025, 9:11:01 AM
    Author     : oshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Cinema Booking</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            font-size: 3em;
            margin-bottom: 40px;
            text-shadow: 2px 2px 6px #000;
        }

        a {
            display: inline-block;
            margin: 15px;
            padding: 12px 24px;
            font-size: 1.1em;
            color: #fff;
            background-color: #e50914;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #b00610;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <a href="addFilm.jsp">Add Film</a>
    <a href="adminView?action=films">View Films</a>
    <a href="adminView?action=customers">View Customers</a>
    <a href="adminView?action=bookings">View Bookings</a>
    <a href="adminView?action=payments">View Payments</a><br>
    <a href="AdminLogoutServlet">Logout</a>
</body>
</html>

