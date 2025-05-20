<%@ page import="Models.User" %><%--
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

<%
  User admin = (User) session.getAttribute("admin");
  if (admin == null) {
    response.sendRedirect("login.jsp");
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
        <h1>Admin Profile</h1>
        <p class="subtitle">View your account details</p>
      </div>

      <div class="profile-details">
        <div class="detail-group">
          <span class="detail-label">Username</span>
          <div class="detail-value">
            <i class="fas fa-user"></i> ${admin.username}
          </div>
        </div>

        <div class="detail-group">
          <span class="detail-label">Email Address</span>
          <div class="detail-value">
            <i class="fas fa-envelope"></i> ${admin.email}
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

          <form action="adminLogout" method="post" id="logoutForm">
            <button type="button" class="btn logout-btn" id="logout-account">
              <i class="fas fa-sign-out-alt"></i>
              Logout
            </button>
          </form>

          <form action="adminDelete" method="post" id="deleteForm">
            <button type="button" class="btn delete-btn" id="delete-account">
              <i class="fas fa-trash-alt"></i>
              Delete Account
            </button>
          </form>
        </div>
      </div>
    </div>
  </main>

  <!-- Custom Alert/Confirm Dialog -->
  <div class="modal-overlay" id="modal-overlay">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h2 id="modal-title">Confirmation</h2>
          <span class="modal-close" id="modal-close">&times;</span>
        </div>
        <div class="modal-body">
          <p id="modal-message">Are you sure you want to proceed?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn cancel-btn" id="modal-cancel">Cancel</button>
          <button type="button" class="btn confirm-btn" id="modal-confirm">Confirm</button>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="footer-content">
      <div class="copyright">
        <p>©Copyright <span id="year">2025</span> | Design and Developed by CodeWith Shankar</p>
      </div>
    </div>
  </footer>
</div>

<script>
  // Set current year
  document.getElementById('year').textContent = new Date().getFullYear();

  // password visibile
  document.getElementById('toggle-password').addEventListener('click', function() {
    const passwordText = document.getElementById('password-text');

    if (passwordText.textContent === '••••••••') {
      passwordText.textContent = '${admin.password}';
      this.classList.remove('fa-eye-slash');
      this.classList.add('fa-eye');
    } else {
      passwordText.textContent = '••••••••';
      this.classList.remove('fa-eye');
      this.classList.add('fa-eye-slash');
    }
  });

  // Custom modal functionality
  const modalOverlay = document.getElementById('modal-overlay');
  const modalTitle = document.getElementById('modal-title');
  const modalMessage = document.getElementById('modal-message');
  const modalConfirm = document.getElementById('modal-confirm');
  const modalCancel = document.getElementById('modal-cancel');
  const modalClose = document.getElementById('modal-close');

  function showModal(title, message, confirmCallback) {
    modalTitle.textContent = title;
    modalMessage.textContent = message;
    modalOverlay.classList.add('active');

    const newModalConfirm = modalConfirm.cloneNode(true);
    modalConfirm.parentNode.replaceChild(newModalConfirm, modalConfirm);

    // Add new confirm event listener
    newModalConfirm.addEventListener('click', function() {
      hideModal();
      confirmCallback();
    });
  }

  function hideModal() {
    modalOverlay.classList.remove('active');
  }

  // Close modal when clicking cancel or X
  modalCancel.addEventListener('click', hideModal);
  modalClose.addEventListener('click', hideModal);

  // Logout handler
  document.getElementById('logout-account').addEventListener('click', function() {
    showModal('Logout Confirmation', 'Are you sure you want to logout?', function() {
      document.getElementById('logoutForm').submit();
    });
  });

  // Delete account confirmation
  document.getElementById('delete-account').addEventListener('click', function() {
    showModal('Delete Account', 'Are you sure you want to delete your account? This action cannot be undone.', function() {
      document.getElementById('deleteForm').submit();
    });
  });
</script>
</body>
</html>