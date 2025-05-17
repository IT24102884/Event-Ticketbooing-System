<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ticket = request.getParameter("ticket");
    String username = request.getParameter("username");
    String eventName = request.getParameter("eventName");
%>
<html>
<head>
    <title>Booking Successful</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/ticket-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #2e7d32;
        }

        p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #2e7d32;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1b5e20;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🎉 Booking Successful!</h2>
    <p>Your Ticket ID is: <strong><%= ticket %></strong></p>

    <form method="post" action="downloadTicket">
        <input type="hidden" name="username" value="<%= username %>">
        <input type="hidden" name="eventName" value="<%= eventName %>">
        <input type="hidden" name="ticketId" value="<%= ticket %>">
        <button type="submit">Download Ticket</button>
    </form>
</div>
</body>
</html>
