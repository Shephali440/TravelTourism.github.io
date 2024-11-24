<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Menu</title>
    <!-- Link to the external CSS file for navigation and styling -->
    <link rel="stylesheet" href="adminMenu.css">
</head>
<body>
    <!-- Main Container -->
    <div class="container">
        
        <!-- Left Navigation Container -->
        <div class="nav-container">
            <h2>Admin Menu</h2>
            <ul>
                <li><a href="addTour.jsp" class="<%= request.getRequestURI().endsWith("addTour.jsp") ? "active" : "" %>">Add Tour</a></li>
                <li><a href="deleteTour.jsp" class="<%= request.getRequestURI().endsWith("deleteTour.jsp") ? "active" : "" %>">Delete Tour</a></li>
                <li><a href="updateTour.jsp" class="<%= request.getRequestURI().endsWith("updateTour.jsp") ? "active" : "" %>">Update Tour</a></li>
                <li><a href="addHotel.jsp" class="<%= request.getRequestURI().endsWith("addHotel.jsp") ? "active" : "" %>">Add Hotel</a></li>
                <li><a href="updateHotel.jsp" class="<%= request.getRequestURI().endsWith("updateHotel.jsp") ? "active" : "" %>">Update Hotel</a></li>
                <li><a href="deleteHotel.jsp" class="<%= request.getRequestURI().endsWith("deleteHotel.jsp") ? "active" : "" %>">Delete Hotel</a></li>
                <li><a href="linkTourHotel.jsp" class="<%= request.getRequestURI().endsWith("linkTourHotel.jsp") ? "active" : "" %>">Link Tour Hotel</a></li>
            </ul>
            <a href="firstpage.jsp" class="back-btn">Back to Home</a>
        </div>
        
        <!-- Right Container (Main Content) -->
        <div class="right-container">
            <h1>Welcome to Admin Dashboard</h1>
            <p>Select an option from the menu to manage tours and hotels.</p>
        </div>
        
        
    </div>
</body>
</html>
