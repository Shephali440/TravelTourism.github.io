<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Tour</title>
    <link rel="stylesheet" href="searchTour.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="container">
        <h1>Search for a Tour</h1>
        <!-- Form to search for tours -->
        <form action="searchTour.jsp" method="get">
            <label for="tourName">Enter Tour Name:</label>
            <input type="text" id="tourName" name="tourName" placeholder="Enter tour name" required>
            <button type="submit">Search</button>
        </form>

        <%
            // Get the tourName parameter from the form
            String tourName = request.getParameter("tourName");

            // Check if the user has entered a tour name
            if (tourName != null && !tourName.trim().isEmpty()) {
                // Database connection details
                String dbUrl = "jdbc:mysql://localhost:3306/tourismdb";  // Database URL for tourismdb
                String dbUser = "root";  // Your MySQL username
                String dbPassword = "Root";  // Your MySQL password

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Load the MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the connection to the database
                    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Query to search for tours with the entered tour name
                    String query = "SELECT * FROM tours WHERE tournm LIKE ?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, "%" + tourName + "%");  // Use LIKE to search for tours containing the tourName

                    rs = stmt.executeQuery();  // Execute the query

                    // Display the search results
        %>
                    <h2>Search Results for "<%= tourName %>"</h2>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Tour Name</th>
                                <th>Places</th>
                                <th>Start Date</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
                    boolean hasResults = false;  // Flag to check if any results are returned
                    while (rs.next()) {
                        hasResults = true;
        %>
                        <tr>
                            <td><%= rs.getString("tournm") %></td>
                            <td><%= rs.getString("tplace1") + ", " + rs.getString("tplace2") + ", " + rs.getString("tplace3") %></td>
                            <td><%= rs.getString("startdt") %></td>
                            <td>$<%= rs.getDouble("price") %></td>
                        </tr>
        <%
                    }
                    if (!hasResults) {
        %>
                        <tr>
                            <td colspan="4">No tours found matching "<%= tourName %>".</td>
                        </tr>
        <%
                    }
        %>
                        </tbody>
                    </table>
        <%
                } catch (ClassNotFoundException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } catch (SQLException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Close the database resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
        <!-- Back to Client Menu button -->
        <a href="clientMenu.jsp" class="back-btn">Back to Client Menu</a>
    </div>
</body>
</html>
