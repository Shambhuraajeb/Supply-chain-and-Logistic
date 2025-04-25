<%@ page import="java.sql.*" %>
<%@ page import="com.scm.db.PostgresConnection" %>
<%@ page session="true" %>
<%
    int manufacturerId = (int) session.getAttribute("id");
    if (manufacturerId == 0) {
        request.setAttribute("errorMessage", "Session expired or user not logged in");
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Suppliers & Raw Materials</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <nav class="bg-blue-600 p-4 text-white shadow-md">
        <div class="max-w-6xl mx-auto flex justify-between items-center">
            <h1 class="text-xl font-bold">Suppliers Portal</h1>
        </div>
    </nav>

    <div class="max-w-6xl mx-auto p-6">
        <h1 class="text-2xl font-bold text-gray-800 mb-6">Suppliers & Raw Materials</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <%
            try (Connection conn = PostgresConnection.getConnection()) {
                String supplierQuery = "SELECT * FROM supplier.supplier";
                PreparedStatement ps = conn.prepareStatement(supplierQuery);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int supplierId = rs.getInt("supplier_id");
                    String supplierName = rs.getString("supplier_name");
                    String company = rs.getString("company_name");
                    String product_name=null;

                    // Check if the supplier is already added for this manufacturer
                    String checkQuery = "SELECT * FROM manufacturer.supplier WHERE supplier_for_id = ? AND manufacturer_id = ?";
                    PreparedStatement checkPs = conn.prepareStatement(checkQuery);
                    checkPs.setInt(1, supplierId);
                    checkPs.setInt(2, manufacturerId);
                    ResultSet checkRs = checkPs.executeQuery();

                    if (!checkRs.next()) {
                        // Not yet added -> show the card
                        String stockQuery = "SELECT * FROM supplier.stock WHERE supplier_id = ?";
                        PreparedStatement stockPs = conn.prepareStatement(stockQuery);
                        stockPs.setInt(1, supplierId);
                        ResultSet stockRs = stockPs.executeQuery();
        %>
            <div class="bg-white p-6 rounded-lg shadow-md border">
                <h2 class="text-lg font-semibold mb-2"><%= supplierName %></h2>
                <p class="text-gray-600 mb-2"><strong>Company:</strong> <%= company %></p>
                <h3 class="font-medium mb-2">Raw Materials:</h3>
                <ul class="list-disc list-inside text-gray-700">
                    <% while (stockRs.next()) { 
                    product_name=stockRs.getString("product_name");%>
                        <li><%= product_name %></li>
                    
                <form method="post" action="${pageContext.request.contextPath}/AddSupplier">
                
                    <input type="text" name="supplier_id" value="<%= supplierId %>">
                    <input type="text" name="supplier_name" value="<%= supplierName %>">
                    <input type="text" name="product_name" value="<%= product_name %>">
                    <input type="text" name="manufacturer_id" value="<%= manufacturerId %>">
                    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 transition">Add</button>
                </form>
                <% } %>
                </ul>
            </div>
        <%
                        stockRs.close();
                        stockPs.close();
                    }

                    checkRs.close();
                    checkPs.close();
                }

                rs.close();
                ps.close();
            } catch (Exception e) {
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        %>
        </div>
    </div>
</body>
</html>
