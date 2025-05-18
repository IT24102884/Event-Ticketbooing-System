<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: MAHEN
  Date: 4/15/2025
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="assets/styles/UsersList.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="heading"><i class="fas fa-users"></i> Users List</h1>

    <div class="table-container">
        <table cellspacing="0">
            <thead class="head">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Role</th>
            </tr>
            </thead>

            <tbody>
            <%
                List<String[]> usersList = (List<String[]>) request.getAttribute("usersList");
                for (String[] user : usersList) {
            %>
            <tr>
                <td><%= user[0] %></td>
                <td><%= user[1] %></td>
                <td><%= user[2] %></td>
                <td><%= user[3] %></td>
                    <%
                      }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
