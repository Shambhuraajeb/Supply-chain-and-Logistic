<%@ page import="java.sql.*" %>
<%@ page import="com.scm.db.PostgresConnection" %>

<%
    String supplierId = request.getParameter("supplier_for_id");
    int id = Integer.parseInt(supplierId);
    StringBuilder responseHTML = new StringBuilder();

    try (Connection conn = PostgresConnection.getConnection()) {
        String sql = "SELECT stock_id, product_name, material_code, price FROM supplier.stock WHERE supplier_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {

                StringBuilder options = new StringBuilder();
                StringBuilder jsMap = new StringBuilder("const materialMap = {");

                options.append("<option value=''>Select Material</option>");

                while (rs.next()) {
                    int stock_id = rs.getInt("stock_id");
                    String name = rs.getString("product_name");
                    String code = rs.getString("material_code");
                    double price = rs.getDouble("price");

                    // Set stock_id as the value in the option
                    options.append("<option value=\"").append(stock_id).append("\">")
                           .append(name).append("</option>");

                    jsMap.append("\"").append(stock_id).append("\": {")
                         .append("\"code\": \"").append(code).append("\", ")
                         .append("\"price\": ").append(price)
                         .append("},");
                }

                // Remove trailing comma if necessary
                if (jsMap.charAt(jsMap.length() - 1) == ',') {
                    jsMap.setLength(jsMap.length() - 1);
                }

                jsMap.append("};");

                // Build HTML row
                responseHTML.append("<tr>");
                responseHTML.append("<td class='border px-4 py-2'>")
                            .append("<select name='material_id' class='material-dropdown w-full p-1 border border-gray-300 rounded-md'>")
                            .append(options)
                            .append("</select></td>");

                responseHTML.append("<td class='border px-4 py-2'><input type='text' name='material_code' class='material-code w-full p-1 border border-gray-300 rounded-md' readonly></td>");
                responseHTML.append("<td class='border px-4 py-2'><input type='number' name='quantity' class='quantity w-full p-1 border border-gray-300 rounded-md'></td>");
                responseHTML.append("<td class='border px-4 py-2'><input type='number' name='price_per_unit' class='material-price w-full p-1 border border-gray-300 rounded-md' readonly></td>");
                responseHTML.append("<td class='border px-4 py-2'><input type='number' name='total_cost' class='total-cost w-full p-1 border border-gray-300 rounded-md' readonly></td>");
                responseHTML.append("</tr>");

                // Append JS script
                responseHTML.append("<script>")
                            .append(jsMap.toString())
                            .append("$(document).ready(function() {")
                            .append("    $('body').on('change', '.material-dropdown', function() {")
                            .append("        const row = $(this).closest('tr');")
                            .append("        const selected = $(this).val();")  // Get stock_id as the value
                            .append("        const codeField = row.find('.material-code');")
                            .append("        const priceField = row.find('.material-price');")
                            .append("        const quantityField = row.find('.quantity');")
                            .append("        const totalCostField = row.find('.total-cost');")

                            .append("        if (materialMap[selected]) {")
                            .append("            codeField.val(materialMap[selected].code);")
                            .append("            priceField.val(materialMap[selected].price);")
                            .append("        } else {")
                            .append("            codeField.val('');")
                            .append("            priceField.val('');")
                            .append("        }")
                            .append("        updateTotal(row);")
                            .append("    });")

                            .append("    $('body').on('input', '.quantity', function() {")
                            .append("        const row = $(this).closest('tr');")
                            .append("        updateTotal(row);")
                            .append("    });")

                            .append("    function updateTotal(row) {")
                            .append("        const qty = parseFloat(row.find('.quantity').val());")
                            .append("        const price = parseFloat(row.find('.material-price').val());")
                            .append("        const totalCostField = row.find('.total-cost');")
                            .append("        if (!isNaN(qty) && !isNaN(price)) {")
                            .append("            totalCostField.val((qty * price).toFixed(2));")
                            .append("        } else {")
                            .append("            totalCostField.val('');")
                            .append("        }")
                            .append("    }")
                            .append("});")
                            .append("</script>");
            }
        }
    } catch (Exception e) {
        responseHTML.append("<tr><td colspan='6' class='text-red-500'>Error loading materials: ").append(e.getMessage()).append("</td></tr>");
        e.printStackTrace();
    }

    out.print(responseHTML.toString());
%>
