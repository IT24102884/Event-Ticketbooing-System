<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    List<String[]> reviews = (List<String[]>) request.getAttribute("reviews");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Go2Event Reviews</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(160deg, #0f2027, #203a43, #2c5364);
            color: white;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 30px 0;
            font-size: 2.5rem;
            color: #00e6ff;
            text-shadow: 1px 1px 3px black;
        }

        .review-card {
            background: #0e0e24;
            margin: 15px auto;
            padding: 25px;
            border-radius: 15px;
            max-width: 700px;
            box-shadow: 0 0 15px rgba(0,0,0,0.6);
            transition: transform 0.2s;
        }

        .review-card:hover {
            transform: scale(1.01);
        }

        .review-card h3 {
            margin-top: 0;
            color: #00e6ff;
        }

        .stars {
            color: gold;
            font-size: 20px;
            margin: 10px 0;
        }

        .button {
            padding: 8px 14px;
            margin: 5px 5px 0 0;
            background-color: #00e6ff;
            color: #000;
            border: none;
            border-radius: 7px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #00c3d6;
        }

        .collapsible-content {
            display: none;
        }

        input[type="text"], textarea, select {
            width: 100%;
            margin: 8px 0;
            padding: 12px;
            font-size: 1rem;
            background-color: #2b2d42;
            color: #fff;
            border: none;
            border-radius: 10px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        form {
            margin-top: 10px;
        }

        .submit-btn {
            background-color: #00e6ff;
            color: #000;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: #00c3d6;
        }
    </style>
    <script>
        function toggleMore() {
            var content = document.getElementById("moreReviews");
            content.style.display = content.style.display === "none" ? "block" : "none";
        }

        function enableEdit(id) {
            document.getElementById('review-text-' + id).style.display = 'none';
            document.getElementById('edit-form-' + id).style.display = 'block';
            document.getElementById('edit-button-' + id).style.display = 'none';
        }
    </script>
</head>
<body>

<h2>Top 5 Reviews</h2>

<div>
    <%
        if (reviews != null) {
            int count = 0;
            for (String[] r : reviews) {
                if (count < 5) {
    %>
    <div class="review-card">
        <h3><%= r[1] %></h3>
        <p id="review-text-<%= r[0] %>"><%= r[2] %></p>
        <div class="stars"><%= "★".repeat(Integer.parseInt(r[3])) %></div>

        <form id="edit-form-<%= r[0] %>" action="review" method="post" style="display:none;">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= r[0] %>">
            <input type="text" name="name" value="<%= r[1] %>" required>
            <textarea name="review" required><%= r[2] %></textarea>
            <select name="rating" required>
                <%
                    for (int i = 5; i >= 1; i--) {
                        String selected = Integer.parseInt(r[3]) == i ? "selected" : "";
                %>
                <option value="<%= i %>" <%= selected %>><%= "★".repeat(i) %></option>
                <% } %>
            </select>
            <button type="submit" class="submit-btn">Update</button>
        </form>

        <form action="review" method="post" style="display:inline;">
            <input type="hidden" name="id" value="<%= r[0] %>" />
            <button class="button" name="action" value="delete">Delete</button>
        </form>
        <button class="button" id="edit-button-<%= r[0] %>" onclick="enableEdit('<%= r[0] %>')">Edit</button>
    </div>
    <%
                    count++;
                }
            }
        }
    %>
</div>

<div style="text-align:center; margin: 20px;">
    <button class="button" onclick="toggleMore()">Show More Reviews</button>
</div>

<div id="moreReviews" class="collapsible-content">
    <%
        if (reviews != null && reviews.size() > 5) {
            for (int i = 5; i < reviews.size(); i++) {
                String[] r = reviews.get(i);
    %>
    <div class="review-card">
        <h3><%= r[1] %></h3>
        <p id="review-text-<%= r[0] %>"><%= r[2] %></p>
        <div class="stars"><%= "★".repeat(Integer.parseInt(r[3])) %></div>

        <form id="edit-form-<%= r[0] %>" action="review" method="post" style="display:none;">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= r[0] %>">
            <input type="text" name="name" value="<%= r[1] %>" required>
            <textarea name="review" required><%= r[2] %></textarea>
            <select name="rating" required>
                <%
                    for (int i2 = 5; i2 >= 1; i2--) {
                        String selected = Integer.parseInt(r[3]) == i2 ? "selected" : "";
                %>
                <option value="<%= i2 %>" <%= selected %>><%= "★".repeat(i2) %></option>
                <% } %>
            </select>
            <button type="submit" class="submit-btn">Update</button>
        </form>

        <form action="review" method="post" style="display:inline;">
            <input type="hidden" name="id" value="<%= r[0] %>" />
            <button class="button" name="action" value="delete">Delete</button>
        </form>
        <button class="button" id="edit-button-<%= r[0] %>" onclick="enableEdit('<%= r[0] %>')">Edit</button>
    </div>
    <%
            }
        }
    %>
</div>

<h2>Submit Your Review</h2>
<form action="review" method="post" style="max-width:600px; margin:30px auto; background-color: #0e0e24; padding: 30px; border-radius: 15px; box-shadow: 0 0 15px rgba(0,0,0,0.6);">
    <input type="text" name="name" placeholder="Your Name" required><br>
    <textarea name="review" placeholder="Your Review" required></textarea><br>
    <select name="rating" required>
        <option value="">Select Rating</option>
        <option value="5">★★★★★ - Excellent</option>
        <option value="4">★★★★ - Very Good</option>
        <option value="3">★★★ - Good</option>
        <option value="2">★★ - Fair</option>
        <option value="1">★ - Poor</option>
    </select><br>
    <button class="submit-btn" type="submit">Submit</button>
</form>

</body>
</html>
