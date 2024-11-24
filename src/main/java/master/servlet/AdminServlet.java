package master.servlet;

import javax.servlet.*;

import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/tourismdb";  // Database URL
    private static final String DB_USERNAME = "root";  // Database username
    private static final String DB_PASSWORD = "Root";  // Database password

    // JDBC variables
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session and check if the user is logged in
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            try {
                // Connect to the database
                conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                // Query to get the user's role from the database
                String sql = "SELECT role FROM users WHERE username = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                rs = stmt.executeQuery();

                // If the user is found and is an admin
                if (rs.next() && "admin".equals(rs.getString("role"))) {
                    // User is admin, so redirect to the admin menu page
                    response.sendRedirect("adminMenu.jsp");
                } else {
                    // User is not admin, invalidate session and redirect to login page
                    session.invalidate();
                    response.sendRedirect("login.jsp?error=Access denied");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp?error=Database error");
            } finally {
                // Close database resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        } else {
            // If no session found, redirect to login page
            response.sendRedirect("login.jsp?error=Please log in first");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // In this case, POST method is not used. The servlet only handles GET requests
        response.sendRedirect("login.jsp");
    }
}