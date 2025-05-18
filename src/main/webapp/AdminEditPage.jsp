<%--
  Created by IntelliJ IDEA.
  User: MAHEN
  Date: 4/13/2025
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile | Go2Event</title>
  <link rel="stylesheet" href="assets/styles/AdminEditPage.css">
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
      <a href="AdminProfile.jsp" class="nav-item">
        <i class="fas fa-user-circle"></i>
        <span>Profile</span>
      </a>
    </nav>
  </header>

  <main>
    <div class="profile-container">
      <div class="profile-header">
        <div class="avatar">
          <i class="fas fa-user-edit"></i>
        </div>
        <h1>Edit Profile</h1>
        <p class="subtitle">Update your account information</p>
      </div>

      <form id="edit-profile-form" class="profile-form" method="post" action="AdminEdit">
        <div class="form-group">
          <label for="username">Username</label>
          <div class="input-container">
            <i class="fas fa-user"></i>
            <input type="text" id="username" name="username" value="AdminUser" required>
          </div>
          <p class="field-hint">You can change your username</p>
        </div>

        <div class="form-group">
          <label for="email">Email Address</label>
          <div class="input-container">
            <i class="fas fa-envelope"></i>
            <input type="email" id="email" name="email" value="UserName" readonly>
          </div>
          <p class="field-hint">Email address cannot be changed</p>
        </div>

        <div class="form-group">
          <label for="role">Role</label>
          <div class="input-container">
            <i class="fas fa-user-shield"></i>
            <input type="text" id="role" name="role" value="Administrator" readonly>
          </div>
        </div>

        <div class="form-group">
          <label for="new-password">New Password</label>
          <div class="input-container">
            <i class="fas fa-lock"></i>
            <input type="password" id="new-password" name="new-password" value="Pass" placeholder="Enter new password">
            <i class="fas fa-eye-slash toggle-password"></i>
          </div>
          <p class="field-hint">Leave blank to keep current password</p>
        </div>

        <div class="form-group">
          <label for="confirm-password">Confirm New Password</label>
          <div class="input-container">
            <i class="fas fa-lock"></i>
            <input type="password" id="confirm-password" name="confirm-password"  placeholder="Confirm new password">
            <i class="fas fa-eye-slash toggle-password"></i>
          </div>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn primary-btn">
            <i class="fas fa-save"></i>
            Save Changes
          </button>
          <a href="index.jsp" class="btn cancel-btn">
            <i class="fas fa-times"></i>
            Cancel
          </a>
        </div>
      </form>
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
  document.querySelectorAll('.toggle-password').forEach(icon => {
    icon.addEventListener('click', function() {
      const input = this.previousElementSibling;
      const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
      input.setAttribute('type', type);
      this.classList.toggle('fa-eye');
      this.classList.toggle('fa-eye-slash');
    });
  });
</script>
</body>
</html>
