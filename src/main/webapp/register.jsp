<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external CSS for styling -->
</head>
<body>

    <div class="register-form">
        <h2>Register</h2>

        <!-- Display error message if there is any -->
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

        <!-- Registration form -->
        <form action="RegisterServlet" method="POST">
            <!-- Username field -->
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required>

            <!-- Password field -->
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>

            <!-- Role selection -->
            <label for="role">Role</label>
            <select name="role" id="role" required>
                <option value="client">Client</option>
                <option value="admin">Admin</option>
            </select>

            <!-- Register button -->
            <button type="submit">Register</button>
        </form>

        <!-- Link to login page -->
        <p>Already have an account? <a href="login.jsp">Login here</a></p>

    </div>

</body>
</html>
