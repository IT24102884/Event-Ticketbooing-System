<%@ page import="java.util.List" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.text.DecimalFormat" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buy Tickets</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="css/bookTicket.css">
</head>
<body>
<!-- Header -->
<nav class="header">
    <div class="header-container">
        <div class="logo-container">
            <div class="logo-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h1 class="logo-text">go2Event</h1>
        </div>
        <div class="nav-links">
            <a href="#" class="nav-link">Events</a>
            <a href="#" class="nav-link">Support</a>
        </div>
    </div>
</nav>


<div class="banner">
    <div class="banner-content">
        <h1 class="banner-title">Select Your Tickets</h1>
        <p class="banner-subtitle">Choose your event and reserve your seats now!</p>
    </div>
</div>

<!-- Ticket Form -->
<div class="ticket-form">
    <h2 class="form-title">Ticket Booking</h2>


    <%
        String error = request.getParameter("error");
        if (error != null) {
            String errorMessage = error.equals("InvalidUserID") ? "Invalid User ID. Please enter a valid User ID." :
                    error.equals("SeatsNotAvailable") ? "Not enough seats available for this event." :
                            error.equals("InvalidInput") ? "Invalid input. Please check your selections and try again." :
                                    error.equals("MissingUserIdentifier") ? "Please enter a User ID or Username." : error;
    %>
    <div class="error"><%= errorMessage %></div>
    <% } %>


    <%
        DecimalFormat df = new DecimalFormat("0.00");
        String defaultQuantity = "1";
        String defaultPrice = "0.00";
        String defaultTotal = "0.00";

        String selectedQuantity = request.getParameter("quantity");
        String selectedEventId = request.getParameter("eventID");

        if (selectedQuantity == null) selectedQuantity = defaultQuantity;
    %>

    <form action="bookTicket" method="post">
        <label for="userID" class="form-label">User ID</label>
        <input type="text" id="userID" name="userID" value="U001" required class="input-field">

        <label for="eventID" class="form-label">Select Event</label>
        <select id="eventID" name="eventID" required class="select-field" onchange="updatePrice()">
            <option value="" data-price="0.00" disabled selected>Select an event</option>
            <%
                String eventsFilePath = application.getRealPath("/data/events.txt");
                List<String[]> events = new ArrayList<>();
                try (BufferedReader reader = new BufferedReader(new FileReader(eventsFilePath))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(",");
                        if (parts.length == 8) {
                            int availableSeats = Integer.parseInt(parts[6]);
                            if (availableSeats > 0) {
                                events.add(parts);
                                if (selectedEventId != null && selectedEventId.equals(parts[0])) {
                                    defaultPrice = parts[7];
                                    defaultTotal = df.format(Double.parseDouble(defaultPrice) * Integer.parseInt(selectedQuantity));
                                }
                            }
                        }
                    }
                } catch (IOException e) {
                    out.println("<option value='' disabled>Error loading events</option>");
                }

                for (String[] event : events) {
                    String eventID = event[0];
                    String name = event[1];
                    String date = event[2];
                    String time = event[3];
                    String venue = event[4];
                    String price = event[7];
                    String displayText = String.format("%s - %s at %s, %s ($%s)", name, date, time, venue, price);
                    boolean isSelected = selectedEventId != null && selectedEventId.equals(eventID);
            %>
            <option value="<%= eventID %>" data-price="<%= price %>" <%= isSelected ? "selected" : "" %>><%= displayText %></option>
            <% } %>
        </select>

        <label for="quantity" class="form-label">Number of Tickets</label>
        <select id="quantity" name="quantity" required class="select-field" onchange="updatePrice()">
            <% for (int i = 1; i <= 10; i++) {
                boolean isSelected = selectedQuantity.equals(String.valueOf(i));
            %>
            <option value="<%= i %>" <%= isSelected ? "selected" : "" %>><%= i %></option>
            <% } %>
        </select>

        <div id="totalPrice" class="total-price">Total Price: $<%= defaultTotal %></div>
        <input type="hidden" id="totalPriceInput" name="totalPrice" value="<%= defaultTotal %>">

        <button type="submit" class="btn-checkout">Proceed to Checkout</button>
    </form>
</div>

<script src="js/bookTicket.js"></script>
</body>
</html>