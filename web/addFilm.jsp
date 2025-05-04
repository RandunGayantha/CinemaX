<%-- 
    Document   : addFilm
    Created on : Apr 26, 2025, 9:09:04 AM
    Author     : oshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Film - Cinema Booking</title>
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
            max-width: 500px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
        }

        textarea {
            resize: vertical;
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

<h2>Add New Film</h2>

<form action="AddFilmServlet" method="post">
    <label for="title">Film Title:</label>
    <input type="text" name="title" required>

    <label for="genre">Genre:</label>
    <input type="text" name="genre" required>

    <label for="duration">Duration (minutes):</label>
    <input type="number" name="duration" required>

    <label for="language">Language:</label>
    <input type="text" name="language" required>

    <label for="release_date">Release Date:</label>
    <input type="date" name="release_date" required>

    <label for="description">Description:</label>
    <textarea name="description" rows="4" cols="40"></textarea>

    <input type="submit" value="Add Film">
</form>

<p><a href="admin.jsp">Back to Admin DashBoard</a></p>

</body>
</html>

