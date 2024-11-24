<%@ page import="java.sql.*" %>
<%@ page import="master.dao.TourHotelDao" %>
<%@ page import="master.utilities.ConnectionFactory" %>

<%
    // Retrieve form data from the request
    String tourId = request.getParameter("tourid");
    String hotelId = request.getParameter("hotelid");

    boolean isSuccess = false;

    try {
        // Save the data into the database
        TourHotelDao dao = new TourHotelDao();
        isSuccess = dao.linkTourToHotel(tourId, hotelId, "");  // Allotment is not needed for now

        if (isSuccess) {
            out.println("<h2 style='color:green;'>Tour successfully linked to Hotel!</h2>");
        } else {
            out.println("<h2 style='color:red;'>Failed to link Tour to Hotel. Please try again.</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2 style='color:red;'>An error occurred: " + e.getMessage() + "</h2>");
    }
%>

<!-- Link back to the admin menu -->
<div style="text-align: center; margin-top: 20px;">
    <a href="adminMenu.jsp">Back to Admin Menu</a>
</div>
