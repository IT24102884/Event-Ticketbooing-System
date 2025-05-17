<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Go2Event - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/admin-dashboard.css">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <div class="logo-container d-inline-flex align-items-center">
                <div class="logo-icon">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                Go2Event
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-event.jsp">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Reports</a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="#" class="btn btn-primary">
                    <i class="fas fa-user-circle me-1"></i> Admin Profile
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <div class="dashboard-header">
        <div class="logo-container mb-4">
            <div class="logo-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h1 class="dashboard-title">Admin Dashboard</h1>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card stats-card">
                <div class="stats-icon">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <div class="stats-number">248</div>
                <div class="stats-label">Total Events</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card">
                <div class="stats-icon">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <div class="stats-number">1,842</div>
                <div class="stats-label">Tickets Sold</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card">
                <div class="stats-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stats-number">965</div>
                <div class="stats-label">Total Users</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card">
                <div class="stats-icon">
                    <i class="fas fa-dollar-sign"></i>
                </div>
                <div class="stats-number">Rs 89,452</div>
                <div class="stats-label">Revenue</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 mb-4">
            <div class="sidebar">
                <h5 class="mb-3">Management</h5>
                <a href="#" class="sidebar-link active">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="admin-event.jsp" class="sidebar-link">
                    <i class="fas fa-calendar-alt"></i> Events
                </a>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-ticket-alt"></i> Tickets
                </a>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-users"></i> Users
                </a>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-star"></i> Reviews
                </a>
                <h5 class="mb-3 mt-4">Settings</h5>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-cog"></i> General Settings
                </a>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-user-cog"></i> Account Settings
                </a>
                <a href="#" class="sidebar-link">
                    <i class="fas fa-paint-brush"></i> Appearance
                </a>
                <a href="index.jsp" class="sidebar-link text-danger">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>

        <!-- Main Content Area -->
        <div class="col-md-9">
            <div class="content-area">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="mb-0">Recent Events</h3>
                    <a href="add-events.jsp" id="addNewEventBtn" class="btn btn-primary">
                        <i class="fas fa-plus me-1"></i> Add New Event
                    </a>
                </div>


                <div class="mt-4">
                    <h4>Event Categories</h4>
                    <div class="category-container">
                        <div class="category-item">
                            <div class="category-icon concert-bg">
                                <i class="fas fa-music"></i>
                            </div>
                            <div class="category-label">Concert</div>
                        </div>
                        <div class="category-item">
                            <div class="category-icon theater-bg">
                                <i class="fas fa-theater-masks"></i>
                            </div>
                            <div class="category-label">Theater</div>
                        </div>
                        <div class="category-item">
                            <div class="category-icon family-bg">
                                <i class="fas fa-child"></i>
                            </div>
                            <div class="category-label">Family&Others</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="d-flex align-items-center">
                    <div class="logo-icon me-2">
                        <i class="fas fa-ticket-alt"></i>
                    </div>
                    <h5 class="mb-0">Go2Event Admin Panel</h5>
                </div>
                <p>Manage your events, users, and tickets all in one place.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p>&copy; 2025 Go2Event. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>