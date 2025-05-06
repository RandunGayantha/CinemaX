<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Films - Cinema Booking</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        h2 {
            font-size: 2.5em;
            margin: 20px 0;
            text-shadow: 2px 2px 4px #000;
        }

        table {
            width: 100%;
            max-width: 1000px;
            border-collapse: collapse;
            background-color: rgba(0,0,0,0.7);
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #1c1c1c;
            color: #fff;
            font-size: 1.1em;
        }

        td {
            font-size: 0.95em;
        }

        a {
            color: #e50914;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-link {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>All Films</h2>

<%
    List<Map<String, String>> films = (List<Map<String, String>>) request.getAttribute("films");
%>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Duration</th>
        <th>Language</th>
        <th>Release Date</th>
        <th>Description</th>
        <th>Action</th>
    </tr>
    <% for (Map<String, String> film : films) { %>
    <tr>
        <td><%= film.get("id") %></td>
        <td><%= film.get("title") %></td>
        <td><%= film.get("duration") %> mins</td>
        <td><%= film.get("language") %></td>
        <td><%= film.get("release_date") %></td>
        <td><%= film.get("description") %></td>
        <td><a href="adminView?action=delete&id=<%= film.get("id") %>" onclick="return confirm('Are you sure you want to delete this film?')">Delete</a></td>
    </tr>
    <% } %>
</table>

<p class="back-link"><a href="admin.jsp">Back to Admin Dashboard</a></p>

</body>
</html>
