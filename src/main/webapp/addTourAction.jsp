<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.TourismDao" %>
<%@ page import="master.dto.TourDto" %>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Add Tour - Action</title>
</head>
<body>
    <%
        String tourid = request.getParameter("tourid");
        String tournm = request.getParameter("tournm");
        String tplace1 = request.getParameter("tplace1");
        String tplace2 = request.getParameter("tplace2");
        String tplace3 = request.getParameter("tplace3");
        String startdt = request.getParameter("startdt");
        String price = request.getParameter("price");

        // Validate that all required fields are present
        if (tourid != null && tournm != null && startdt != null && price != null) {
            // Create a TourismDto object and set its properties
            TourDto tour = new TourDto();
            tour.setTourid(tourid);
            tour.setTournm(tournm);
            tour.setTplace1(tplace1);
            tour.setTplace2(tplace2);
            tour.setTplace3(tplace3);
            
            // Convert startdt (String) to LocalDate and set it
           tour.setStartdt(LocalDate.parse(startdt));  // Using parse() instead
             // This is causing the error
               // Ensure startdt is in yyyy-MM-dd format
            
            // Convert price (String) to Double and set it
            tour.setPrice(Double.parseDouble(price));

            // Create a TourismDao object to insert the data
            TourismDao dao = new TourismDao();
            boolean isInserted = dao.insertTour(tour); // Insert data into the database

            if (isInserted) {
                out.println("<h3>Tour added successfully!</h3>");
                out.println("<p><a href='adminMenu.jsp'>Go to Dashboard</a></p>");
            } else {
                out.println("<h3>Error adding tour. Please try again.</h3>");
                out.println("<p><a href='addTour.jsp'>Try Again</a></p>");
            }
        } else {
            out.println("<h3>All fields are required!</h3>");
            out.println("<p><a href='addTour.jsp'>Go Back to Add Tour</a></p>");
        }
    %>
</body>
</html>
