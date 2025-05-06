<%-- 
    Document   : RegisterForm
    Created on : Apr 26, 2025, 9:12:56 AM
    Author     : Randun Gayantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration - Cinema Booking</title>
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
            min-height: 100vh;
        }

        h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px #000;
        }

        form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            width: 100%;
            max-width: 400px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #e50914;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 1em;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #b00610;
            transform: scale(1.03);
        }

        p {
            margin-top: 20px;
            text-align: center;
        }

        a {
            color: #1db954;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>Customer Registration</h2>

    <form action="RegisterServlet" method="post">
        <label for="fullname">Full Name:</label>
        <input type="text" name="fullname" required>

        <label for="nic">NIC Number:</label>
        <input type="text" name="nic" required>

        <label for="email">Email Address:</label>
        <input type="email" name="email" required>

        <label for="phone">Phone Number:</label>
        <input type="tel" name="phone" pattern="[0-9]{10}" required>

        <label for="password">Password:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Register">
    </form>

    <p>Already have an account? <a href="customerLogin.jsp">Login here</a></p>

</body>
</html>

