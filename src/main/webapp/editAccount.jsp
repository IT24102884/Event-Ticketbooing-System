<%@ page import="Models.User" %><%--
  Created by IntelliJ IDEA.
  User: geeth
  Date: 3/26/2025
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Go2Event</title>
    <link rel="stylesheet" type="text/css" href="assets/styles/editAcc.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    User user = (User) session.getAttribute("user");

    if(session.getAttribute("user") == null){
        response.sendRedirect("login.jsp");
    }

%>
<div class="container">
    <div class="card">
        <div class="header">
            <h1><i class="fas fa-ticket-alt"></i> Go2Event</h1>
            <h2>Edit Account</h2>
        </div>

        <div class="error-container">
            <p class="error">${error}</p>
        </div>

        <form action="update" method="post" id="editForm" onsubmit="return validatePasswords()">
            <div class="input-group">
                <label for="uname">Name:</label>
                <input type="text" id="uname" name="uname" value="<%=user.getUsername()%>" required>
            </div>

            <div class="input-group">
                <label for="pwd">New Password:</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>

            <div class="input-group">
                <label for="confirmPwd">Confirm Password:</label>
                <input type="password" id="confirmPwd" name="confirmPwd" required>
                <span class="password-message" id="passwordMessage"></span>
            </div>

            <div class="button-group">
                <button type="submit" class="save-btn"><i class="fas fa-save"></i> Save</button>
                <a href="profile.jsp" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Profile</a>
            </div>
        </form>
    </div>
</div>

<script>
    function validatePasswords() {
        const password = document.getElementById("pwd").value;
        const confirmPassword = document.getElementById("confirmPwd").value;
        const messageElement = document.getElementById("passwordMessage");

        if (password !== confirmPassword) {
            messageElement.textContent = "Passwords do not match";
            messageElement.classList.add("error-message");
            messageElement.classList.remove("success-message");
            return false;
        }

        return true;
    }

    // Live validation
    document.addEventListener("DOMContentLoaded", function() {
        const passwordInput = document.getElementById("pwd");
        const confirmInput = document.getElementById("confirmPwd");
        const messageElement = document.getElementById("passwordMessage");

        function checkMatch() {
            if (confirmInput.value === "") {
                messageElement.textContent = "";
                return;
            }

            if (passwordInput.value === confirmInput.value) {
                messageElement.textContent = "Passwords match";
                messageElement.classList.add("success-message");
                messageElement.classList.remove("error-message");
            } else {
                messageElement.textContent = "Passwords do not match";
                messageElement.classList.add("error-message");
                messageElement.classList.remove("success-message");
            }
        }

        confirmInput.addEventListener("input", checkMatch);
        passwordInput.addEventListener("input", checkMatch);
    });
</script>
</body>
</html>