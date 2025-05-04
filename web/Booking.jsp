<%-- 
    Document   : Booking
    Created on : Apr 26, 2025, 9:10:35?AM
    Author     : oshan
--%>

<%@page import="cinema.dao.com.BookingsDAO"%>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
    List<String> films = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinematicketsbookingsystem", "root", "1111")) {
        BookingsDAO dao = new BookingsDAO(conn);
        films = dao.getAllFilmNames();
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Book Your Movie - Cinema Booking</title>
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
            padding-top: 30px;
            margin-top: 30px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px #000;
        }

        form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6);
        }

        label {
            font-size: 1.1em;
            margin-bottom: 8px;
            display: block;
        }

        select, input[type="checkbox"] {
            font-size: 1em;
            padding: 8px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        fieldset {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
        }

        legend {
            font-size: 1.3em;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            background-color: #e50914;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #b00610;
            transform: scale(1.05);
        }

        option {
            background-color: #0f2027;
            color: white;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <br><br>
    <h2>Book Your Movie</h2>
    <form action="BookingServlet" method="post">
        <label for="film">Film Name:</label>
        <select name="film" id="film" required>
            <option value="">-- Select Film --</option>
            <% for (String film : films) { %>
                <option value="<%= film %>"><%= film %></option>
            <% } %>
        </select><br><br>

        <label for="time">Show Time:</label>
        <select name="time" id="time" required>
            <option value="">-- Select Time --</option>
            <option value="10:00 AM">10:00 AM</option>
            <option value="1:00 PM">1:00 PM</option>
            <option value="4:00 PM">4:00 PM</option>
            <option value="7:00 PM">7:00 PM</option>
        </select><br><br>

        <fieldset>
            <legend>ODC Seats</legend>
            <input type="checkbox" name="seats" value="O1"> O1
            <input type="checkbox" name="seats" value="O2"> O2
            <input type="checkbox" name="seats" value="O3"> O3
            <input type="checkbox" name="seats" value="O4"> O4
        </fieldset><br>

        <fieldset>
            <legend>Balcony Seats</legend>
            <input type="checkbox" name="seats" value="B1"> B1
            <input type="checkbox" name="seats" value="B2"> B2
            <input type="checkbox" name="seats" value="B3"> B3
            <input type="checkbox" name="seats" value="B4"> B4
        </fieldset><br>

        <fieldset>
            <legend>Box Seats</legend>
            <input type="checkbox" name="seats" value="X1"> X1
            <input type="checkbox" name="seats" value="X2"> X2
            <input type="checkbox" name="seats" value="X3"> X3
            <input type="checkbox" name="seats" value="X4"> X4
        </fieldset><br>

        <input type="submit" value="Book Now">
    </form>
</body>
</html>
