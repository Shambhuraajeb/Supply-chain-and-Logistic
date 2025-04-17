package com.scm.Supplier;

import java.io.*;
import java.sql.*;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SupplierSignup")
public class SupplierSignup extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Step 1: Collect form data
        String supplierName = request.getParameter("supplierName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password"); // 🔒 should be hashed in production!
        String companyName = request.getParameter("companyName");
        String businessType = request.getParameter("businessType");
        String gstIn = request.getParameter("taxId");
        String address = request.getParameter("address");

        try (Connection conn = PostgresConnection.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                
                // Step 2: Insert into supplier table
                String insertSupplierSQL = "INSERT INTO supplier.supplier (supplier_name, supplier_contact, business_address, company_name, business_type, gst_in, created_at) " +
                                           "VALUES (?, ?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement supplierStmt = conn.prepareStatement(insertSupplierSQL, Statement.RETURN_GENERATED_KEYS)) {
                    supplierStmt.setString(1, supplierName);
                    supplierStmt.setString(2, phone);
                    supplierStmt.setString(3, address);
                    supplierStmt.setString(4, companyName);
                    supplierStmt.setString(5, businessType);
                    supplierStmt.setString(6, gstIn);
                    supplierStmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

                    int rowsInserted = supplierStmt.executeUpdate();

                    if (rowsInserted > 0) {
                        try (ResultSet generatedKeys = supplierStmt.getGeneratedKeys()) {
                            if (generatedKeys.next()) {
                                int supplierId = generatedKeys.getInt(1);

                                // Step 3: Insert into login table
                                String insertLoginSQL = "INSERT INTO supplier.login ( email, password, supplier_id) VALUES (?, ?, ?)";
                                
                                try (PreparedStatement loginStmt = conn.prepareStatement(insertLoginSQL)) {
                                    
                                    loginStmt.setString(1, email);
                                    loginStmt.setString(2, password); // 🔒 Hash before saving
                                    loginStmt.setInt(3, supplierId);
                                    
                                    int loginRows = loginStmt.executeUpdate();

                                    if (loginRows > 0) {
                                        response.setContentType("text/html");
                                        PrintWriter out = response.getWriter();
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('Supplier registered successfully!');");
                                        out.println("window.location.href = 'supplier/supplier_dashboard/supplier_dashboard.html';");
                                        out.println("</script>");
                                    } else {
                                        request.setAttribute("errorMessage", "Failed to save login info.");
                                        request.getRequestDispatcher("/error.jsp").forward(request, response);
                                    }
                                }
                            }
                        }
                    } else {
                        request.setAttribute("errorMessage", "Failed to register supplier.");
                        request.getRequestDispatcher("/error.jsp").forward(request, response);
                    }
                }

            } else {
                request.setAttribute("errorMessage", "Database connection error.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "SQL Error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    // Prevent direct GET access
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}
