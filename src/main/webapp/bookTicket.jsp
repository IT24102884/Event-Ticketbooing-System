<%@ page import="java.util.List" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileReader" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buy Tickets</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
        }
        .banner {
            background: url('/images/event-banner.jpg') center/cover no-repeat;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }
        .banner-content {
            background: rgba(0, 0, 0, 0.5);
            padding: 1.5rem;
            border-radius: 8px;
            text-align: center;
        }
        .ticket-form {
            max-width: 600px;
            margin: 2rem auto;
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .input-field, .select-field {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            margin-bottom: 1rem;
        }
        .select-field {
            appearance: none;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20"><path stroke="%236b7280" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 8l4 4 4-4"/></svg>') no-repeat right 0.75rem center/16px 16px;
        }
        .btn-checkout {
            background-color: #3b82f6;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            width: 100%;
            font-size: 1.125rem;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        .btn-checkout:hover {
            background-color: #1d4ed8;
        }
        .error {
            color: #dc2626;
            font-size: 0.875rem;
            text-align: center;
            margin-bottom: 1rem;
        }
        .total-price {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1e3a8a;
            text-align: center;
            margin-bottom: 1rem;
        }
        .logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }
        .logo-icon {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            box-shadow: 0 5px 15px rgba(0, 95, 153, 0.3);
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
        }
        .logo-icon i {
            color: white;
            font-size: 20px;
        }
    </style>
</head>
<body>
<!-- Header -->
<nav class="bg-white shadow p-4">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
        <div class="logo-container">
            <div class="logo-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h1 class="text-2xl font-bold text-blue-600">go2Event</h1>
        </div>
        <div>
            <a href="#" class="text-gray-600 hover:text-blue-600 mx-2">Events</a>
            <a href="#" class="text-gray-600 hover:text-blue-600 mx-2">Support</a>
        </div>
    </div>
</nav>

<!-- Event Banner -->
<div class="banner">
    <div class="banner-content">
        <h1 class="text-4xl font-bold">Select Your Tickets</h1>
        <p class="text-lg mt-2">Choose your event and reserve your seats now!</p>
    </div>
</div>

<!-- Ticket Form -->
<div class="ticket-form">
    <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Ticket Booking</h2>

    <%
        String error = request.getParameter("error");
        if (error != null) {
            String errorMessage = error.equals("InvalidUserID") ? "Invalid User ID. Please enter a valid User ID." : error;
    %>
    <div class="error"><%= errorMessage %></div>
    <% } %>

    <form action="bookTicket" method="post">
        <label for="userID" class="block text-sm font-medium text-gray-700 mb-2">User ID</label>
        <input type="text" id="userID" name="userID" value="U001" required class="input-field">

        <label for="eventID" class="block text-sm font-medium text-gray-700 mb-2">Select Event</label>
        <select id="eventID" name="eventID" required class="select-field" onchange="updatePrice()">
            <option value="" data-price="0.00" disabled selected>Select an event</option>
            <%
                String eventsFilePath = application.getRealPath("/data/events.txt");
                List<String[]> events = new ArrayList<>();
                try (BufferedReader reader = new BufferedReader(new FileReader(eventsFilePath))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] parts = line.split(",");
                        if (parts.length == 8) { // eventID,name,date,time,venue,totalSeats,availableSeats,price
                            int availableSeats = Integer.parseInt(parts[6]);
                            if (availableSeats > 0) {
                                events.add(parts);
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
            %>
            <option value="<%= eventID %>" data-price="<%= price %>"><%= displayText %></option>
            <% } %>
        </select>

        <label for="quantity" class="block text-sm font-medium text-gray-700 mb-2">Number of Tickets</label>
        <select id="quantity" name="quantity" required class="select-field" onchange="updatePrice()">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>

        <div id="totalPrice" class="total-price">Total Price: $0.00</div>
        <input type="hidden" id="totalPriceInput" name="totalPrice" value="0.00">

        <button type="submit" class="btn-checkout">Proceed to Checkout</button>
    </form>
</div>

<script>
    function updatePrice() {
        const eventSelect = document.getElementById('eventID');
        const quantitySelect = document.getElementById('quantity');
        const totalPriceDisplay = document.getElementById('totalPrice');
        const totalPriceInput = document.getElementById('totalPriceInput');

        const selectedOption = eventSelect.options[eventSelect.selectedIndex];
        const price = selectedOption ? parseFloat(selectedOption.getAttribute('data-price')) : 0;
        const quantity = parseInt(quantitySelect.value) || 1;
        const total = (price * quantity).toFixed(2);

        totalPriceDisplay.textContent = `Total Price: $${total}`;
        totalPriceInput.value = total;
    }
</script>
</body>
</html>