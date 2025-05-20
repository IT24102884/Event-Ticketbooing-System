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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <link rel="stylesheet" href="css/bookTicket.css">
    <style>

    </style>
</head>
<body>
<!-- Header -->
<header class="header sticky top-0 z-50">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <div class="flex justify-between items-center">
            <div class="logo-container">
                <div class="logo-icon">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <h1 class="text-2xl font-bold text-indigo-600">go2Event</h1>
            </div>
            <div class="hidden md:flex space-x-8">
                <a href="#" class="nav-link">Events</a>
                <a href="#" class="nav-link">Support</a>
                <a href="#" class="nav-link">My Tickets</a>
                <a href="#" class="nav-link">Contact</a>
            </div>
            <button class="md:hidden text-gray-600">
                <i class="fas fa-bars text-xl"></i>
            </button>
        </div>
    </nav>
</header>

<!-- Event Banner -->
<div class="banner">
    <div class="banner-content animate__animated animate__fadeIn">
        <h1 class="text-5xl font-bold mb-4 floating">Select Your Tickets</h1>
        <p class="text-xl opacity-90">Secure your spot at the hottest events in town</p>
        <div class="mt-6">
            <span class="inline-block bg-indigo-500 text-white px-4 py-2 rounded-full text-sm font-medium animate__animated animate__pulse animate__infinite">
                Limited seats available!
            </span>
        </div>
    </div>
</div>

<!-- Ticket Form -->
<div class="ticket-form animate-form">
    <h2 class="text-3xl font-bold text-gray-800 mb-6 form-title">Ticket Booking</h2>

    <%
        String error = request.getParameter("error");
        if (error != null) {
            String errorMessage = error.equals("InvalidUserID") ? "Invalid Username. Please enter a valid name." : error;
    %>
    <div class="error animate__animated animate__shakeX"><%= errorMessage %></div>
    <% } %>

    <form action="bookTicket" method="post">
        <div class="mb-6">
            <label for="userIdentifier" class="block text-sm font-medium text-gray-700 mb-2">Your Name</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-user text-gray-400"></i>
                </div>
                <input type="text" id="userIdentifier" name="userIdentifier" value="" required
                       class="input-field pl-10" placeholder="Enter your full name">
            </div>
        </div>

        <div class="mb-6">
            <label for="eventID" class="block text-sm font-medium text-gray-700 mb-2">Select Event</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-calendar-alt text-gray-400"></i>
                </div>
                <select id="eventID" name="eventID" required class="select-field pl-10" onchange="updatePrice()">
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
            </div>
        </div>

        <div class="mb-6">
            <label for="quantity" class="block text-sm font-medium text-gray-700 mb-2">Number of Tickets</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-ticket-alt text-gray-400"></i>
                </div>
                <select id="quantity" name="quantity" required class="select-field pl-10" onchange="updatePrice()">
                    <option value="1">1 Ticket</option>
                    <option value="2">2 Tickets</option>
                    <option value="3">3 Tickets</option>
                    <option value="4">4 Tickets</option>
                    <option value="5">5 Tickets</option>
                    <option value="6">6 Tickets</option>
                    <option value="7">7 Tickets</option>
                    <option value="8">8 Tickets</option>
                    <option value="9">9 Tickets</option>
                    <option value="10">10 Tickets</option>
                </select>
            </div>
        </div>

        <div id="totalPrice" class="total-price animate__animated animate__fadeIn">Total Price: $0.00</div>
        <input type="hidden" id="totalPriceInput" name="totalPrice" value="0.00">

        <button type="submit" class="btn-checkout">
            <i class="fas fa-lock mr-2"></i> Secure Checkout
        </button>

        <div class="mt-4 text-center text-sm text-gray-500">
            <i class="fas fa-shield-alt mr-1 text-indigo-500"></i> Secure payment processing
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
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

        totalPriceDisplay.classList.remove('animate__pulse');
        void totalPriceDisplay.offsetWidth;
        totalPriceDisplay.classList.add('animate__pulse');

        totalPriceDisplay.textContent = `Total Price: $${total}`;
        totalPriceInput.value = total;
    }

    document.addEventListener('DOMContentLoaded', function() {
        anime({
            targets: '.ticket-form input, .ticket-form select, .ticket-form button',
            opacity: [0, 1],
            translateY: [20, 0],
            delay: anime.stagger(100),
            easing: 'easeOutExpo'
        });
        updatePrice();
    });
</script>
</body>
</html>