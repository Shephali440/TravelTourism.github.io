<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.HotelDao" %>
<%@ page import="master.dto.HotelDto" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Update Hotel - Action</title>
</head>
<body>
    <%
        // Retrieve form parameters
        String hotelid = request.getParameter("hotelid");
        String hotelname = request.getParameter("hotelname");
        String tplace = request.getParameter("tplace");

        // Validate that all fields are filled
        if (hotelid != null && hotelname != null && tplace != null) {
            // Create HotelDto object and set its properties
            HotelDto hotel = new HotelDto();
            hotel.setHotelid(hotelid);
            hotel.setHotelname(hotelname);
            hotel.setTplace(tplace);

            // Create HotelDao object and update the hotel
            HotelDao dao = new HotelDao();
            boolean isUpdated = dao.updateHotel(hotel);

            // Check if update was successful
            if (isUpdated) {
                out.println("<h3>Hotel updated successfully!</h3>");
                out.println("<p><a href='adminMenu.jsp'>Go to Admin Menu</a></p>");
            } else {
                out.println("<h3>Error updating hotel. Please try again.</h3>");
                out.println("<p><a href='updateHotel.jsp'>Try Again</a></p>");
            }
        } else {
            out.println("<h3>All fields are required!</h3>");
            out.println("<p><a href='updateHotel.jsp'>Go Back to Update Hotel</a></p>");
        }
    %>
</body>
</html>
