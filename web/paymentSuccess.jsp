<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --dark-bg: #121212;
            --box-bg: #1e1e1e;
            --success-green: #28a745;
            --text-light: #f1f1f1;
            --primary: #ff3e00;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--dark-bg);
            color: var(--text-light);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .success-box {
            background-color: var(--box-bg);
            border-left: 6px solid var(--success-green);
            padding: 2rem 2.5rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            max-width: 500px;
            text-align: center;
        }

        h2 {
            color: var(--success-green);
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #e03900;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h2>✅ Payment Successful</h2>
        <p>Thank you for your booking. We look forward to seeing you at the cinema!</p>
        <a href="customerDashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
