package master.dao;

import master.utilities.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TourHotelDao {
    public boolean linkTourToHotel(String tourId, String hotelId, String allotment) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // SQL query to insert the mapping
            String sql = "INSERT INTO TourHotelLink (tourId, hotelId, allotment) VALUES (?, ?, ?)";
            con = new ConnectionFactory().getConn();
            ps = con.prepareStatement(sql);

            // Set the parameters for tourId, hotelId, and allotment
            ps.setString(1, tourId);
            ps.setString(2, hotelId);
            ps.setString(3, allotment);  // Allotment field (could be null or empty string)

            // Execute the query
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Return true if data inserted successfully
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}