<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <link rel="stylesheet" href="bookingDetails.css"> <!-- Link to your CSS file -->
</head>
<body>
    <div class="container">
        <h1>Search Booking Details</h1>
        <!-- Form to search for booking by bookid -->
        <form action="bookingDetails.jsp" method="get">
            <label for="bookid">Enter Booking ID:</label>
            <input type="text" id="bookid" name="bookid" placeholder="Enter Booking ID" required>
            <button type="submit">Search</button>
        </form>

        <%
            // Get the bookid parameter from the form
            String bookId = request.getParameter("bookid");

            if (bookId != null && !bookId.trim().isEmpty()) {
                // Database connection details
                String dbUrl = "jdbc:mysql://localhost:3306/tourismdb";  // Your database URL
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

                    // Query to retrieve booking details and hotel names
                    String query = "SELECT b.bookingid, b.tourid, b.hotelid1, b.hotelid2, b.hotelid3, b.roomtype, b.bookdt, b.username, " +
                                   "h1.hotelname AS hotel1_name, h2.hotelname AS hotel2_name, h3.hotelname AS hotel3_name " +
                                   "FROM bookings b " +
                                   "LEFT JOIN hotels h1 ON b.hotelid1 = h1.hotelid " +
                                   "LEFT JOIN hotels h2 ON b.hotelid2 = h2.hotelid " +
                                   "LEFT JOIN hotels h3 ON b.hotelid3 = h3.hotelid " +
                                   "WHERE b.bookingid = ?";

                    // Prepare the statement and set the parameter
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, bookId);

                    // Execute the query
                    rs = stmt.executeQuery();

                    // Display booking details if found
                    if (rs.next()) {
        %>
                        <h2>Booking Details for Booking ID "<%= bookId %>"</h2>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Tour ID</th>
                                    <th>Hotel 1</th>
                                    <th>Hotel 2</th>
                                    <th>Hotel 3</th>
                                    <th>Room Type</th>
                                    <th>Booking Date</th>
                                    <th>Username</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%= rs.getInt("bookingid") %></td>
                                    <td><%= rs.getString("tourid") %></td>
                                    <td><%= rs.getString("hotel1_name") != null ? rs.getString("hotel1_name") : "N/A" %></td>
                                    <td><%= rs.getString("hotel2_name") != null ? rs.getString("hotel2_name") : "N/A" %></td>
                                    <td><%= rs.getString("hotel3_name") != null ? rs.getString("hotel3_name") : "N/A" %></td>
                                    <td><%= rs.getString("roomtype") %></td>
                                    <td><%= rs.getDate("bookdt") %></td>
                                    <td><%= rs.getString("username") %></td>
                                </tr>
                            </tbody>
                        </table>
        <%
                    } else {
        %>
                        <p>No booking details found for the entered Booking ID.</p>
        <%
                    }
                } catch (ClassNotFoundException e) {
                    out.println("<p>Error loading database driver: " + e.getMessage() + "</p>");
                } catch (SQLException e) {
                    out.println("<p>Error executing query: " + e.getMessage() + "</p>");
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