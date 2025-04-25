package com.scm.Manufacturer;

import com.scm.db.PostgresConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/createOrder")
public class CreateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String supplierIdStr = request.getParameter("supplier_id");
        int supplierId = (supplierIdStr != null && !supplierIdStr.equals("default")) ? Integer.parseInt(supplierIdStr) : 0;

        String orderDateStr = request.getParameter("order_date");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate orderDate = LocalDate.parse(orderDateStr, formatter);
        Timestamp timestamp = Timestamp.valueOf(orderDate.atStartOfDay());
        
        String expDateStr = request.getParameter("expected_date");
        LocalDate expDate = LocalDate.parse(expDateStr, formatter);
        Timestamp timestampExp = Timestamp.valueOf(expDate.atStartOfDay());
        

        String paymentTerms = request.getParameter("payment_terms");
        String deliveryLocation = request.getParameter("delivery_location");
        String specialInstructions = request.getParameter("special_instructions");
        int productId = Integer.parseInt(request.getParameter("material_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double pricePerUnit = Double.parseDouble(request.getParameter("price_per_unit"));
        double totalPrice = quantity * pricePerUnit;

        try (Connection connection = PostgresConnection.getConnection()) {
            if (connection != null && !connection.isClosed()) {

                // Insert into supplier.orders
                String orderSql = "INSERT INTO supplier.orders (supplier_id, order_date, order_status, payment_terms, delivery_location, special_instructions, expected_delivery_date) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING order_id";
                try (PreparedStatement orderStmt = connection.prepareStatement(orderSql)) {
                    orderStmt.setInt(1, supplierId);
                    orderStmt.setTimestamp(2, timestamp);
                    orderStmt.setString(3, "Pending");
                    orderStmt.setString(4, paymentTerms);
                    orderStmt.setString(5, deliveryLocation);
                    orderStmt.setString(6, specialInstructions);
                    orderStmt.setTimestamp(7, timestampExp);

                    try (ResultSet rs = orderStmt.executeQuery()) {
                        if (rs.next()) {
                            int orderId = rs.getInt("order_id");

                            // Insert into supplier.order_item
                            String itemSql = "INSERT INTO supplier.order_item (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                            try (PreparedStatement itemStmt = connection.prepareStatement(itemSql)) {
                                itemStmt.setInt(1, orderId);
                                itemStmt.setInt(2, productId);
                                itemStmt.setInt(3, quantity);
                                itemStmt.setDouble(4, pricePerUnit);
                                itemStmt.executeUpdate();
                            }

                            // Insert into manufacturer."order"
                            String manufacturerSql = "INSERT INTO manufacturer.\"order\" " +
                                    "(order_id, supplier_id, order_date, order_status, payment_terms, delivery_location, special_instructions, product_id, quantity, price, expected_delivery_date) " +
                                    "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                            try (PreparedStatement manuStmt = connection.prepareStatement(manufacturerSql)) {
                                manuStmt.setInt(1, orderId);
                                manuStmt.setInt(2, supplierId);
                                manuStmt.setTimestamp(3, timestamp);
                                manuStmt.setString(4, "Pending");
                                manuStmt.setString(5, paymentTerms);
                                manuStmt.setString(6, deliveryLocation);
                                manuStmt.setString(7, specialInstructions);
                                manuStmt.setInt(8, productId);
                                manuStmt.setInt(9, quantity);
                                manuStmt.setDouble(10, pricePerUnit);
                                manuStmt.setTimestamp(11, timestampExp);
                                manuStmt.executeUpdate();
                            }
                        }
                    }
                }

                response.sendRedirect(request.getContextPath() + "/manufacturer/Dashboard.jsp");

            } else {
                request.setAttribute("errorMessage", "Database connection failed. Please try again later.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
