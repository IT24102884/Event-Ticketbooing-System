<%@ page import="models.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Admin | Edit-Event</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="assets/css/edit-events.css">
</head>
<body>
<div class="container">
  <div class="logo-container">
    <div class="logo-icon">
      <i class="fas fa-calendar-alt"></i>
    </div>
    <h1>Edit Event</h1>
  </div>

  <%
    Event event = (Event) request.getAttribute("event");
  %>

  <div class="form-container">
    <form action="UpdateProducts" method="post">
      <input type="hidden" name="id" value="<%=event.getId()%>">
      <input type="hidden" name="imagePath" value="<%=event.getImagePath()%>">

      <div class="form-group">
        <label for="name">Event Name</label>
        <input type="text" name="name" id="name" value="<%=event.getName()%>" required>
      </div>

      <div class="form-row">
        <div class="form-group half">
          <label for="date">Date</label>
          <input type="date" name="date" id="date" value="<%=event.getDate()%>" required>
        </div>

        <div class="form-group half">
          <label for="time">Time</label>
          <input type="time" name="time" id="time" value="<%=event.getTime()%>" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group half">
          <label for="price">Price</label>
          <input type="number" step="0.01" name="price" id="price" value="<%=event.getPrice()%>" required>
        </div>

        <div class="form-group half">
          <label for="Tickets">Number of Tickets</label>
          <input type="number" name="tickets" id="Tickets" value="<%=event.getTotalTickets()%>" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group half">
          <label for="location">Location</label>
          <input type="text" name="location" id="location" value="<%=event.getLocation()%>" required>
        </div>

        <div class="col-md-6 mb-3">
        <div class="form-group half">
          <label for="category">Category</label>
          <select class="form-select" name="category" id="category" required>
            <option value="">Select Category</option>
            <option value="Concert">Concert</option>
            <option value="Theater">Theater</option>
            <option value="Family & others">Family</option>
          </select>
        </div>
        </div>
      </div>


      <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" id="description" rows="5"><%=event.getDescription()%></textarea>
      </div>

      <div class="button-group">
        <button type="button" class="cancel-btn" onclick="history.back()">Cancel</button>
        <button type="submit" class="submit-btn">Save Changes</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>