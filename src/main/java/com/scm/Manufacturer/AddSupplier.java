package com.scm.Manufacturer;

import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/AddSupplier")
public class AddSupplier extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int manufacturerId = Integer.parseInt(request.getParameter("manufacturer_id"));
        int supplierForId = Integer.parseInt(request.getParameter("supplier_id")); // This comes from supplier.supplier
        String supplierName = request.getParameter("supplier_name");
        String productName = request.getParameter("product_name");
        
        System.out.println("Supplier Name: " + supplierName);


        try (Connection conn = PostgresConnection.getConnection()) {

            // Check if this supplier already exists in manufacturer.supplier
            String checkSupplierQuery = "SELECT COUNT(*) FROM manufacturer.supplier WHERE supplier_for_id = ? AND manufacturer_id = ?";
            PreparedStatement checkPs = conn.prepareStatement(checkSupplierQuery);
            checkPs.setInt(1, supplierForId);
            checkPs.setInt(2, manufacturerId);
            ResultSet checkRs = checkPs.executeQuery();
            checkRs.next();
            int count = checkRs.getInt(1);

            int supplierId = 0;

            if (count == 0) {
                // Insert into manufacturer.supplier and get generated supplier_id
                String insertSupplier = "INSERT INTO manufacturer.supplier (supplier_for_id, manufacturer_id, supplier_name) " +
                                        "VALUES (?, ?, ?) RETURNING supplier_id";
                PreparedStatement insertSupplierPs = conn.prepareStatement(insertSupplier);
                insertSupplierPs.setInt(1, supplierForId);
                insertSupplierPs.setInt(2, manufacturerId);
                insertSupplierPs.setString(3, supplierName);

                ResultSet rs = insertSupplierPs.executeQuery();
                if (rs.next()) {
                    supplierId = rs.getInt("supplier_id");
                }

                rs.close();
                insertSupplierPs.close();

                // Insert product_name into supplier_raw_material
                String insertMaterial = "INSERT INTO manufacturer.supplier_raw_material (manufacturer_id, supplier_id, product_name) " +
                                        "VALUES (?, ?, ?)";
                PreparedStatement materialPs = conn.prepareStatement(insertMaterial);
                materialPs.setInt(1, manufacturerId);
                materialPs.setInt(2, supplierId);
                materialPs.setString(3, productName);
                materialPs.executeUpdate();
                materialPs.close();
            }

            checkPs.close();
            checkRs.close();

            // Redirect back to dashboard
            response.sendRedirect(request.getContextPath() + "/manufacturer/Dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
