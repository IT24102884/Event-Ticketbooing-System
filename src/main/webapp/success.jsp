<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Success</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/success.css">
</head>
<body>
<div class="success-container">
    <div class="success-icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <h1>🎉 Booking Successful!</h1>

<%--    <div class="ticket-details">--%>
<%--        <div class="detail-row">--%>
<%--            <span class="detail-label">Ticket ID:</span>--%>
<%--            <span class="detail-value"><%= request.getParameter("ticket") != null ? request.getParameter("ticket") : "N/A" %></span>--%>
<%--        </div>--%>
<%--        <div class="detail-row">--%>
<%--            <span class="detail-label">Event:</span>--%>
<%--            <span class="detail-value"><%= request.getParameter("eventName") != null ? request.getParameter("eventName") : "N/A" %></span>--%>
<%--        </div>--%>
<%--        <div class="detail-row">--%>
<%--            <span class="detail-label">Seats:</span>--%>
<%--            <span class="detail-value"><%= request.getParameter("seat") != null ? request.getParameter("seat") : "N/A" %></span>--%>
<%--        </div>--%>
<%--        <div class="detail-row">--%>
<%--            <span class="detail-label">Quantity:</span>--%>
<%--            <span class="detail-value"><%= request.getParameter("quantity") != null ? request.getParameter("quantity") : "N/A" %></span>--%>
<%--        </div>--%>
<%--        <div class="detail-row">--%>
<%--            <span class="detail-label">Total Price:</span>--%>
<%--            <span class="detail-value">$<%= request.getParameter("price") != null ? request.getParameter("price") : "N/A" %></span>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="ticket-details">
        <div class="detail-row">
            <span class="detail-label">Ticket ID:</span>
            <span class="detail-value">
            <%= session.getAttribute("ticketID") != null ? session.getAttribute("ticketID") : "N/A" %>
        </span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Event:</span>
            <span class="detail-value">
            <%= session.getAttribute("eventName") != null ? session.getAttribute("eventName") : "N/A" %>
        </span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Seats:</span>
            <span class="detail-value">
            <%= session.getAttribute("seat") != null ? session.getAttribute("seat") : "N/A" %>
        </span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Quantity:</span>
            <span class="detail-value">
            <%= session.getAttribute("quantity") != null ? session.getAttribute("quantity") : "N/A" %>
        </span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Total Price:</span>
            <span class="detail-value">
            $<%= session.getAttribute("price") != null ? session.getAttribute("price") : "N/A" %>
        </span>
        </div>
    </div>


<%--    <form action="downloadTicket" method="post">--%>
<%--        <input type="hidden" name="username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">--%>
<%--        <input type="hidden" name="eventName" value="<%= request.getParameter("eventName") != null ? request.getParameter("eventName") : "" %>">--%>
<%--        <input type="hidden" name="seatNumber" value="<%= request.getParameter("seat") != null ? request.getParameter("seat") : "" %>">--%>
<%--        <input type="hidden" name="price" value="<%= request.getParameter("price") != null ? request.getParameter("price") : "" %>">--%>
<%--        <input type="hidden" name="quantity" value="<%= request.getParameter("quantity") != null ? request.getParameter("quantity") : "" %>">--%>
<%--        <button type="submit" class="btn-download">--%>
<%--            <i class="fas fa-download"></i> Download Ticket--%>
<%--        </button>--%>
<%--    </form>--%>
    <form method="post" action="downloadTicket">
        <input type="hidden" name="username" value="<%= session.getAttribute("username") %>">
        <input type="hidden" name="eventName" value="<%= session.getAttribute("eventName") %>">
        <input type="hidden" name="ticketId" value="<%= session.getAttribute("ticketID") %>">
        <input type="hidden" name="seatNumber" value="<%= session.getAttribute("seat") %>">
        <input type="hidden" name="quantity" value="<%= session.getAttribute("quantity") %>">
        <input type="hidden" name="price" value="<%= session.getAttribute("price") %>">

        <button type="submit" class="btn-download">'
            <i class="fas fa-download"></i> Download Ticket
        </button>
    </form>

</div>

<script>

    document.addEventListener('DOMContentLoaded', function() {
        const colors = ['#4361ee', '#3a0ca3', '#f72585', '#4cc9f0', '#7209b7'];
        const container = document.querySelector('.success-container');

        for (let i = 0; i < 50; i++) {
            const confetti = document.createElement('div');
            confetti.className = 'confetti';
            confetti.style.left = Math.random() * 100 + '%';
            confetti.style.top = -10 + 'px';
            confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
            confetti.style.transform = 'rotate(' + Math.random() * 360 + 'deg)';
            container.appendChild(confetti);

            setTimeout(() => {
                confetti.style.opacity = '1';
                confetti.style.animation = `fall ${Math.random() * 3 + 2}s linear forwards`;
            }, Math.random() * 1000);
        }


        const style = document.createElement('style');
        style.innerHTML = `
                @keyframes fall {
                    to {
                        transform: translateY(500px) rotate(360deg);
                        opacity: 0;
                    }
                }
            `;
        document.head.appendChild(style);
    });
</script>
</body>
</html>