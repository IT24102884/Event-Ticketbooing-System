<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.event.model.Ticket" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>List of Booked Tickets</title>
  <style>
    table {
      border-collapse: collapse;
      width: 90%;
      margin: auto;
    }
    th, td {
      border: 1px solid #666;
      padding: 8px 12px;
      text-align: center;
    }
    th {
      background-color: #f2f2f2;
    }
    h1 {
      text-align: center;
    }
  </style>
</head>
<body>
<h1>Booked Tickets</h1>
<table>
  <tr>
    <th>Ticket ID</th>
    <th>User ID</th>
    <th>Event ID</th>
    <th>Seat Number</th>
    <th>Status</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total Price</th>
  </tr>
  <%
    List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);

    if (tickets != null && !tickets.isEmpty()) {
      for (Ticket ticket : tickets) {
  %>
  <tr>
    <td><%= ticket.getTicketId() %></td>
    <td><%= ticket.getUserId() %></td>
    <td><%= ticket.getEventId() %></td>
    <td><%= ticket.getSeatNumber() %></td>
    <td><%= ticket.getStatus() %></td>
    <td><%= currencyFormat.format(ticket.getPrice()) %></td>
    <td><%= ticket.getQuantity() %></td>
    <td><%= currencyFormat.format(ticket.getTotalPrice()) %></td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="8">No tickets found.</td>
  </tr>
  <%
    }
  %>
</table>
</body>
</html>
