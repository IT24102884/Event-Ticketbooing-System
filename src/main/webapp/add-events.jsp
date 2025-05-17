<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Go2Event - Add New Event</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/admin-dashboard.css">
    <link rel="stylesheet" type="text/css" href="assets/css/add-events.css">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Go2Event</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>

        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="admin-event.jsp">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Reports</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 mb-4">
            <div class="sidebar">
                <h5 class="mb-3">Management</h5>
                <a href="index.jsp" class="sidebar-link">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="admin-event.jsp" class="sidebar-link active">
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
                    <h3 class="mb-0">Create New Event</h3>
                    <a href="admin-event.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-arrow-left me-1"></i> Back to Events
                    </a>
                </div>

                <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    ${error}
                </div>
                <% } %>

                <form action="add-event" method="post" enctype="multipart/form-data" class="event-form">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="name" class="form-label">Event Name</label>
                                <input type="text" class="form-control" name="name" id="name" required>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="category" class="form-label">Category</label>
                                <select class="form-select" name="category" id="category" required>
                                    <option value="">Select Category</option>
                                    <option value="Concert">Concert</option>
                                    <option value="Theater">Theater</option>
                                    <option value="Family & others">Family</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="date" class="form-label">Date</label>
                                <input type="date" class="form-control" name="date" id="date" required>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="time" class="form-label">Time</label>
                                <input type="time" class="form-control" name="time" id="time" required>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="price" class="form-label">Price (Rs)</label>
                                <input type="number" step="0.01" class="form-control" name="price" id="price" required>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="seats" class="form-label">Number of Tickets</label>
                                <input type="number" class="form-control" name="tickets" id="seats" required>
                            </div>
                        </div>

                        <div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label for="location" class="form-label">Location</label>
                                <input type="text" class="form-control" name="location" id="location" required>
                            </div>
                        </div>

                        <div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" name="description" id="description" rows="5" required></textarea>
                            </div>
                        </div>

                        <div class="col-md-12 mb-4">
                            <div class="form-group">
                                <label for="image" class="form-label">Event Image</label>
                                <div class="image-upload-container">
                                    <div class="image-preview" id="imagePreview">
                                        <div class="placeholder">
                                            <i class="fas fa-image"></i>
                                            <span>Upload Image</span>
                                        </div>
                                        <img src="" alt="Event Preview" id="preview-image" style="display: none;">
                                    </div>
                                    <input type="file" class="form-control" name="image" id="image" accept="image/*" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-plus me-1"></i> Create Event
                            </button>
                            <button type="reset" class="btn btn-outline-secondary btn-lg ms-2">
                                <i class="fas fa-undo me-1"></i> Reset
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h5>Go2Event Admin Panel</h5>
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

<!-- Image Preview Script -->
<script>
    document.getElementById('image').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const previewImage = document.getElementById('preview-image');
                const placeholder = document.querySelector('.placeholder');

                previewImage.src = e.target.result;
                previewImage.style.display = 'block';
                placeholder.style.display = 'none';
            }
            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>