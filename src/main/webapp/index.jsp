<%@ page import="com.event.model.BookingQueue" %>
<%@ page import="com.event.Service.Node" %>
<%@ page import="com.event.Service.Booking" %>
<%
    BookingQueue queue = (BookingQueue) request.getAttribute("queue");
    Node current = queue.getFront();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Order</title>
</head>
<body>
<h2>Event Booking Order (FIFO)</h2>
<table border="1">
    <tr>
        <th>Ticket ID</th><th>User ID</th><th>Event ID</th><th>Seat Number</th>
        <th>Status</th><th>Price</th><th>Quantity</th><th>Total Price</th>
    </tr>
    <%
        while (current != null) {
            Booking b = current.data;
    %>
    <tr>
        <td><%= b.getTicketId() %></td>
        <td><%= b.getUserId() %></td>
        <td><%= b.getEventId() %></td>
        <td><%= b.getSeatNumber() %></td>
        <td><%= b.getStatus() %></td>
        <td><%= b.getPrice() %></td>
        <td><%= b.getQuantity() %></td>
        <td><%= b.getTotalPrice() %></td>
    </tr>
    <%
            current = current.next;
        }
    %>
</table>
</body>
</html>