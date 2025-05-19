<%@ page import="java.util.List" %>
<%@ page import="Models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Go2Event Admin</title>
    <link rel="stylesheet" href="assets/styles/UsersList.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700;800&family=Inter:wght@300;400;500;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>

<%--<%--%>
<%--    User admin = (User) session.getAttribute("admin");--%>
<%--    if (admin == null) {--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--        return;--%>
<%--    }--%>
<%--%>--%>

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
        <div class="container">
            <h1 class="heading"><i class="fas fa-users"></i> Users List</h1>

            <div class="table-container">
                <table cellspacing="0">
                    <thead class="head">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Role</th>
                    </tr>
                    </thead>

                    <tbody>
                    <%
                        List<String[]> usersList = (List<String[]>) request.getAttribute("usersList");
                        if (usersList != null && !usersList.isEmpty()) {
                            for (String[] user : usersList) {
                    %>
                    <tr>
                        <td><%= user[0] %></td>
                        <td><%= user[1] %></td>
                        <td><%= user[2] %></td>
                        <td><%= user[3] %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="4" style="text-align: center;">No users found</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
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
