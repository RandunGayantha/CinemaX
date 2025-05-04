<%-- 
    Document   : customerDashboard
    Created on : Apr 26, 2025, 6:40:19 PM
    Author     : oshan
--%>

<%@page import="cinema.model.com.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Customer DashBoard</h1>
       
<%
    Customer customer =(Customer)session.getAttribute("customer");
    if (customer!=null){
%>
    <h1>Hi,<%=customer.getFullname()%>!</h1>
<%
    } else {response.sendRedirect("customerLogin.jsp");
    }
%>
<p><a href="Booking.jsp">Seat Booking</a></p>
        <a href="CustomerLogoutServlet">Logout</a>
    </body>
</html>
