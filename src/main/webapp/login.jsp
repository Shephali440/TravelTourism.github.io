<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external CSS for styling -->
</head>
<body>

    <div class="login-form">
        <h2>Login</h2>

        <!-- Display error message if any -->
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
            <div class="error-message">
                <%= errorMessage %>
            </div>
        <%
            }
        %>

        <!-- Login form -->
        <form id="loginForm" action="LoginServlet" method="POST">
            <!-- Dropdown to select menu -->
            <label for="menu">Select Menu</label>
            <select name="menu" id="menu" required>
                
                <option value="client">Client</option>
                <option value="admin">Admin</option>
            </select>

            <!-- Username field -->
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required>

            <!-- Password field -->
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>

            <!-- Login button -->
            <button type="submit">Login</button>
        </form>
        
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>

    <script>
        // Event listener for dynamic form action adjustment
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            const menu = document.getElementById('menu').value;
            if (menu === "client") {
                this.action = "ClientServlet"; // Redirect to client servlet
            } else if (menu === "admin") {
                this.action = "AdminServlet"; // Redirect to admin servlet
            }
        }
    </script>

</body>
</html>
