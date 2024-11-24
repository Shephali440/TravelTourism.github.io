<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.TourismDao" %>
<%@ page import="master.dto.TourDto" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Tour - Action</title>
</head>
<body>
    <%
        String tourid = request.getParameter("tourid");

        if (tourid != null && !tourid.trim().isEmpty()) {
            // Create a TourDto object and set the tourid
            TourDto tour = new TourDto();
            tour.setTourid(tourid);

            // Call the DAO to delete the tour
            TourismDao dao = new TourismDao();
            boolean isDeleted = dao.deleteTour(tour);

            if (isDeleted) {
                out.println("<h3>Tour with ID " + tourid + " deleted successfully!</h3>");
            } else {
                out.println("<h3>Failed to delete tour. The Tour ID may not exist.</h3>");
            }
        } else {
            out.println("<h3>Tour ID is required for deletion!</h3>");
        }
    %>
    <p><a href="deleteTour.jsp">Go Back</a></p>
    <p><a href="adminMenu.jsp">Return to Admin Menu</a></p>
</body>
</html>
