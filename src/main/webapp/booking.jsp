<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Page</title>
    <style>
        /* Simple styling for the form */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input, select, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .button-container {
            text-align: center;
        }
        .success-message {
            color: green;
            font-size: 16px;
            text-align: center;
        }
        .error-message {
            color: red;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tour Booking</h1>
        
        <!-- Booking Form -->
        <form action="booking.jsp" method="post">
            <label for="tourid">Tour ID:</label>
            <input type="text" id="tourid" name="tourid" placeholder="Enter Tour ID" required>

            <label for="hotelid1">Hotel ID 1:</label>
            <input type="text" id="hotelid1" name="hotelid1" placeholder="Enter Hotel ID 1" required>

            <label for="hotelid2">Hotel ID 2:</label>
            <input type="text" id="hotelid2" name="hotelid2" placeholder="Enter Hotel ID 2">

            <label for="hotelid3">Hotel ID 3:</label>
            <input type="text" id="hotelid3" name="hotelid3" placeholder="Enter Hotel ID 3">

            <label for="roomtype">Room Type:</label>
            <select id="roomtype" name="roomtype" required>
                <option value="AC">AC</option>
                <option value="Non-AC">Non-AC</option>
            </select>

            <label for="bookdt">Booking Date:</label>
            <input type="date" id="bookdt" name="bookdt" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>

            <div class="button-container">
                <button type="submit">Book</button>
            </div>
        </form>

        <% 
            // Check if the form is submitted
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Retrieve form data
                String tourid = request.getParameter("tourid");
                String hotelid1 = request.getParameter("hotelid1");
                String hotelid2 = request.getParameter("hotelid2");
                String hotelid3 = request.getParameter("hotelid3");
                String roomtype = request.getParameter("roomtype");
                String bookdt = request.getParameter("bookdt");
                String username = request.getParameter("username");

                // Database connection details
                String dbUrl = "jdbc:mysql://localhost:3306/tourismdb";
                String dbUser = "root";  // Update with your MySQL username
                String dbPassword = "Root";  // Update with your MySQL password

                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connect to the database
                    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Insert booking into the database
                    String query = "INSERT INTO bookings (tourid, hotelid1, hotelid2, hotelid3, roomtype, bookdt, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                    stmt.setString(1, tourid);
                    stmt.setString(2, hotelid1);
                    stmt.setString(3, hotelid2);
                    stmt.setString(4, hotelid3);
                    stmt.setString(5, roomtype);
                    stmt.setString(6, bookdt);
                    stmt.setString(7, username);

                    int rowsInserted = stmt.executeUpdate();

                    if (rowsInserted > 0) {
                        // Retrieve the generated bookingid
                        ResultSet generatedKeys = stmt.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int bookingId = generatedKeys.getInt(1);  // Get the generated bookingid
                            out.println("<p class='success-message'>Booking successful! Your Booking ID is: " + bookingId + "</p>");
                        }
                    } else {
                        out.println("<p class='error-message'>Booking failed. Please try again.</p>");
                    }
                } catch (ClassNotFoundException e) {
                    out.println("<p class='error-message'>Error loading database driver: " + e.getMessage() + "</p>");
                } catch (SQLException e) {
                    out.println("<p class='error-message'>Error executing query: " + e.getMessage() + "</p>");
                } finally {
                    // Close resources
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p class='error-message'>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>

        <div>
            <a href="clientMenu.jsp">Back to Client Menu</a>
        </div>
    </div>
</body>
</html>