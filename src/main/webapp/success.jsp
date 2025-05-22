<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Success</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            color: #1e293b;
        }
        .success-container {
            max-width: 650px;
            margin: 3rem auto;
            background: white;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            text-align: center;
            border-left: 4px solid #10b981;
        }
        .success-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #10b981;
            margin-bottom: 1.5rem;
        }
        .success-message {
            font-size: 1.125rem;
            color: #1e293b;
            margin-bottom: 1.5rem;
        }
        .btn-download, .btn-back {
            background-color: #3b82f6;
            color: white;
            padding: 1rem 2rem;
            border-radius: 10px;
            font-size: 1.125rem;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            margin: 0.5rem;
        }
        .btn-download:hover, .btn-back:hover {
            background-color: #1d4ed8;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(59, 130, 246, 0.3);
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

<!-- Success Message -->
<div class="success-container animate__animated animate__fadeIn animate-form">
    <h2 class="success-title">
        <i class="fas fa-check-circle mr-2"></i> Booking Successful!
    </h2>
    <div class="success-message">
        <p><strong>Ticket ID:</strong> <%= request.getParameter("ticket") %></p>
        <p><strong>Name:</strong> <%= request.getParameter("username") %></p>
        <p><strong>Event:</strong> <%= request.getParameter("eventName") %></p>
        <p><strong>Seats:</strong> <%= request.getParameter("seat") %></p>
        <p><strong>Quantity:</strong> <%= request.getParameter("quantity") %></p>
        <p><strong>Total Price:</strong> $<%= request.getParameter("price") %></p>
    </div>
    <form action="downloadTicket" method="post">
        <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
        <input type="hidden" name="eventName" value="<%= request.getParameter("eventName") %>">
        <input type="hidden" name="seatNumber" value="<%= request.getParameter("seat") %>">
        <input type="hidden" name="price" value="<%= request.getParameter("price") %>">
        <input type="hidden" name="quantity" value="<%= request.getParameter("quantity") %>">
        <button type="submit" class="btn-download">
            <i class="fas fa-download mr-2"></i> Download Ticket
        </button>
    </form>
    <a href="bookTicket.jsp" class="btn-back">
        <i class="fas fa-arrow-left mr-2"></i> Back to Booking
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
<script>
    anime({
        targets: '.success-message p',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        easing: 'easeOutExpo'
    });
</script>
</body>
</html>