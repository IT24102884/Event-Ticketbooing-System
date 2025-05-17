<%--
  Created by IntelliJ IDEA.
  User: MAHEN
  Date: 4/13/2025
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Profile | Go2Event</title>
  <link rel="stylesheet" href="assets/styles/AdminProfile.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="page-wrapper">
  <div class="background-gradient"></div>

  <header>
    <div class="logo">
      <span class="icon"><i class="fas fa-ticket-alt"></i></span>
      <span class="logo-text">Go2<span class="highlight">Event</span></span>
    </div>
    <nav class="nav-buttons">
      <a href="index.jsp" class="nav-item">
        <i class="fas fa-home"></i>
        <span>Home</span>
      </a>
      <a href="AdminProfile.jsp" class="nav-item active">
        <i class="fas fa-user-circle"></i>
        <span>Profile</span>
      </a>
    </nav>
  </header>

  <main>
    <div class="profile-container">
      <div class="profile-header">
        <div class="avatar">
          <i class="fas fa-user"></i>
        </div>
        <h1>Admin Profile ${admin.username}</h1>
        <p class="subtitle">View your account details</p>
      </div>

      <div class="profile-details">
        <div class="detail-group">
          <span class="detail-label">Username</span>
          <div class="detail-value">
            <i class="fas fa-user"></i> AdminUser
          </div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Email Address</span>
          <div class="detail-value">
            <i class="fas fa-envelope"></i> admin@go2event.com
          </div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Role</span>
          <div class="detail-value">
            <i class="fas fa-user-shield"></i> Administrator
          </div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Password</span>
          <div class="password-container">
            <div class="detail-value password-value">
              <i class="fas fa-lock"></i> <span id="password-text">••••••••</span>
            </div>
            <i class="fas fa-eye-slash toggle-password" id="toggle-password"></i>
          </div>
        </div>

        <div class="action-buttons">
          <a href="AdminEditPage.jsp" class="btn edit-btn">
            <i class="fas fa-edit"></i>
            Edit Profile
          </a>
          <button type="button" class="btn logout-btn" id="logout-account">
            <i class="fas fa-sign-out-alt"></i>
            Logout
          </button>
          <form action="adminDelete" method="post">
            <button type="submit" class="btn delete-btn" id="delete-account">
              <i class="fas fa-trash-alt"></i>
              Delete Account
            </button>
          </form>
        </div>
      </div>
    </div>
  </main>

  <footer>
    <div class="footer-content">
      <div class="copyright">
        <p>©Copyright <span id="year">2025</span> | Design and Developed by CodeWith Pabitra</p>
      </div>
    </div>
  </footer>
</div>

<script>
  // Toggle password visibility
  document.getElementById('toggle-password').addEventListener('click', function() {
    const passwordText = document.getElementById('password-text');

    if (passwordText.textContent === '••••••••') {
      passwordText.textContent = 'SecurePass123'; // This would be the actual password in a real app
      this.classList.remove('fa-eye-slash');
      this.classList.add('fa-eye');
    } else {
      passwordText.textContent = '••••••••';
      this.classList.remove('fa-eye');
      this.classList.add('fa-eye-slash');
    }
  });

  // Logout handler
  document.getElementById('logout-account').addEventListener('click', function() {
    const confirmed = confirm('Are you sure you want to logout?');

    if (confirmed) {
      alert('Logged out successfully.');
      window.location.href = 'index.jsp';
    }
  });

  // Delete account confirmation
  // document.getElementById('delete-account').addEventListener('click', function() {
  //   const confirmed = confirm('Are you sure you want to delete your account? This action cannot be undone.');
  //
  //   if (confirmed) {
  //     alert('Account deleted successfully.');
  //     window.location.href = "adminDelete";
  //   }
  // });
</script>
</body>
</html>
