<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Menu</title>
    <!-- Link to the external CSS file for navigation and styling -->
    <link rel="stylesheet" href="clientMenu.css">
</head>
<body>

    <!-- Main Container -->
    <div class="container">
        
        <!-- Left Navigation Container -->
        <div class="nav-container">
            <h2>Client Menu</h2>
            <ul>
                <li><a href="searchTour.jsp" class="<%= request.getRequestURI().endsWith("searchTour.jsp") ? "active" : "" %>">Search Tour</a></li>
                <li><a href="booking.jsp" class="<%= request.getRequestURI().endsWith("booking.jsp") ? "active" : "" %>">Booking</a></li>
                <li><a href="bookingDetails.jsp" class="<%= request.getRequestURI().endsWith("bookingDetails.jsp") ? "active" : "" %>">Booking Details</a></li>
            </ul>
            
            <a href="firstpage.jsp" class="back-btn">Back to Home</a>
        </div>
        
        <!-- Right Container (Main Content) -->
        <div class="right-container">
            <h1>Welcome to Client Dashboard</h1>
            <p>Select an option from the menu to search tours, make bookings, or view booking details.</p>
        </div>
    </div>

</body>
</html>
