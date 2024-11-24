<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.TourismDao" %>
<%@ page import="master.dto.TourDto" %>
<%@ page import="java.time.LocalDate" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Update Tour - Action</title>
</head>
<body>
    <%
        String tourid = request.getParameter("tourid");
        String startdt = request.getParameter("startdt");
        String price = request.getParameter("price");

        if (tourid != null && startdt != null && price != null) {
            TourDto tour = new TourDto();
            tour.setTourid(tourid);
            tour.setStartdt(LocalDate.parse(startdt));
            tour.setPrice(Double.parseDouble(price));

            TourismDao dao = new TourismDao();
            boolean isUpdated = dao.updateTour(tour);

            if (isUpdated) {
                out.println("<h3>Tour updated successfully!</h3>");
            } else {
                out.println("<h3>Error updating tour. Please try again.</h3>");
            }
        } else {
            out.println("<h3>All fields are required!</h3>");
        }
    %>
    <p><a href="adminMenu.jsp">Back to Admin Menu</a></p>
</body>
</html>
