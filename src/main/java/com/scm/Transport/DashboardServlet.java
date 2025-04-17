package com.scm.Transport;

import java.io.*;
import java.sql.*;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DashboardServlet")
@MultipartConfig
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try (Connection connection = PostgresConnection.getConnection()) {

            if (connection != null && !connection.isClosed()) {
//////////////////////////////////////////////////////////////////////////////////////////////////////
            	//////NEW DELIVERY REQUEST TABLE
                // Retrieve form data
            	Statement stmt = connection.createStatement();
            	 String query = "SELECT transport_id, customer_id, request_date, delivery_address, status FROM transport.delivery_request";
                 ResultSet new_del_rs = stmt.executeQuery(query);
              // Build JSON response
                 StringBuilder json = new StringBuilder();
                 json.append("[");
                 while (new_del_rs.next()) {
                     json.append("{");
                     json.append("\"transport_id\":\"").append(new_del_rs.getString("transport_id")).append("\",");
                     json.append("\"customer_id\":\"").append(new_del_rs.getString("customer_id")).append("\",");
                     json.append("\"request_date\":\"").append(new_del_rs.getDate("request_date")).append("\",");
                     json.append("\"delivery_address\":\"").append(new_del_rs.getString("delivery_address")).append("\",");
                     json.append("\"status\":\"").append(new_del_rs.getString("status")).append("\"");
                     json.append("},");
                 }
              // Remove trailing comma and close JSON array
                
                 if (json.length() > 1) json.setLength(json.length() - 1);
                 json.append("]");

                 out.print(json.toString());
                 
                 ///////////////////////////////////////////
                 ////TRANSPORT MANAGEMENT table
                 
               /*  StringBuilder trans_mgnt_json = new StringBuilder();
                 String transport_mgnt_query = "SELECT fleet_id, vehicle_type, vehicle_number, driver_name, status, route, ETA FROM transport.fleets";
                 ResultSet tran_mgnt_rs = stmt.executeQuery(transport_mgnt_query);    
                 trans_mgnt_json .append("[");
                 while (tran_mgnt_rs.next()) {
                	 trans_mgnt_json .append("{");
                	 trans_mgnt_json .append("\"fleet_id\":\"").append(tran_mgnt_rs.getString("fleet_id")).append("\",");
                	 trans_mgnt_json .append("\"vehicle_type\":\"").append(tran_mgnt_rs.getString("vehicle_type")).append("\",");
                	 trans_mgnt_json .append("\"vehicle_number\":\"").append(tran_mgnt_rs.getDate("vehicle_number")).append("\",");
                	 trans_mgnt_json .append("\"route\":\"").append(tran_mgnt_rs.getString("route")).append("\",");
                	 trans_mgnt_json .append("\"status\":\"").append(tran_mgnt_rs.getString("status")).append("\"");
                	 trans_mgnt_json .append("\"driver_name\":\"").append(tran_mgnt_rs.getString("driver_name")).append("\"");
                	 trans_mgnt_json .append("\"ETA\":\"").append(tran_mgnt_rs.getString("ETA")).append("\"");
                	 trans_mgnt_json .append("},");
                 }
              // Remove trailing comma and close JSON array
                 if (trans_mgnt_json .length() > 1) trans_mgnt_json .setLength(trans_mgnt_json .length() - 1);
                 json.append("]");

                 out.print(trans_mgnt_json .toString());
         	*/
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