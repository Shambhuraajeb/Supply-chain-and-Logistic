package com.scm.Manufacturer;
import com.scm.db.PostgresConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = PostgresConnection.getConnection()) {
            String loginQuery = "SELECT login_id FROM manufacturer.login WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(loginQuery);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int loginId = rs.getInt("login_id");
                
                String manuQuery = "SELECT * FROM manufacturer.manufacturers WHERE login_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(manuQuery);
                ps2.setInt(1, loginId);
                ResultSet rs2 = ps2.executeQuery();

                if (rs2.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id", rs2.getInt("manufacturer_id"));
                    session.setAttribute("manufacturerName", rs2.getString("manufacturer_name"));
                    session.setAttribute("email", rs2.getString("email"));
                    session.setAttribute("businessName", rs2.getString("business_name"));

                    response.sendRedirect(request.getContextPath() + "/manufacturer/Dashboard.jsp");
                } else {
                	request.setAttribute("errorMessage", "Manufacturer details not found.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Invalid login credentials.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        }
    }
}
