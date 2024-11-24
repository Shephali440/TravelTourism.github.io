package master.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*; // Importing the necessary SQL classes
import master.dao.HotelDao;
import master.dto.HotelDto;

public class HotelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Creating an instance of HotelDao to interact with the database
        HotelDao hotelDao = new HotelDao();

        // Fetch all hotels from the database
        ResultSet rs = hotelDao.getAllHotels();
        
        try {
            // Process the ResultSet
            while (rs.next()) {
                // Fetch hotel data from the result set
                String hotelid = rs.getString("hotelid");
                String hotelname = rs.getString("hotelname");
                String tplace = rs.getString("tplace");
                
                // Print the hotel information (you can also store it in a list to display in the UI)
                System.out.println("Hotel ID: " + hotelid);
                System.out.println("Hotel Name: " + hotelname);
                System.out.println("Tourist Place: " + tplace);
            }

            // Send a response to the client (You can send a view with the hotel data)
            response.getWriter().write("Hotels fetched successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error fetching hotels.");
        } finally {
            // Close the ResultSet after use
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // You can also add a doPost() method if required for handling POST requests
    // For example, to add or update a hotel
}
