<%-- 
    Document   : addFilmResult
    Created on : Apr 28, 2025, 9:57:10 AM
    Author     : oshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Film Status - Cinema Booking</title>
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

        h2 {
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px #000;
        }

        p {
            font-size: 1.2em;
        }

        a {
            color: #1db954;
            text-decoration: none;
            font-weight: bold;
            margin: 0 10px;
            padding: 8px 16px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
    </style>
</head>
<body>
    <h2>${message}</h2>
    <p>
        <a href="addFilm.jsp">Add Another Film</a> |
        <a href="admin.jsp">Back to Admin Dashboard</a>
    </p>
</body>
</html>

