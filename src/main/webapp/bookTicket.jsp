<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.io.BufferedReader" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="java.io.IOException" %>--%>
<%--<%@ page import="java.io.FileReader" %>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Buy Tickets</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>
<%--    <link rel="stylesheet" href="css/bookTicket.css">--%>

<%--</head>--%>
<%--<body>--%>
<%--<!-- Header -->--%>
<%--<nav class="bg-white shadow p-4">--%>
<%--    <div class="max-w-7xl mx-auto flex justify-between items-center">--%>
<%--        <div class="logo-container">--%>
<%--            <div class="logo-icon">--%>
<%--                <i class="fas fa-ticket-alt"></i>--%>
<%--            </div>--%>
<%--            <h1 class="text-2xl font-bold text-blue-600">go2Event</h1>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <a href="#" class="text-gray-600 hover:text-blue-600 mx-2">Events</a>--%>
<%--            <a href="#" class="text-gray-600 hover:text-blue-600 mx-2">Support</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<!-- Event Banner -->--%>
<%--<div class="banner">--%>
<%--    <div class="banner-content">--%>
<%--        <h1 class="text-4xl font-bold">Select Your Tickets</h1>--%>
<%--        <p class="text-lg mt-2">Choose your event and reserve your seats now!</p>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Ticket Form -->--%>
<%--<div class="ticket-form">--%>
<%--    <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Ticket Booking</h2>--%>

<%--    <%--%>
<%--        String error = request.getParameter("error");--%>
<%--        if (error != null) {--%>
<%--            String errorMessage = error.equals("InvalidUserID") ? "Invalid User ID. Please enter a valid User ID." : error;--%>
<%--    %>--%>
<%--    <div class="error"><%= errorMessage %></div>--%>
<%--    <% } %>--%>

<%--    <form action="bookTicket" method="post">--%>
<%--        <label for="userID" class="block text-sm font-medium text-gray-700 mb-2">User ID</label>--%>
<%--        <input type="text" id="userID" name="userID" value="U001" required class="input-field">--%>

<%--        <label for="eventID" class="block text-sm font-medium text-gray-700 mb-2">Select Event</label>--%>
<%--        <select id="eventID" name="eventID" required class="select-field" onchange="updatePrice()">--%>
<%--            <option value="" data-price="0.00" disabled selected>Select an event</option>--%>
<%--            <%--%>
<%--                String eventsFilePath = application.getRealPath("/data/events.txt");--%>
<%--                List<String[]> events = new ArrayList<>();--%>
<%--                try (BufferedReader reader = new BufferedReader(new FileReader(eventsFilePath))) {--%>
<%--                    String line;--%>
<%--                    while ((line = reader.readLine()) != null) {--%>
<%--                        String[] parts = line.split(",");--%>
<%--                        if (parts.length == 8) { // eventID,name,date,time,venue,totalSeats,availableSeats,price--%>
<%--                            int availableSeats = Integer.parseInt(parts[6]);--%>
<%--                            if (availableSeats > 0) {--%>
<%--                                events.add(parts);--%>
<%--                            }--%>
<%--                        }--%>
<%--                    }--%>
<%--                } catch (IOException e) {--%>
<%--                    out.println("<option value='' disabled>Error loading events</option>");--%>
<%--                }--%>

<%--                for (String[] event : events) {--%>
<%--                    String eventID = event[0];--%>
<%--                    String name = event[1];--%>
<%--                    String date = event[2];--%>
<%--                    String time = event[3];--%>
<%--                    String venue = event[4];--%>
<%--                    String price = event[7];--%>
<%--                    String displayText = String.format("%s - %s at %s, %s ($%s)", name, date, time, venue, price);--%>
<%--            %>--%>
<%--            <option value="<%= eventID %>" data-price="<%= price %>"><%= displayText %></option>--%>
<%--            <% } %>--%>
<%--        </select>--%>

<%--        <label for="quantity" class="block text-sm font-medium text-gray-700 mb-2">Number of Tickets</label>--%>
<%--        <select id="quantity" name="quantity" required class="select-field" onchange="updatePrice()">--%>
<%--            <option value="1">1</option>--%>
<%--            <option value="2">2</option>--%>
<%--            <option value="3">3</option>--%>
<%--            <option value="4">4</option>--%>
<%--            <option value="5">5</option>--%>
<%--            <option value="6">6</option>--%>
<%--            <option value="7">7</option>--%>
<%--            <option value="8">8</option>--%>
<%--            <option value="9">9</option>--%>
<%--            <option value="10">10</option>--%>
<%--        </select>--%>

<%--        <div id="totalPrice" class="total-price">Total Price: $0.00</div>--%>
<%--        <input type="hidden" id="totalPriceInput" name="totalPrice" value="0.00">--%>

<%--        <button type="submit" class="btn-checkout">Proceed to Checkout</button>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script>--%>
<%--    function updatePrice() {--%>
<%--        const eventSelect = document.getElementById('eventID');--%>
<%--        const quantitySelect = document.getElementById('quantity');--%>
<%--        const totalPriceDisplay = document.getElementById('totalPrice');--%>
<%--        const totalPriceInput = document.getElementById('totalPriceInput');--%>

<%--        const selectedOption = eventSelect.options[eventSelect.selectedIndex];--%>
<%--        const price = selectedOption ? parseFloat(selectedOption.getAttribute('data-price')) : 0;--%>
<%--        const quantity = parseInt(quantitySelect.value) || 1;--%>
<%--        const total = (price * quantity).toFixed(2);--%>

<%--        totalPriceDisplay.textContent = `Total Price: $${total}`;--%>
<%--        totalPriceInput.value = total;--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

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
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --secondary: #f59e0b;
            --dark: #1e293b;
            --light: #f8fafc;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1f5f9;
            color: var(--dark);
        }

        .gradient-bg {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
        }

        .header {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }

        .banner {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
            url('../images/event-banner.jpg') center/cover no-repeat;
            height: 450px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .banner::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(99, 102, 241, 0.3), rgba(79, 70, 229, 0.3));
            z-index: 1;
        }

        .banner-content {
            position: relative;
            z-index: 2;
            text-align: center;
            max-width: 800px;
            padding: 2rem;
        }

        .ticket-form {
            max-width: 650px;
            margin: -100px auto 3rem;
            background: white;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            position: relative;
            z-index: 10;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .ticket-form:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.12);
        }

        .input-field, .select-field {
            width: 100%;
            padding: 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            margin-bottom: 1.25rem;
            transition: all 0.3s;
            background-color: #f8fafc;
        }

        .input-field:focus, .select-field:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
            outline: none;
            background-color: white;
        }

        .select-field {
            appearance: none;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="%2394a3b8"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg>') no-repeat right 1rem center/20px 20px;
        }

        .btn-checkout {
            background-color: var(--primary);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            width: 100%;
            font-size: 1.125rem;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            margin-top: 1rem;
        }

        .btn-checkout:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.3);
        }

        .error {
            color: #ef4444;
            font-size: 0.875rem;
            text-align: center;
            margin-bottom: 1.25rem;
            padding: 0.75rem;
            background-color: #fee2e2;
            border-radius: 8px;
            border-left: 4px solid #ef4444;
        }

        .total-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-dark);
            text-align: center;
            margin: 1.5rem 0;
            padding: 1rem;
            background-color: #f5f3ff;
            border-radius: 10px;
            border: 2px dashed #c7d2fe;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-icon {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            width: 44px;
            height: 44px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            box-shadow: 0 4px 6px rgba(79, 70, 229, 0.2);
        }

        .logo-icon i {
            color: white;
            font-size: 22px;
        }

        .nav-link {
            position: relative;
            color: #64748b;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: var(--primary-dark);
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--primary-dark);
            transition: width 0.3s;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .form-title {
            position: relative;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border-radius: 2px;
        }

        @media (max-width: 768px) {
            .banner {
                height: 350px;
            }

            .ticket-form {
                margin: -80px auto 2rem;
                padding: 1.5rem;
            }
        }


        .animate-form {
            animation: fadeInUp 0.6s ease-out forwards;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        .floating {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
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
            String errorMessage = error.equals("InvalidUserID") ? "Invalid User ID. Please enter a valid User ID." : error;
    %>
    <div class="error animate__animated animate__shakeX"><%= errorMessage %></div>
    <% } %>

    <form action="bookTicket" method="post">
        <div class="mb-6">
            <label for="userID" class="block text-sm font-medium text-gray-700 mb-2">User ID</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-user text-gray-400"></i>
                </div>
                <input type="text" id="userID" name="userID" value="U001" required
                       class="input-field pl-10" placeholder="Enter your user ID">
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
        void totalPriceDisplay.offsetWidth; // Trigger reflow
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