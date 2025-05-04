<%-- 
    Document   : cutomererror
    Created on : Apr 26, 2025, 6:38:44 PM
    Author     : oshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed - Cinema Booking</title>
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
            color: #ff4d4d;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px #000;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        a {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #e50914;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: bold;
        }

        a:hover {
            background-color: #b00610;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h2>Login Failed</h2>
    <p>Invalid NIC or password. Please try again.</p>
    <a href="customerLogin.jsp">Back to Login</a>
</body>
</html>

