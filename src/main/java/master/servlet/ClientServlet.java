package master.servlet;


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/tourismdb";  
    private static final String DB_USERNAME = "root";  
    private static final String DB_PASSWORD = "Root";  

    // JDBC variables
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user input from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // SQL query to check if user exists with the given username and password
            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = 'client'";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Execute the query
            rs = stmt.executeQuery();

            // If user exists, redirect to Client Menu page
            if (rs.next()) {
                // User is authenticated, create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);  // Store the username in session
                
                // Redirect to the client menu page
                response.sendRedirect("clientMenu.jsp");

            } else {
                // If login failed, redirect back to login page with error message
                response.sendRedirect("login.jsp?error=Invalid login credentials");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // If any exception occurs, send an error response
            response.sendRedirect("login.jsp?error=Database connection error");
        } finally {
            // Close the resources to avoid memory leaks
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}