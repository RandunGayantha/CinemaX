<%-- 
    Document   : ViewMyFilms
    Created on : May 16, 2025, 6:50:35 PM
    Author     : oshan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cinema.model.com.Film"%>

<!DOCTYPE html>
<html>
<head>
    <title>Film List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">All Films</h2>

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
<%
    } else {
%>
    <p style="text-align:center; color:red;">No film data found.</p>
<%
    }
%>

</body>
</html>

