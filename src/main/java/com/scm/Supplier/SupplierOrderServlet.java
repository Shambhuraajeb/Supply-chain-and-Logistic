package com.scm.Supplier;

import java.io.*;
import java.sql.*;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SupplierOrderServlet")
public class SupplierOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try (Connection connection = PostgresConnection.getConnection()) {

            if (connection != null && !connection.isClosed()) {
                // Query orders for supplier dashboard
                String query = "SELECT order_id, status, order_date, order_amount FROM supplier.orders ";
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Build JSON response
                StringBuilder json = new StringBuilder();
                json.append("[");
                while (rs.next()) {
                    json.append("{");
                    json.append("\"order_id\":\"").append(rs.getString("order_id")).append("\",");
                    json.append("\"order_date\":\"").append(rs.getDate("order_date")).append("\",");
                    json.append("\"status\":\"").append(rs.getString("status")).append("\",");
                    json.append("\"order_amount\":\"").append(rs.getString("order_amount")).append("\"");
                    json.append("},");
                }

                if (json.length() > 1) json.setLength(json.length() - 1); // Remove trailing comma
                json.append("]");

                out.print(json.toString());
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Database connection failed\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    // Block GET method
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported. Use POST.");
    }
}
