<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Ticket</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 250px;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Book Your Ticket</h2>

    <!-- Display messages -->
    <div class="message">
        <% if (request.getParameter("error") != null) { %>
        <span class="error"><%= request.getParameter("error") %></span>
        <% } else if (request.getParameter("ticket") != null) { %>
        <span class="success">Success! Ticket ID: <%= request.getParameter("ticket") %></span>
        <% } %>
    </div>

    <!-- Form -->
    <form action="bookTicket" method="post">
        <%--@declare id="userid"--%><%--@declare id="eventid"--%>
        <label for="userID">User ID:</label>
        <input type="text" name="userID" value="U001" required>

        <label for="eventID">Event ID:</label>
        <input type="text" name="eventID" value="E101" required>

        <button type="submit">Book Ticket</button>
    </form>
</div>

</body>
</html>

