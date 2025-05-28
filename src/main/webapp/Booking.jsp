<%--
  Created by IntelliJ IDEA.
  User: MAHEN
  Date: 5/27/2025
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="book">
    Ticket ID: <input type="text" name="ticketId"><br>
    User ID: <input type="text" name="userId"><br>
    Event ID: <input type="text" name="eventId"><br>
    Seat Number: <input type="text" name="seatNumber"><br>
    Status: <input type="text" name="status"><br>
    Price: <input type="text" name="price"><br>
    Quantity: <input type="text" name="quantity"><br>
    <input type="submit" value="Book Ticket">
</form>
</body>
</html>
