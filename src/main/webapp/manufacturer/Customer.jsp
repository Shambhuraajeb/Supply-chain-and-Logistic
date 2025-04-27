<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
Integer id = (Integer) session.getAttribute("id");
String manufacturerName = (String) session.getAttribute("manufacturerName");
String email = (String) session.getAttribute("email");
String businessName = (String) session.getAttribute("businessName");

if (id == null || manufacturerName == null || email == null || businessName == null) {
	response.sendRedirect(request.getContextPath() + "/manufacturer/login.jsp");
	return;
}
%>
<%@ page import="java.sql.*, java.util.*, com.scm.db.PostgresConnection"%>
<%@ page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="AI-generated website">
<meta name="theme-color" content="#ffffff">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="index, follow">

<!-- Performance optimization: Preload critical resources -->
<link rel="preload" href="https://cdn.tailwindcss.com" as="script">
<link rel="preload"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap"
	as="style">

<!-- {headerScripts} -->

<!-- Core CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#525252',
                        secondary: '#404040',
                        accent: '#737373',
                    },
                    fontFamily: {
                        sans: ['Inter', 'system-ui'],
                        heading: ['Montserrat', 'Inter'],
                    },
                    spacing: {
                        '18': '4.5rem',
                        '22': '5.5rem',
                        '30': '7.5rem',
                    },
                    maxWidth: {
                        '8xl': '88rem',
                        '9xl': '96rem',
                    },
                    animation: {
                        'fade-in': 'fadeIn 0.5s ease-in',
                        'fade-out': 'fadeOut 0.5s ease-out',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' },
                        },
                        fadeOut: {
                            '0%': { opacity: '1' },
                            '100%': { opacity: '0' },
                        },
                    },
                    aspectRatio: {
                        'portrait': '3/4',
                        'landscape': '4/3',
                        'ultrawide': '21/9',
                    },
                },
            },
            variants: {
                extend: {
                    opacity: ['disabled'],
                    cursor: ['disabled'],
                    backgroundColor: ['active', 'disabled'],
                    textColor: ['active', 'disabled'],
                },
            },
        }
    </script>

<!-- Utilities and Components -->
<script defer
	src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.3/cdn.min.js"></script>
<script defer
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.45.1/apexcharts.min.js"></script>

<!-- Optimized Font Loading -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Base Styles -->
<style>
* {
	-ms-overflow-style: none;
	/* IE and Edge */
	scrollbar-width: none;
	/* Firefox */
}

*::-webkit-scrollbar {
	display: none;
}

* {
	-webkit-tap-highlight-color: transparent;
}

body {
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

:focus-visible {
	outline: 2px solid currentColor;
	outline-offset: 2px;
}

@media print {
	.no-print {
		display: none !important;
	}
	a[href]:after {
		content: " (" attr(href) ")";
	}
}
</style>

<!-- Enhanced Image Handler -->
<script>
        document.addEventListener('DOMContentLoaded', () => {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        if (img.dataset.src) {
                            const tempImage = new Image();
                            tempImage.onload = () => {
                                img.src = img.dataset.src;
                                img.classList.remove('opacity-0');
                                img.classList.add('opacity-100');
                            };
                            tempImage.src = img.dataset.src;
                            img.removeAttribute('data-src');
                            observer.unobserve(img);
                        }
                    }
                });
            }, {
                rootMargin: '50px 0px',
                threshold: 0.01
            });

            const loadImage = (img) => {
                if ('loading' in HTMLImageElement.prototype) {
                    img.loading = 'lazy';
                }

                img.classList.add('transition-opacity', 'duration-300', 'opacity-0');

                img.onerror = () => {
                    const width = img.getAttribute('width') || img.clientWidth || 300;
                    const height = img.getAttribute('height') || img.clientHeight || 200;
                    img.src = `https://placehold.co/${width}x${height}/DEDEDE/555555?text=Image+Unavailable`;
                    img.alt = 'Image unavailable';
                    img.classList.remove('opacity-0');
                    img.classList.add('opacity-100', 'error-image');
                };

                if (img.dataset.src) {
                    imageObserver.observe(img);
                } else {
                    img.classList.remove('opacity-0');
                    img.classList.add('opacity-100');
                }
            };

            document.querySelectorAll('img[data-src], img:not([data-src])').forEach(loadImage);

            new MutationObserver((mutations) => {
                mutations.forEach(mutation => {
                    mutation.addedNodes.forEach(node => {
                        if (node.nodeType === 1) {
                            if (node.tagName === 'IMG') {
                                loadImage(node);
                            }
                            node.querySelectorAll('img').forEach(loadImage);
                        }
                    });
                });
            }).observe(document.body, {
                childList: true,
                subtree: true
            });
        });

        if ('performance' in window && 'PerformanceObserver' in window) {
            const observer = new PerformanceObserver((list) => {
                const entries = list.getEntries();
                entries.forEach((entry) => {
                    if (entry.entryType === 'largest-contentful-paint') {
                        // console.log(`LCP: ${entry.startTime}ms`);
                    }
                    if (entry.entryType === 'first-input') {
                        // console.log(`FID: ${entry.processingStart - entry.startTime}ms`);
                    }
                    if (entry.entryType === 'layout-shift') {
                        // console.log(`CLS: ${entry.value}`);
                    }
                });
            });

            observer.observe({ entryTypes: ['largest-contentful-paint', 'first-input', 'layout-shift'] });

            window.addEventListener('load', () => {
                const timing = performance.getEntriesByType('navigation')[0];
                console.log({
                    'DNS Lookup': timing.domainLookupEnd - timing.domainLookupStart,
                    'TCP Connection': timing.connectEnd - timing.connectStart,
                    'DOM Content Loaded': timing.domContentLoadedEventEnd - timing.navigationStart,
                    'Page Load': timing.loadEventEnd - timing.navigationStart
                });
            });
        }

        window.addEventListener('online', () => {
            document.body.classList.remove('offline');
            console.log('Connection restored');
        });

        window.addEventListener('offline', () => {
            document.body.classList.add('offline');
            console.log('Connection lost');
        });
    </script>
</head>
<body>
<div class="flex" id="root">
		<div x-data="{ isOpen: false }">
			<nav
				class="fixed h-screen w-64 bg-white border-r border-gray-200 hidden lg:block">
				<div class="p-4 border-b border-gray-200">
					<div class="text-xl font-bold text-gray-800">Production Hub</div>
				</div>

				<div class="py-4">

					<a href="RawMaterial.jsp"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                                </svg> Materials
					</a> <a href="Inventory.jsp"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z">
                                    </path>
                                </svg> Inventory
					</a> <a href="Customer.jsp"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4">
                                    </path>
                                </svg> Customers
					</a> <a href="Payment.jsp"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4">
                                    </path>
                                </svg> Payments
					</a> 
				</div>

				<div class="absolute bottom-0 w-full border-t border-gray-200">
					<div class="p-4">
						<div class="flex items-center">
							<img src="https://avatar.iran.liara.run/public" alt="User"
								class="w-8 h-8 rounded-full">
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-700"><%=manufacturerName%>
									<span style="color: red;"><a
										href="${pageContext.request.contextPath}/logout.jsp"
										class="btn btn-danger"><i>Logout</i></a></span>
								</p>
								<p class="text-xs text-gray-500"><%=businessName%></p>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>

		<main class="flex-1 ml-0 lg:ml-64 min-h-screen overflow-y-auto">
			<!-- Header -->
			<header
				class="sticky top-0 z-30 bg-white border-b border-gray-200 shadow-sm">
				<div class="px-4 sm:px-6 lg:px-8">
					<div class="flex items-center justify-between h-16">
						<div class="flex items-center flex-1">
							<div class="flex-shrink-0">
								<h1 class="text-xl font-semibold text-gray-900">Production
									Dashboard</h1>
							</div>
						</div>
						<div class="flex items-center">
							<div class="flex-shrink-0">
								<button type="button"
									class="p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
									<span class="sr-only">View notifications</span>
									<svg class="h-6 w-6" fill="none" stroke="currentColor"
										viewBox="0 0 24 24">
                                                <path
											stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9">
                                                </path>
                                            </svg>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>


	</section>
	</htmlCode>
	</element>
	<element id="774c2c2c-6b53-4613-9403-e05ea5917aef"
		data-section-id="774c2c2c-6b53-4613-9403-e05ea5917aef"> <htmlCode>
	<section id="customer-orders" class="p-6">
		<!-- Header Section -->
		<div class="mb-6">
			<h2 class="text-2xl font-bold text-gray-800">Customer Orders</h2>
			<p class="text-gray-600">Manage customer orders and forward them
				to the warehouse.</p>
		</div>

		<!-- Overview Cards -->
		<div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
			<div class="bg-white p-4 rounded-lg border border-gray-200">
				<div class="flex items-center justify-between">
					<div>
						<%
						Connection conn = null;
						PreparedStatement stmt = null;
						ResultSet rs = null;
						try {
							conn = PostgresConnection.getConnection();
							stmt = conn.prepareStatement(
							"SELECT COUNT(*) AS total_orders FROM manufacturer.customer_order where manufacturer_id=?");

							stmt.setInt(1, id);

							rs = stmt.executeQuery();

							if (rs.next()) {
						%>
						<p class="text-sm text-gray-500">Total Orders</p>
						<p class="text-2xl font-bold text-gray-800"><%=rs.getInt("total_orders")%></p>
						<%
						} else {
						%>
						<p class="text-red-600">No stock data found.</p>
						<%
						}

						} catch (Exception e) {
						out.println("<p class='text-red-600'>" + e.getMessage() + "</p>");
						e.printStackTrace();
						}
						%>
					</div>
					<div class="bg-blue-100 p-2 rounded-lg">
						<svg class="w-6 h-6 text-blue-600" fill="none"
							stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M3 10h11M9 21V3M17 16l4 4m0 0l-4 4m4-4H9" />
                            </svg>
					</div>
				</div>
			</div>

			<div class="bg-white p-4 rounded-lg border border-gray-200">
				<div class="flex items-center justify-between">
					<div>
						<%
						try {
							conn = PostgresConnection.getConnection();
							stmt = conn.prepareStatement(
							"SELECT COUNT(*) AS total_orders FROM manufacturer.customer_order where status='Pending' and manufacturer_id=?");

							stmt.setInt(1, id);

							rs = stmt.executeQuery();

							if (rs.next()) {
						%>
						<p class="text-sm text-gray-500">Pending Orders</p>
						<p class="text-2xl font-bold text-yellow-600"><%=rs.getInt("total_orders")%></p>
						<%
						} else {
						%>
						<p class="text-red-600">No stock data found.</p>
						<%
						}

						} catch (Exception e) {
						out.println("<p class='text-red-600'>" + e.getMessage() + "</p>");
						e.printStackTrace();
						}
						%>
					</div>
					<div class="bg-yellow-100 p-2 rounded-lg">
						<svg class="w-6 h-6 text-yellow-600" fill="none"
							stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
					</div>
				</div>
			</div>

			<div class="bg-white p-4 rounded-lg border border-gray-200">
				<div class="flex items-center justify-between">
					<div>
						<%
						try {
							conn = PostgresConnection.getConnection();
							stmt = conn.prepareStatement(
							"SELECT COUNT(*) AS request FROM manufacturer.new_customer_request where manufacturer_id=?");

							stmt.setInt(1, id);

							rs = stmt.executeQuery();

							if (rs.next()) {
						%>
						<p class="text-sm text-gray-500">New Requests</p>
						<p class="text-2xl font-bold text-red-600"><%=rs.getInt("request")%></p>
						<%
						} else {
						%>
						<p class="text-red-600">No stock data found.</p>
						<%
						}

						} catch (Exception e) {
						out.println("<p class='text-red-600'>" + e.getMessage() + "</p>");
						e.printStackTrace();
						}
						%>
					</div>
					<div class="bg-red-100 p-2 rounded-lg">
						<svg class="w-6 h-6 text-red-600" fill="none"
							stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
					</div>
				</div>
			</div>
		</div>

		<!-- New Customer Requests -->
		<div class="bg-white p-6 rounded-lg border border-gray-200 mb-6">
			<h3 class="text-lg font-semibold mb-4">New Customer Requests</h3>
			<div class="overflow-x-auto">
				<%@ page import="com.scm.Manufacturer.JsonHelper"%>
				<table class="min-w-full divide-y divide-gray-200">
					<thead>
						<tr>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Product</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Quantity</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total
								Price</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Action</th>
						</tr>
					</thead>
					<tbody class="divide-y divide-gray-200">
						<%
						try {
							// Prepare SQL query to fetch data from the database
							String sql = "SELECT request_id, customer_details, order_details, status FROM manufacturer.new_customer_request WHERE manufacturer_id=?";
							stmt = conn.prepareStatement(sql);
							stmt.setInt(1, id); // Assuming id is set previously
							rs = stmt.executeQuery();

							ObjectMapper objectMapper = new ObjectMapper();

							// Iterate through the result set
							while (rs.next()) {
								String customerJson = rs.getString("customer_details");
								String orderJson = rs.getString("order_details");
								String status = rs.getString("status");

								//out.println(customerJson);

								if (customerJson != null && !customerJson.isEmpty() && orderJson != null && !orderJson.isEmpty()) {
							try {

								JsonNode jsonNode = objectMapper.readTree(customerJson);
								JsonNode jsonNode1 = objectMapper.readTree(orderJson);
								
								

								String name = jsonNode.has("name") ? jsonNode.get("name").asText() : null;
								String phone = jsonNode.has("phone") ? jsonNode.get("phone").asText() : null;
								String product = jsonNode.has("age") ? jsonNode.get("age").asText() : null;
								String quantity = JsonHelper.extractJsonValue(orderJson, "\"quantity\":").trim();
								String price = JsonHelper.extractJsonValue(orderJson, "\"price\":").replace("}", "").trim();

								
								quantity = quantity.replaceAll("[^0-9]", "");
								price = price.replaceAll("[^0-9]", "");

								int quantityValue = 0;
								int priceValue = 0;
						%>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=name%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=phone%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=product%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
								<%
								out.println(quantity);
								try {
									quantityValue = Integer.parseInt(quantity);
								} catch (NumberFormatException e) {
									quantityValue = 0;
									out.println("<p class='text-red-600'>Invalid quantity value: " + quantity + "</p>");
								}
								%>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$<%
							int totalPrice = quantityValue * priceValue;
							out.println(totalPrice);
							try {
								priceValue = Integer.parseInt(price);
							} catch (NumberFormatException e) {
								priceValue = 0;
								out.println("<p class='text-red-600'>Invalid price value: " + price + "</p>");
							}
							%></td>
							<td class="px-6 py-4 whitespace-nowrap">
								<button class="px-3 py-1 bg-green-500 text-white rounded-lg">Approve</button>
								<button class="px-3 py-1 bg-red-500 text-white rounded-lg">Reject</button>
							</td>
						</tr>
						<%
						} catch (Exception e) {
						out.println("<p class='text-red-600'>Error processing data: " + e.getMessage() + "</p>");
						e.printStackTrace();
						}
						} else {
						out.println("<p class='text-red-600'>Invalid JSON data for customer or order.</p>");
						}
						}
						} catch (Exception e) {
						out.println("<p class='text-red-600'>" + e.getMessage() + "</p>");
						e.printStackTrace();
						}
						%>
					</tbody>
				</table>



			</div>
		</div>

		<!-- Order List -->
		<div class="bg-white rounded-lg border border-gray-200">
			<div class="p-6">
				<div class="flex justify-between items-center mb-4">
					<h3 class="text-lg font-semibold">Confirmed Orders</h3>
					<div class="flex space-x-2">
						<button
							class="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200">Filter</button>
						<button
							class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Export</button>
					</div>
				</div>
				<div class="overflow-x-auto">
					<table class="min-w-full divide-y divide-gray-200">
						<thead>
							<tr>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Order
									ID</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Customer</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Product</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Quantity</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Total
									Price</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Action</th>
							</tr>
						</thead>
						<tbody class="divide-y divide-gray-200">
							<%
							try {
								// Prepare SQL query to fetch data from the database
								String sql = "SELECT co.order_id, c.full_name, p.product_name, coi.quantity, coi.total_price FROM manufacturer.customer c JOIN manufacturer.customer_order co ON c.customer_id = co.customer_id JOIN manufacturer.customer_order_items coi ON co.order_id = coi.order_id JOIN manufacturer.products p ON coi.product_id = p.product_id WHERE co.manufacturer_id=?";
								stmt = conn.prepareStatement(sql);
								stmt.setInt(1, id); // Assuming id is set previously
								rs = stmt.executeQuery();

								

								// Iterate through the result set
								while (rs.next()) {
									
							%>
							<tr>
								<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=rs.getInt("order_id") %></td>
								<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=rs.getString("full_name") %></td>
								<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=rs.getString("product_name") %></td>
								<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=rs.getInt("quantity") %></td>
								<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=rs.getInt("total_price") %></td>
								<td class="px-6 py-4 whitespace-nowrap">
									<button class="px-3 py-1 bg-blue-500 text-white rounded-lg">Accept
										& Forward</button>
								</td>
							</tr>
							<%
								}
							} catch (Exception e) {
							out.println("<p class='text-red-600'>" + e.getMessage() + "</p>");
							e.printStackTrace();
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	</htmlCode> </element>



</body>
</html>