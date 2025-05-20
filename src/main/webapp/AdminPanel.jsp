<%@ page import="Models.Admin" %>
<%@ page import="Models.User" %><%--
  Created by IntelliJ IDEA.
  User: Shankar
  Date: 4/13/2025
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Go2Event Admin Dashboard</title>
    <link rel="stylesheet" href="assets/styles/AdminPanel.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700;800&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<div class="page-wrapper">
    <div class="background-gradient"></div>

    <header>
        <div class="logo">
            <span class="icon"><i class="fas fa-ticket-alt"></i></span>
            <span class="logo-text">Go2<span class="highlight">Event</span></span>
        </div>
        <nav class="nav-buttons">
            <a href="AdminPanel.jsp" class="nav-item">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </a>
            <a href="AdminProfile.jsp" class="nav-item">
                <i class="fas fa-user-circle"></i>
                <span>Profile</span>
            </a>
            <div class="nav-indicator"></div>
        </nav>
    </header>

    <main>
        <div class="welcome-section">
            <h1>Hello, <span class="admin-name">${admin.username} </span></h1>
            <p class="subtitle">Welcome to your control center</p>
        </div>

        <div class="dashboard-grid">
            <div class="dashboard-card" onclick="location.href='AdminRegistration.jsp';">
                <div class="card-content">
                    <div class="icon-container">
                        <div class="icon"><i class="fas fa-user-plus"></i></div>
                        <div class="icon-bg"></div>
                    </div>
                    <h2>Add Admin</h2>
                    <p class="card-description">Create new administrator accounts</p>
                    <div class="divider"></div>
                    <div class="card-footer">
                        <span class="view-more">Manage <i class="fas fa-chevron-right"></i></span>
                    </div>
                </div>
            </div>

            <div class="dashboard-card" onclick="location.href='adminsList'">
                <div class="card-content">
                    <div class="icon-container">
                        <div class="icon"><i class="fas fa-users-cog"></i></div>
                        <div class="icon-bg"></div>
                    </div>
                    <h2>Admin Analytics</h2>
                    <p class="card-description">View and edit administrator permissions</p>
                    <div class="divider"></div>
                    <div class="card-footer">
                        <span class="view-more">Manage <i class="fas fa-chevron-right"></i></span>
                    </div>
                </div>
            </div>

            <div class="dashboard-card" onclick="location.href='usersList';">
                <div class="card-content">
                    <div class="icon-container">
                        <div class="icon"><i class="fas fa-users"></i></div>
                        <div class="icon-bg"></div>
                    </div>
                    <h2>User Analytics</h2>
                    <p class="card-description">View user statistics and information</p>
                    <div class="divider"></div>
                    <div class="card-footer">
                        <span class="view-more">View <i class="fas fa-chevron-right"></i></span>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="copyright">
                <p>©Copyright <span id="year">2025</span> | Design and Developed by Shankar</p>
            </div>
            <div class="footer-links">
                <a href="#"><i class="fas fa-shield-alt"></i> Privacy Policy</a>
                <a href="#"><i class="fas fa-question-circle"></i> Help</a>
            </div>
        </div>
    </footer>
</div>
</body>
</html>