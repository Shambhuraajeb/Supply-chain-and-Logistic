package com.scm.Transport;

import java.io.*;
import java.sql.*;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@WebServlet("/CMP_signup")
@MultipartConfig  // <-- This enables file upload handling!
public class CMP_signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
 {

        try (Connection connection = PostgresConnection.getConnection()) {

            if (connection != null && !connection.isClosed()) {
                String companyName = "abc";
                String contactEmail = "abc";
                String website = "abc";
                String address = "abc";
                String password = "abc";
                InputStream companyLogo = null;

                Part filePart = request.getPart("companylogo");
                if (filePart != null) {
                    companyLogo = filePart.getInputStream();
                }

                String transportInsertQuery = "INSERT INTO transport.transport (transport_name, transport_contact, transport_website, logo, address, created_at) VALUES (?, ?, ?, ?, ?, ?)";
                int rowsInsertedTransport = 0;

                try (PreparedStatement transportStmt = connection.prepareStatement(transportInsertQuery)) {
                    transportStmt.setString(1, companyName);
                    transportStmt.setString(2, contactEmail);
                    transportStmt.setString(3, website);
                    if (companyLogo != null) {
                        transportStmt.setBlob(4, companyLogo);
                    } else {
                        transportStmt.setNull(4, java.sql.Types.BLOB);
                    }
                    transportStmt.setString(5, address);
                    transportStmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
                    rowsInsertedTransport = transportStmt.executeUpdate();
                }

                String loginInsertQuery = "INSERT INTO transport.login (transport_email, password) VALUES (?, ?)";
                int rowsInsertedLogin = 0;

                try (PreparedStatement loginStmt = connection.prepareStatement(loginInsertQuery)) {
                    loginStmt.setString(1, contactEmail);
                    loginStmt.setString(2, password);
                    rowsInsertedLogin = loginStmt.executeUpdate();
                }

                if (rowsInsertedTransport > 0 && rowsInsertedLogin > 0) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Data inserted successfully into both tables.');");
                    out.println("window.location.href = 'transport/cmp_transport/index.html';");
                    out.println("</script>");
                } else {
                    request.setAttribute("errorMessage", "Failed to insert data into one or both tables.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("errorMessage", "Database connection failed. Please try again later.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

   
}
