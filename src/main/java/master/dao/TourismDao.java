package master.dao;
import java.sql.*;
import master.dto.TourDto;
import master.utilities.ConnectionFactory;


public class TourismDao {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private Statement st = null;
    private ResultSet rs = null;

    // SQL Queries
    private String insert_sql = "INSERT INTO tours (tourid, tournm, tplace1, tplace2, tplace3, startdt, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private String select_sql = "SELECT * FROM tours";
    private String update_sql = "UPDATE tours SET tournm = ?, tplace1 = ?, tplace2 = ?, tplace3 = ?, startdt = ?, price = ? WHERE tourid = ?";
    private String delete_sql = "DELETE FROM tours WHERE tourid = ?";
    private String search_sql = "SELECT * FROM tours WHERE tourid = ?";

    // Method to Insert a Tour
    public boolean insertTour(TourDto tour) {
        boolean isSuccess = false;  // This will indicate whether the insertion was successful or not
        try {
            // Step 1: Get connection to the database
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();
            
            // Step 2: Prepare the SQL query for insertion
            String insertSql = "INSERT INTO tours (tourid, tournm, tplace1, tplace2, tplace3, startdt, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(insertSql);

            // Step 3: Set the values in the prepared statement
            ps.setString(1, tour.getTourid());
            ps.setString(2, tour.getTournm());
            ps.setString(3, tour.getTplace1());
            ps.setString(4, tour.getTplace2());
            ps.setString(5, tour.getTplace3());
            ps.setDate(6, java.sql.Date.valueOf(tour.getStartdt())); // Convert LocalDate to SQL Date
            ps.setDouble(7, tour.getPrice());

            // Step 4: Execute the query and check how many rows were affected
            int rowsAffected = ps.executeUpdate();

            // Step 5: If rows were affected, the insert was successful
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;  // Return true if the insertion was successful, false otherwise
    }


    // Method to Fetch All Tours
    public ResultSet getAllTours() {
        try {
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();
            st = cn.createStatement();
            rs = st.executeQuery(select_sql);
        } catch (SQLException se) {
            se.printStackTrace();
        }
        return rs;
    }

    // Method to Update a Tour
    public boolean updateTour(TourDto tour) {
        Connection cn = null;
        PreparedStatement ps = null;
        String update_sql = "UPDATE tours SET startdt = ?, price = ? WHERE tourid = ?";
        
        try {
            // Get the connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();

            // Prepare the SQL statement
            ps = cn.prepareStatement(update_sql);
            ps.setDate(1, java.sql.Date.valueOf(tour.getStartdt())); // Set start date
            ps.setDouble(2, tour.getPrice()); // Set price
            ps.setString(3, tour.getTourid()); // Set tourid
            
            int rowsAffected = ps.executeUpdate(); // Execute the update query

            return rowsAffected > 0; // Return true if rows were updated
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


    public boolean deleteTour(TourDto tour) {
        Connection cn = null;
        PreparedStatement ps = null;
        String delete_sql = "DELETE FROM tours WHERE tourid = ?";
        
        try {
            // Get the database connection
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();  // Using the ConnectionFactory to get the connection

            // Create a PreparedStatement for the delete query
            ps = cn.prepareStatement(delete_sql);
            ps.setString(1, tour.getTourid());  
            
            
            int rowsAffected = ps.executeUpdate();
            
            // Return true if rows are affected (meaning the deletion was successful)
            return rowsAffected > 0;
        } catch (SQLException e) {
            // Print any exceptions that occur
            e.printStackTrace();
            return false;  // Return false if there is an error
        } finally {
            // Clean up resources (close connections)
            try {
                if (ps != null) ps.close();  // Close PreparedStatement
                if (cn != null) cn.close();  // Close the database connection
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
        

    // Method to Search for a Specific Tour
    public TourDto getTourById(String tourid) {
        TourDto tdto = null;
        try {
            ConnectionFactory conFactory = new ConnectionFactory();
            cn = conFactory.getConn();
            ps = cn.prepareStatement(search_sql);

            ps.setString(1, tourid);
            rs = ps.executeQuery();

            if (rs.next()) {
                tdto = new TourDto();
                tdto.setTourid(rs.getString("tourid"));
                tdto.setTournm(rs.getString("tournm"));
                tdto.setTplace1(rs.getString("tplace1"));
                tdto.setTplace2(rs.getString("tplace2"));
                tdto.setTplace3(rs.getString("tplace3"));
                tdto.setStartdt(rs.getDate("startdt").toLocalDate()); // Convert SQL Date to LocalDate
                tdto.setPrice(rs.getDouble("price"));
            }
        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            closeResources();
        }
        return tdto;
    }

    // Method to Close Database Resources
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (st != null) st.close();
            if (cn != null) cn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
    
   
}

