
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ticket = request.getParameter("ticket");
    String username = request.getParameter("username");
    String eventName = request.getParameter("eventName");
    String seat = request.getParameter("seat");
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");
%>
<html>
<head>
    <title>Booking Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('images/ticket-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
        }
        .btn-download {
            background-color: #3b82f6;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .btn-download:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-2xl font-bold text-blue-600 mb-4">🎉 Booking Successful!</h2>
    <p class="text-lg mb-2">Ticket ID: <strong><%= ticket %></strong></p>
    <p class="text-lg mb-2">Event: <strong><%= eventName %></strong></p>
    <p class="text-lg mb-2">Seats: <strong><%= seat %></strong></p>
    <p class="text-lg mb-2">Quantity: <strong><%= quantity %></strong></p>
    <p class="text-lg mb-4">Total Price: <strong>$<%= price %></strong></p>

    <form method="post" action="downloadTicket">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="hidden" name="eventName" value="<%= eventName %>">
        <input type="hidden" name="ticketId" value="<%= ticket %>">
        <input type="hidden" name="seatNumber" value="<%= seat %>">
        <input type="hidden" name="price" value="<%= price %>">
        <input type="hidden" name="quantity" value="<%= quantity %>">
        <button type="submit" class="btn-download">Download Ticket</button>
    </form>
</div>
</body>
</html>