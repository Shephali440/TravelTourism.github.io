package master.dao;

import java.sql.*;
import master.dto.HotelDto;
import master.utilities.ConnectionFactory;



public class HotelDao {

    // Method to insert a new hotel into the database
    public boolean insertHotel(HotelDto hotel) {
        Connection cn = null;
        PreparedStatement ps = null;
        String insert_sql = "INSERT INTO hotels (hotelid, hotelname, tplace) VALUES (?, ?, ?)";
        
        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Create a PreparedStatement
            ps = cn.prepareStatement(insert_sql);
            ps.setString(1, hotel.getHotelid());  // Set hotelid
            ps.setString(2, hotel.getHotelname());  // Set hotelname
            ps.setString(3, hotel.getTplace());  // Set tplace

            int rowsAffected = ps.executeUpdate();  // Execute the insert query
            
            return rowsAffected > 0;  // Return true if rows are affected
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Clean up resources
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to update an existing hotel in the database
    public boolean updateHotel(HotelDto hotel) {
        Connection cn = null;
        PreparedStatement ps = null;
        String update_sql = "UPDATE hotels SET hotelname = ?, tplace = ? WHERE hotelid = ?";

        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Create a PreparedStatement to execute the update query
            ps = cn.prepareStatement(update_sql);
            ps.setString(1, hotel.getHotelname());
            ps.setString(2, hotel.getTplace());
            ps.setString(3, hotel.getHotelid());

            int rowsAffected = ps.executeUpdate(); // Execute the update query

            return rowsAffected > 0; // Return true if update is successful (rows affected)
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Clean up resources
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to delete a hotel from the database by hotelid
    public boolean deleteHotel(String hotelid) {
        Connection cn = null;
        PreparedStatement ps = null;
        String delete_sql = "DELETE FROM hotels WHERE hotelid = ?";
        
        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Create a PreparedStatement
            ps = cn.prepareStatement(delete_sql);
            ps.setString(1, hotelid);  // Set hotelid parameter for deletion

            int rowsAffected = ps.executeUpdate();  // Execute the delete query
            
            return rowsAffected > 0;  // Return true if rows are affected (meaning the hotel was deleted)
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Clean up resources
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to get hotel details by hotelid (optional, for display or edit)
    public HotelDto getHotelById(String hotelid) {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String select_sql = "SELECT * FROM hotels WHERE hotelid = ?";
        HotelDto hotel = null;
        
        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Create a PreparedStatement
            ps = cn.prepareStatement(select_sql);
            ps.setString(1, hotelid);  // Set hotelid parameter for the query

            // Execute the query and get the result
            rs = ps.executeQuery();
            if (rs.next()) {
                // Create a HotelDto object and set its fields
                hotel = new HotelDto();
                hotel.setHotelid(rs.getString("hotelid"));
                hotel.setHotelname(rs.getString("hotelname"));
                hotel.setTplace(rs.getString("tplace"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return hotel;  // Return the HotelDto object
    }

    // Method to delete a hotel by hotelId (using a different name for clarity)
    public boolean deleteHotelById(String hotelId) {
        Connection con = null;
        PreparedStatement ps = null;
        boolean success = false;

        try {
            // Establish connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourismdb", "root", "Root");
            
            // SQL query to delete the hotel by hotel ID
            String sql = "DELETE FROM hotels WHERE hotelid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, hotelId);
            
            // Execute the delete query
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close connections
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    // Method to get all hotels from the database
    public ResultSet getAllHotels() {
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String select_sql = "SELECT * FROM hotels";  // SQL query to fetch all hotels
        
        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Create a Statement to execute the SQL query
            st = cn.createStatement();

            // Execute the query and store the result in ResultSet
            rs = st.executeQuery(select_sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Clean up resources
            try {
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return rs;  // Return the ResultSet containing all hotels
    }
}
