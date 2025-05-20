<%--<%@ page isErrorPage="true" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Error</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background-color: #ffeeee;--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            color: #333;--%>
<%--            padding: 30px;--%>
<%--        }--%>
<%--        .error-box {--%>
<%--            border: 1px solid #cc0000;--%>
<%--            background-color: #fff0f0;--%>
<%--            padding: 20px;--%>
<%--            border-radius: 8px;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="error-box">--%>
<%--    <h2>Oops! Something went wrong.</h2>--%>
<%--    <p><strong>Error:</strong> ${pageContext.errorData.throwable}</p>--%>
<%--    <p>Please contact support or try again later.</p>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f1f5f9;
            color: #1e293b;
        }
        .error-container {
            max-width: 650px;
            margin: 3rem auto;
            background: white;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            text-align: center;
            border-left: 4px solid #ef4444;
        }
        .error-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #ef4444;
            margin-bottom: 1.5rem;
        }
        .error-message {
            font-size: 1.125rem;
            color: #1e293b;
            margin-bottom: 1.5rem;
        }
        .btn-back {
            background-color: #4f46e5;
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
        }
        .btn-back:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.3);
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
    </style>
</head>
<body>
<div class="error-container animate__animated animate__shakeX animate-form">
    <h2 class="error-title">
        <i class="fas fa-exclamation-circle mr-2"></i> Oops! Something Went Wrong
    </h2>
    <div class="error-message">
        <%
            String error = request.getParameter("error");
            String errorMessage;
            if (error != null) {
                switch (error) {
                    case "InvalidUserID":
                        errorMessage = "Invalid User ID. Please enter a valid User ID.";
                        break;
                    case "SeatsNotAvailable":
                        errorMessage = "Not enough seats available for this event.";
                        break;
                    case "InvalidInput":
                        errorMessage = "Invalid input. Please check your selections and try again.";
                        break;
                    case "MissingUserIdentifier":
                        errorMessage = "Please enter a User ID or Username.";
                        break;
                    default:
                        errorMessage = error;
                }
            } else {
                errorMessage = exception != null ? exception.getMessage() : "An unexpected error occurred.";
            }
        %>
        <p><strong>Error:</strong> <%= errorMessage %></p>
        <p>Please try again or contact support for assistance.</p>
    </div>
    <a href="bookTicket.jsp" class="btn-back">
        <i class="fas fa-arrow-left mr-2"></i> Back to Booking
    </a>
</div>
<script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
<script>
    anime({
        targets: '.error-message p',
        opacity: [0, 1],
        translateY: [20, 0],
        delay: anime.stagger(100),
        easing: 'easeOutExpo'
    });
</script>
</body>
</html>
