<%@ page import="Models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Go2Event</title>
    <link rel="stylesheet" type="text/css" href="assets/styles/profile.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>
<div class="container">
    <div class="profile-container">
        <div class="header">
            <div class="logo">
                <i class="fas fa-ticket-alt"></i> Go2Event
            </div>
        </div>

        <div class="profile-content">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>

            <h1>Hello, <%= user.getUsername() %></h1>
            <p class="welcome-text">Welcome to your Go2Event profile</p>

            <div class="profile-actions">
                <a href="editAccount.jsp" class="btn btn-edit">
                    <i class="fas fa-user-edit"></i> Edit Account
                </a>
                <a href="logout" class="btn btn-logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>

                <!-- Delete Account POST Form -->
                <form action="delete" method="post" style="display:inline;">
                    <button type="submit" class="btn btn-delete">
                        <i class="fas fa-user-times"></i> Delete Account
                    </button>
                </form>
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2025 Go2Event - All Rights Reserved</p>
        </div>
    </div>
</div>
</body>
</html>
