<%@ page import="master.dao.HotelDao" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get the hotel ID from the form submission
    String hotelId = request.getParameter("hotelid");

    // Initialize DAO object
    HotelDao hotelDao = new HotelDao();

    // Call the deleteHotel method
    boolean success = hotelDao.deleteHotel(hotelId);

    // Check the result and display appropriate message
    if (success) {
        out.println("<h3>Hotel deleted successfully.</h3>");
    } else {
        out.println("<h3>Error deleting hotel. Please check the hotel ID or try again later.</h3>");
    }
%>

<!-- Link back to Admin Menu -->
<p><a href="adminMenu.jsp">Back to Admin Menu</a></p>
