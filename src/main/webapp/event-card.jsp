<%@ page import="models.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Details | Go2Event</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/event-card.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
    <div class="logo-container">
        <div class="logo-icon">
            <i class="fas fa-calendar-alt"></i>
        </div>
        <h1>Go2Event</h1>
    </div>

    <%
        Event event = (Event) request.getAttribute("event");
    %>

    <div class="card">
        <div class="header">
            <a href="javascript:history.back()" class="back-btn">
                <i class="fas fa-arrow-left"></i>
                Back
            </a>
        </div>

        <div class="event-card">
            <div class="event-image">
                <img src="<%=event.getImagePath()%>" alt="<%=event.getName()%>">
                <div class="event-category"><%=event.getCategory()%></div>
            </div>

            <div class="event-info">
                <h2 class="event-name"><%=event.getName()%></h2>

                <div class="event-meta">
                    <div class="meta-item">
                        <i class="far fa-calendar"></i>
                        <span><%=event.getDate()%></span>
                    </div>
                    <div class="meta-item">
                        <i class="far fa-clock"></i>
                        <span><%=event.getTime()%></span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span><%=event.getLocation()%></span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-tag"></i>
                        <span>Rs.<%=event.getPrice()%></span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-receipt"></i>
                        <span><%=event.getTotalTickets()%> Available Tickets</span>
                    </div>
                </div>

                <div class="event-description">
                    <h3>About This Event</h3>
                    <p><%=event.getDescription()%></p>
                </div>

                <div class="event-actions">
                    <a href="book-event?id=<%=event.getId()%>" class="btn-book">
                        <i class="fas fa-ticket-alt"></i> Book Now
                    </a>
                    <a href="share-event?id=<%=event.getId()%>" class="btn-share">
                        <i class="fas fa-share-alt"></i> Share
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>