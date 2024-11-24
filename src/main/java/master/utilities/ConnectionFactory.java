package master.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private Connection cn = null; 

    
    public Connection getConn() {
        try {
            // Register and load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            cn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourismdb", 
                "root", 
                "Root"  
            );
            System.out.println("Connection to tourism database established successfully!");
        } catch (ClassNotFoundException ce) {
            ce.printStackTrace(); // Logs an error if the driver class isn't found
        } catch (SQLException se) {
            se.printStackTrace(); // Logs database-related errors
        }
        return cn; // Returns the connection object
    }

    
    public static void main(String[] args) {
        ConnectionFactory connectionFactory = new ConnectionFactory();
        Connection conn = connectionFactory.getConn();
        if (conn != null) {
            System.out.println("Connection to tourism database is successful!");
        } else {
            System.out.println("Failed to connect to the tourism database.");
        }
    }
}
