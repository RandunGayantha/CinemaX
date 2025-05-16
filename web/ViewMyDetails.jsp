<%-- 
    Document   : ViewMyDetails
    Created on : May 15, 2025, 6:04:18 PM
    Author     : oshan
--%>

<%@page import="cinema.model.com.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<%
    Customer customer = (Customer) session.getAttribute("customer"); // ✅ Correct: session scope
    if (customer != null) {
%>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>NIC</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= customer.getId() %></td>
                <td><%= customer.getFullname() %></td>
                <td><%= customer.getNic() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPhone() %></td>
                <td><%= customer.getPassword() %></td>
            </tr>
        </tbody>
    </table>
<%
    } else {
%>
    <p style="color:red; text-align:center;">No customer details found. Please login.</p>
<%
    }
%>

</body>
</html>