<%@ page import="java.util.List" %>
<%@ page import="models.Event" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Services.EventService" %>
<%@ page import="Services.MergeSort" %> <%-- MergeSort සඳහා මේ import එක එකතු කරන්න --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Go2Event -Event Management </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/admin-event.css">
</head>
<body>
<div class="header">
    <div class="logo-container">
        <div class="logo-icon">
            <i class="fas fa-ticket-alt"></i>
        </div>
        <h1>Go2Event</h1>
    </div>
    <div class="nav-links">
        <a href="index.jsp">Dashboard</a>
        <a href="admin-event.jsp" class="active">Events</a>
        <a href="#">Users</a>
        <a href="#">Reports</a>
    </div>
</div>
<div class="main-content">
    <div class="page-header">
        <h2>Event Management</h2>
        <a href="add-events.jsp" class="add-button">
            <i class="fas fa-plus"></i> Add Events
        </a>
    </div>
    <h2 class="latest-events-heading">
        <span class="latest">Latest</span> <span class="events">Events</span>
    </h2>
    <div class="event-container">
        <%
            // 1. Service එකෙන් සියලුම events ලබා ගන්න (මේ ලැයිස්තුව වර්ග කර නැත)
            List<Event> allEvents = Services.EventService.displayAllEvents();

            // 2. ඔබගේ MergeSort ඇල්ගොරිතමය භාවිතයෙන් ලැයිස්තුව වර්ග කරන්න
            // මෙය වර්ග කරන ලද (දිනය අනුව පැරණිම දේ මුලින්, ඔබගේ MergeSort logic එකට අනුව) නව ලැයිස්තුවක් ආපසු ලබා දෙනු ඇත.
            List<Event> sortedEvents = Services.MergeSort.sortByDate(allEvents); // ඔබගේ sorting method එක කැඳවන්න!

            // දැන්, 'sortedEvents' ලැයිස්තුව හරහා iterate කරන්න
            if(!sortedEvents.isEmpty()){ // වර්ග කරන ලද ලැයිස්තුව හිස් නොවේ නම් පරීක්ෂා කරන්න
                for(Event event : sortedEvents){ // වර්ග කරන ලද ලැයිස්තුව හරහා iterate කරන්න
                    String categoryClass = "other";
                    if(event.getCategory().equalsIgnoreCase("Concert")) {
                        categoryClass = "concert";
                    } else if(event.getCategory().equalsIgnoreCase("Theater")) {
                        categoryClass = "theater";
                    } else if(event.getCategory().equalsIgnoreCase("Family")) {
                        categoryClass = "family";
                    }
        %>
        <div class="event-card">
            <div class="event-image">
                <a href="event?id=<%=event.getId()%>">
                    <img src="<%= event.getImagePath() %>" alt="<%=event.getName()%>">
                </a>
            </div>
            <div class="event-info">
                <div class="event-id">#<%=event.getId()%></div>
                <h3 class="event-name"><%=event.getName()%></h3>
                <div class="event-price">Rs.<%=event.getPrice()%></div>
                <div class="event-category <%= categoryClass %>"><%=event.getCategory()%></div>
            </div>
            <div class="event-actions">
                <a class="edit-btn" href="edit-event?id=<%=event.getId()%>">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a class="delete-btn" href="delete-event?id=<%=event.getId()%>" onclick="return confirm('Are you sure you want to delete this event?')">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </div>
        </div>
        <%
            } // for loop එක අවසන්
        } else { // වර්ග කරන ලද ලැයිස්තුව හිස් නම්
        %>
        <div class="empty-state">
            <i class="fas fa-calendar-xmark"></i>
            <p>No events available.</p>
        </div>
        <%
            } // if-else එක අවසන්
        %>
    </div>
</div>

<div class="footer">
    <div class="footer-content">
        <div class="footer-logo">
            <div class="logo-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h3>Go2Event</h3>
        </div>
        <p>&copy; 2025 Go2Event. All rights reserved.</p>
    </div>
</div>
</body>
</html>