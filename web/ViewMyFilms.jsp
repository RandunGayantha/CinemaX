<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cinema.model.com.Film"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Films - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #ff3e00;
            --primary-dark: #e63900;
            --secondary: #00a8ff;
            --dark: #121212;
            --darker: #0a0a0a;
            --light: #f5f5f5;
            --gray: #2a2a2a;
            --light-gray: #444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--darker);
            color: var(--light);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        nav {
            background-color: rgba(18, 18, 18, 0.95);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 5%;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        nav .logo {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 2rem;
        }

        nav ul li a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: var(--primary);
        }

        .content {
            padding: 8rem 2rem 4rem;
            flex: 1;
        }

        h2 {
            text-align: center;
            color: var(--light);
            font-size: 2rem;
            margin-bottom: 2rem;
        }

        table {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: var(--gray);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--light-gray);
        }

        th {
            background-color: var(--dark);
            font-weight: 600;
        }

        td {
            color: rgba(255, 255, 255, 0.9);
        }

        tr:hover {
            background-color: var(--light-gray);
        }

        .no-data {
            text-align: center;
            color: #ff4c4c;
            font-size: 1.2rem;
            margin-top: 2rem;
        }

        footer {
            background-color: var(--darker);
            color: var(--light);
            padding: 2rem 5%;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .footer-logo {
            font-size: 1.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 1rem;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            nav ul {
                gap: 1rem;
            }

            table {
                font-size: 0.9rem;
            }

            .content {
                padding: 6rem 1rem 3rem;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                display: none;
            }

            .footer-container {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<nav>
    <div class="logo">
        <i class="fas fa-film"></i> CinemaX
    </div>
    <ul>
        <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="customerLogin.jsp"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="content">
    <h2>All Films</h2>

    <%
        List<Film> filmList = (List<Film>) request.getAttribute("filmList");
        if (filmList != null && !filmList.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Duration</th>
                <th>Language</th>
                <th>Release Date</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <% for (Film film : filmList) { %>
            <tr>
                <td><%= film.getId() %></td>
                <td><%= film.getTitle() %></td>
                <td><%= film.getGenre() %></td>
                <td><%= film.getDuration() %> min</td>
                <td><%= film.getLanguage() %></td>
                <td><%= film.getReleaseDate() %></td>
                <td><%= film.getDescription() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p class="no-data">No film data found.</p>
    <% } %>
</div>

<footer>
    <div class="footer-container">
        <div>
            <div class="footer-logo">
                <i class="fas fa-film"></i> CinemaX
            </div>
            <p>Enjoy the latest films at CinemaX — the ultimate movie experience.</p>
        </div>
        <div>
            <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo 07, Sri Lanka</p>
            <p><i class="fas fa-phone-alt"></i> +94 70 3848480</p>
            <p><i class="fas fa-envelope"></i> support@cinemax.lk</p>
        </div>
    </div>
    <div class="copyright">
        <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>
