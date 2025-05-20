<%@ page import="java.util.List" %>
<%@ page import="Models.User" %><%--
  Created by IntelliJ IDEA.
  User: MAHEN
  Date: 4/15/2025
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin List - Go2Event Admin</title>
  <link rel="stylesheet" href="assets/styles/AdminList.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@400;500;600;700;800&family=Inter:wght@300;400;500;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
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
    <div class="container">
      <h1 class="heading"><i class="fas fa-users-cog"></i> Admin List</h1>

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
            List<String[]> AdminList = (List<String[]>) request.getAttribute("AdminList");
            if (AdminList != null && !AdminList.isEmpty()) {
              for (String[] admins : AdminList) {
          %>
          <tr>
            <td><%= admins[0] %></td>
            <td><%= admins[1] %></td>
            <td><%= admins[2] %></td>
            <td><%= admins[3] %></td>
          </tr>
          <%
            }
          } else {
          %>
          <tr>
            <td colspan="4" style="text-align: center;">No admins found</td>
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

