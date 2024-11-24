package master.servlet;

import java.io.*;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;




import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/tourismdb";  
	    private static final String DB_USERNAME = "root";  
	    private static final String DB_PASSWORD = "Root";  

	    private Connection conn = null;
	    private PreparedStatement stmt = null;
	    private ResultSet rs = null;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String menu = request.getParameter("menu");

	        try {
	            // Load MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish connection to the database
	            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

	            // Prepare SQL query to check if the user exists
	            String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username);
	            stmt.setString(2, password);
	            stmt.setString(3, menu);

	            // Execute query
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                // Redirect to corresponding menu page based on role
	                if ("client".equals(menu)) {
	                    response.sendRedirect("clientMenu.jsp");
	                } else if ("admin".equals(menu)) {
	                    response.sendRedirect("adminMenu.jsp");
	                }
	            } else {
	                // If invalid credentials, redirect back to login with error
	                response.sendRedirect("login.jsp?error=Invalid credentials. Please try again.");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("login.jsp?error=Database error.");
	        } finally {
	            // Close resources
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