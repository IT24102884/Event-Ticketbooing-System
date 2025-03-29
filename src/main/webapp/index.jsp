<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Go2Event</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/styles/index.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<!-- Navigation Bar -->
<header class="navbar">
  <div class="navbar-container">
    <div class="navbar-logo">
      <a href="index.jsp">
        <i class="fas fa-ticket-alt"></i> Go2Event
      </a>
    </div>

    <nav class="navbar-menu">
      <ul class="navbar-links">
        <li><a href="#concerts"><i class="fas fa-music"></i> Concerts</a></li>
        <li><a href="#theater"><i class="fas fa-theater-masks"></i> Theater</a></li>
        <li><a href="#family"><i class="fas fa-users"></i> Family</a></li>
        <li><a href="#other"><i class="fas fa-star"></i> Other</a></li>
        <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
      </ul>
      <a href="#" class="download-ticket-btn">
        <i class="fas fa-download"></i> Download Tickets
      </a>
    </nav>
  </div>
</header>

<!-- Hero Section -->
<section class="hero">
  <div class="hero-content">
    <h1>Find Your Perfect Event</h1>
    <p>Discover amazing concerts, shows, and experiences</p>
    <div class="search-box">
      <input type="text" placeholder="Search for events...">
      <button><i class="fas fa-search"></i></button>
    </div>
  </div>
</section>

<!-- Featured Events Section -->
<section class="featured-events">
  <div class="container">
    <h2>Featured Events</h2>
    <div class="event-cards">
      <!-- Concert Card -->
      <div class="event-card">
        <div class="event-image">
          <img src="/api/placeholder/400/300" alt="Concert">
          <div class="event-tag">Concert</div>
        </div>
        <div class="event-details">
          <h3>Summer Music Festival</h3>
          <p class="event-date"><i class="far fa-calendar"></i> Jun 15, 2025</p>
          <p class="event-location"><i class="fas fa-map-marker-alt"></i> Central Park</p>
          <a href="#" class="event-btn">Get Tickets</a>
        </div>
      </div>

      <!-- Theater Card -->
      <div class="event-card">
        <div class="event-image">
          <img src="/api/placeholder/400/300" alt="Theater">
          <div class="event-tag">Theater</div>
        </div>
        <div class="event-details">
          <h3>Hamilton</h3>
          <p class="event-date"><i class="far fa-calendar"></i> May 20, 2025</p>
          <p class="event-location"><i class="fas fa-map-marker-alt"></i> Grand Theater</p>
          <a href="#" class="event-btn">Get Tickets</a>
        </div>
      </div>

      <!-- Family Card -->
      <div class="event-card">
        <div class="event-image">
          <img src="/api/placeholder/400/300" alt="Family">
          <div class="event-tag">Family</div>
        </div>
        <div class="event-details">
          <h3>Circus Spectacular</h3>
          <p class="event-date"><i class="far fa-calendar"></i> Apr 10, 2025</p>
          <p class="event-location"><i class="fas fa-map-marker-alt"></i> City Arena</p>
          <a href="#" class="event-btn">Get Tickets</a>
        </div>
      </div>
    </div>

    <div class="view-more">
      <a href="#" class="view-more-btn">View All Events</a>
    </div>
  </div>
</section>

<!-- Quick Links Section -->
<section class="quick-links">
  <div class="container">
    <div class="links-container">
      <div class="link-box">
        <i class="fas fa-user-circle"></i>
        <h3>Account Management</h3>
        <p>Manage your profile and preferences</p>
        <a href="profile.jsp">Go to Profile</a>
      </div>

      <div class="link-box">
        <i class="fas fa-ticket-alt"></i>
        <h3>My Tickets</h3>
        <p>View and download your tickets</p>
        <a href="#">View Tickets</a>
      </div>

      <div class="link-box">
        <i class="fas fa-headset"></i>
        <h3>Support</h3>
        <p>Need help? Contact our support team</p>
        <a href="#">Get Help</a>
      </div>

      <div class="link-box">
        <i class="fas fa-user-plus"></i>
        <h3>Join Us</h3>
        <p>Create an account for better experience</p>
        <a href="register.jsp">Register Now</a>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="footer">
  <div class="footer-top">
    <div class="container">
      <div class="footer-columns">
        <div class="footer-column">
          <h3>About Go2Event</h3>
          <p>Your premier destination for booking event tickets online. Experience the best events with just a few clicks.</p>
        </div>

        <div class="footer-column">
          <h3>Quick Links</h3>
          <ul>
            <li><a href="#">Upcoming Events</a></li>
            <li><a href="#">Venues</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Terms & Conditions</a></li>
          </ul>
        </div>

        <div class="footer-column">
          <h3>Contact Us</h3>
          <ul class="contact-info">
            <li><i class="fas fa-envelope"></i> support@go2event.com</li>
            <li><i class="fas fa-phone"></i> 076 - 600 8897</li>
            <li><i class="fas fa-map-marker-alt"></i> NO 12/101,Pittugala,Malabe</li>
          </ul>
        </div>

        <div class="footer-column">
          <h3>Follow Us</h3>
          <div class="social-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <div class="container">
      <p>&copy; 2025 Go2Event. All Rights Reserved.</p>
    </div>
  </div>
</footer>
</body>
</html>