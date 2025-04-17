package com.scm.SupplyChainLogin;

import java.io.*;
import java.sql.*;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SupplyChainLoginServlet")
@MultipartConfig
public class SupplyChainLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (Connection connection = PostgresConnection.getConnection()) {

            if (connection != null && !connection.isClosed()) {
//////////////////////////////////////////////////////////////////////////////////////////////////////
                // Retrieve form data
            	String userType = request.getParameter("userType"); // Fetch user type
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                boolean isValidUser = false;
                String tableName = ""; // Determine table name based on user type
                String path= "";
                // Determine the correct table name dynamically
                switch (userType.toLowerCase()) {
                    case "supplier":
                        tableName = "supplier.login";
                        path= "supplier/supplier_dashboard/supplier_dashboard.html";
                        break;
                    case "manufacturer":
                        tableName = "manufacturer.login";
                        break;
                    case "warehouse":
                        tableName = "warehouse.login";
                        break;
                    case "transport":
                        tableName = "transport.login";
                        path = "transport/cmp_transport/index.html";
                        break;
                    case "wholeseller":
                        tableName = "wholeseller.login";
                        break;
                    case "retailer":
                        tableName = "retailer.login";
                        break;
                    default:
                        response.sendRedirect("error.jsp");
                        return;
                }

                // Validate the user credentials in the corresponding table
               
                        String query = "SELECT * FROM " + tableName + " WHERE email = ? AND password = ?";
                        try (PreparedStatement statement = connection.prepareStatement(query)) {
                            statement.setString(1, username);
                            statement.setString(2, password);
                            try (ResultSet resultSet = statement.executeQuery()) {
                                if (resultSet.next()) {        //resultSet.getInt(1) > 0
                                    isValidUser = true;
                                }
                            }
                        
                            
                        } catch (SQLException e) {
                    e.printStackTrace(); // Log the exception for debugging
                
                        }
                        if (isValidUser) {
                            response.setContentType("text/html");
                            PrintWriter out = response.getWriter();
                            out.println("<script type='text/javascript'>");
                            out.println("alert('Login Successful');");
                            out.println("window.location.href = '"+ path +"';");
                            out.println("</script>");
                        } else {
                            response.setContentType("text/html");
                            PrintWriter out = response.getWriter();
                            out.println("<script type='text/javascript'>");
                            out.println("alert('Invalid username or password. Please try again.');");
                            out.println("window.location.href = 'All_login.jsp';");
                            out.println("</script>");
                        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
               

            } else {
                request.setAttribute("errorMessage", "Database connection failed. Please try again later.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (SQLException | ServletException | IOException e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    // Optional: To prevent GET access
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported. Use POST.");
    }
}