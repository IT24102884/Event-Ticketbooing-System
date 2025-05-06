<%--
  Created by IntelliJ IDEA.
  User: geeth
  Date: 3/26/2025
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Go2Event Register</title>
  <link rel="stylesheet" type="text/css" href="assets/styles/register.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="container">
  <div class="form-container">
    <div class="logo-container">
      <div class="logo-icon">
        <i class="fas fa-ticket-alt"></i>
      </div>
      <div class="logo-text">Go2Event</div>
    </div>
    <h2>Create Account</h2>

    <% if(request.getAttribute("error") != null) { %>
    <div class="error-message">
      <i class="fas fa-exclamation-circle"></i> ${error}
    </div>
    <% } %>

    <form action="register" method="post">
      <div class="input-group">
        <label for="username"><i class="fas fa-user"></i> Username</label>
        <input type="text" id="username" name="username" required>
      </div>

      <div class="input-group">
        <label for="email"><i class="fas fa-envelope"></i> Email</label>
        <input type="email" id="email" name="email" required>
      </div>

      <div class="input-group">
        <label for="password"><i class="fas fa-lock"></i> Password</label>
        <input type="password" id="password" name="password" required>
      </div>

      <button type="submit" class="btn-register">Register</button>
    </form>

    <div class="login-link">
      Already have an account? <a href="login">Sign In</a>
    </div>
  </div>
</div>
</body>
</html>