<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Go2Event Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/styles/log-in.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="container">
    <div class="login-card">
        <div class="login-header">
            <div class="logo-container">
                <div class="logo-icon">
                    <i class="fas fa-ticket-alt"></i>
                </div>
                <h1>Go2Event</h1>
            </div>
            <h2>Welcome Back</h2>
        </div>

        <% if(request.getAttribute("error") != null) { %>
        <div class="error-message">
            <i class="fas fa-exclamation-circle"></i> ${error}
        </div>
        <% } %>

        <form action="login" method="post" id="loginForm">
            <div class="form-box login">
                <div class="input-group">
                    <label for="username"><i class="fas fa-user"></i> Username</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="input-group">
                    <label for="password"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit" class="login-btn" id="loginButton">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </div>
        </form>

        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Sign Up</a></p>
        </div>
    </div>
</div>

<script>
    // Check if user is logged in
    function checkLoginStatus() {
        const isLoggedIn = <%= session.getAttribute("user") != null %>;

        if (isLoggedIn) {
            // Redirect to dashboard or home page after login
            window.location.href = "dashboard.jsp";
        }
    }

    window.onload = function() {
        let stylesheets = document.styleSheets;
        let found = false;
        for(let i = 0; i < stylesheets.length; i++) {
            try {
                let href = stylesheets[i].href;
                if(href && href.includes('log-in.css')) {
                    found = true;
                    console.log("CSS file found and loaded!");
                    break;
                }
            } catch(e) {}
        }

        if(!found) {
            console.error("CSS file not found or not loaded!");
            alert("CSS file not loaded. Check browser console for details.");
        }
    }
</script>
</body>
</html>