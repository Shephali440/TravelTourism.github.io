<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.HotelDao" %>
<%@ page import="master.dto.HotelDto" %>

<html>
<head>
    <title>Add Hotel - Action</title>
</head>
<body>
    <%
        String hotelid = request.getParameter("hotelid");
        String hotelname = request.getParameter("hotelname");
        String tplace = request.getParameter("tplace");

        if (hotelid != null && hotelname != null && tplace != null) {
            // Create HotelDto object and set properties
            HotelDto hotel = new HotelDto();
            hotel.setHotelid(hotelid);
            hotel.setHotelname(hotelname);
            hotel.setTplace(tplace);

            // Create HotelDao object to insert the hotel
            HotelDao dao = new HotelDao();
            boolean isInserted = dao.insertHotel(hotel);

            if (isInserted) {
                out.println("<h3>Hotel added successfully!</h3>");
                out.println("<p><a href='adminMenu.jsp'>Go to Dashboard</a></p>");
            } else {
                out.println("<h3>Error adding hotel. Please try again.</h3>");
                out.println("<p><a href='addHotel.jsp'>Try Again</a></p>");
            }
        } else {
            out.println("<h3>All fields are required!</h3>");
            out.println("<p><a href='addHotel.jsp'>Go Back to Add Hotel</a></p>");
        }
    %>
</body>
</html>
