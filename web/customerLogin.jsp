<%-- 
    Document   : customerLogin
    Created on : Apr 26, 2025, 6:24:22 PM
    Author     : oshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Customer Login - Cinema Booking</title>
    <link rel="stylesheet" href="style.css">

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
        }

        h2 {
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px #000;
        }

        form {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #e50914;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #b00610;
            transform: scale(1.05);
        }
        
        a {
            text-decoration: none;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #00bcd4;
        }
    </style>
</head>
<body>
    
    <h2>Customer Login</h2>
    <form action="CustomerLoginServlet" method="post"> 
        NIC: <input type="text" name="nic"/><br/> 
        Password: <input type="password" name="password"/><br/> 
        <input type="submit" value="Login"/> <br><br>
        <a href="RegisterForm.jsp"> Register Now</a>
    </form> 
    
</body>
</html>

