package master.servlet;

import javax.servlet.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	 // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourismdb";  
    private static final String DB_USERNAME = "root";  
    private static final String DB_PASSWORD = "Root";  

    private Connection conn = null;
    private PreparedStatement stmt = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection to the database
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            // SQL query to insert user into the database
            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            
            // Execute the query
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                // Redirect to login page after successful registration
                response.sendRedirect("login.jsp");
            } else {
                // If the registration failed, redirect back to the register page with an error
                response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database connection error.");
        } finally {
            // Close the resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}