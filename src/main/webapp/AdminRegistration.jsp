<%@ page import="Models.User" %><%--
  Created by IntelliJ IDEA.
  User: Shankar
  Date: 4/13/2025
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Go2Event Admin Registration</title>
    <link rel="stylesheet" type="text/css" href="assets/styles/AdminRegistration.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<div class="page-container">
    <div class="background-shapes">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
    </div>

    <div class="signup-container">
        <div class="form-header">
            <div class="brand">
                <span class="icon"><i class="fas fa-ticket-alt"></i></span>
                <span class="logo-text">Go2<span class="highlight">Event</span></span>
            </div>
            <h2>Admin Registration</h2>
            <p>Fill in the details to get started</p>
            <% if(request.getAttribute("error") != null) { %>
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
            <% } %>
            <% if(request.getAttribute("success") != null) { %>
            <div class="success-message">
                <i class="fa fa-check-circle" aria-hidden="true"></i> ${success}
            </div>
            <% } %>
        </div>

        <form action= "AdminRegistration" method="post" id="signup-form">
            <div class="form-group">
                <label for="username">Username</label>
                <div class="input-container">
                    <i class="fas fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Choose a username" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <div class="input-container">
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-container">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                    <i class="fas fa-eye-slash toggle-password"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <div class="input-container">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
                    <i class="fas fa-eye-slash toggle-password"></i>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                <span>Create Account</span>
                <i class="fas fa-arrow-right"></i>
            </button>
        </form>

        <div class="form-footer">
            <a href="AdminPanel.jsp" class="back-link"><i class="fas fa-home"></i> Back to Dashboard</a>
        </div>
    </div>
</div>

<script>
    // Toggle password visibility
    document.querySelectorAll('.toggle-password').forEach(icon => {
        icon.addEventListener('click', function() {
            const input = this.previousElementSibling;
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    });
</script>
</body>
</html>
