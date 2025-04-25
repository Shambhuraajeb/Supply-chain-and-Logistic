<%@ page session="true" %>
<%
	int id=(int) session.getAttribute("id");
    String manufacturerName = (String) session.getAttribute("manufacturerName");
    String email = (String) session.getAttribute("email");
    String businessName = (String) session.getAttribute("businessName");

    if (id == 0) {
        request.setAttribute("errorMessage", "Session expired or user not logged in");
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
%>
<%@ page import="java.sql.*"%>
<%@ page import="com.scm.db.PostgresConnection"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Order Form</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="bg-gray-100">
	<!-- Navbar -->
	<nav class="bg-white text-black">
		<div class="container mx-auto flex items-center justify-between p-4">
			<h1 class="text-xl font-bold">Production Hub</h1>

		</div>
	</nav>

	<!-- Form Container -->
	<div class="container mx-auto p-6">
		<div class="bg-white shadow-md rounded-lg p-6">
			<h2 class="text-2xl font-bold mb-4 text-gray-800">Create New
				Order for Raw Materials</h2>
			<form action="${pageContext.request.contextPath}/createOrder" method="get">
				<!-- Supplier Details -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
					<div>
						<label class="block text-sm font-medium text-gray-700">Supplier
							Name</label> <select name="supplier_id" id="supplier_id"
							class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500">
							<option value="default">Select Name of Supplier</option>
							<%
    try (Connection conn = PostgresConnection.getConnection()) {
        String sql = "SELECT supplier_id,supplier_for_id, supplier_name FROM manufacturer.supplier where manufacturer_id="+id;
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                int sup_id = rs.getInt("supplier_id");
				int sup_for_id = rs.getInt("supplier_for_id");
                String name = rs.getString("supplier_name");
  %>
							<option value="<%= sup_for_id %>"><%= name %></option>
							<%
            }
        }
    } catch (Exception e) {
        request.setAttribute("errorMessage", e.getMessage());
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
  %>
						</select>
					</div>

				</div>

				<!-- Order Details -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
					<div>
						<label class="block text-sm font-medium text-gray-700">Order
							Date</label> <input type="date" name="order_date"
							class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500">
					
						<label class="block text-sm font-medium text-gray-700">Expected delivery
							Date</label> <input type="date" name="expected_date"
							class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500">
					</div>
					
				</div>

				<!-- Raw Materials Details -->
				<div class="mb-6">
					<label class="block text-sm font-medium text-gray-700">Raw
						Materials</label>
					<table class="min-w-full border mt-2">
						<thead class="bg-gray-200">
							<tr>
								<th class="border px-4 py-2 text-left">Material Name</th>
								<th class="border px-4 py-2 text-left">Material Code</th>
								<th class="border px-4 py-2 text-left">Quantity</th>
								<th class="border px-4 py-2 text-left">Price/Unit</th>
								<th class="border px-4 py-2 text-left">Total Cost</th>
							</tr>
						</thead>
						<tbody id="materials_body">
							
						</tbody>
					</table>
				</div>

				<!-- Payment and Delivery Details -->
				<div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
					<div>
						<label class="block text-sm font-medium text-gray-700">Payment
							Terms</label> <input type="text" name="payment_terms"
							placeholder="e.g., 50% advance, 50% on delivery"
							class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500">
					</div>
					<div>
						<label class="block text-sm font-medium text-gray-700">Delivery
							Location</label> <input type="text" name="delivery_location"
							placeholder="Enter delivery location"
							class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500">
					</div>
				</div>

				<!-- Special Instructions -->
				<div class="mb-6">
					<label class="block text-sm font-medium text-gray-700">Special
						Instructions</label>
					<textarea name="special_instructions" rows="4"
						placeholder="Enter any special instructions here"
						class="mt-1 block w-full p-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"></textarea>
				</div>

				<!-- Agreement Section -->
				<div class="mb-6">
					<label class="block text-sm font-medium text-gray-700">Agreement</label>
					<div class="mt-2 flex items-start">
						<input type="checkbox" id="agreement" name="agreement"
							class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded">
						<label for="agreement" class="ml-3 text-gray-700"> I
							confirm that the order details are accurate and agree to send
							this order to the supplier. </label>
					</div>
				</div>

				<!-- Submit Button -->
				<div class="flex justify-end">
					<button type="submit"
						class="px-6 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700">
						Create Order</button>
				</div>
			</form>
		</div>
	</div>
	 <script>
	
	 $('#supplier_id').change(function () {
	     var supplierForId = $(this).val();  

	     if (supplierForId != 'default') {
	         
	         $.ajax({
	             url: 'fetchMaterials.jsp',  
	             method: 'GET',
	             data: { supplier_for_id: supplierForId },  
	             success: function (response) {
	                 
	                 $('#materials_body').html(response);
	             },
	             error: function (error) {
	                 console.error("Error fetching materials: ", error);
	             }
	         });
	     }
	 });

    </script>
</body>

</html>