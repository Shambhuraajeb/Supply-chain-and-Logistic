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
<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
%>
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


<element id="2ce9351c-84ff-4396-9ba8-f6ab906ff2e6"
	data-section-id="2ce9351c-84ff-4396-9ba8-f6ab906ff2e6"> <htmlCode>
<section id="production" class="p-6">
	<div class="mb-6">
		<h2 class="text-2xl font-bold text-gray-800">Inventory Management</h2>
		<p class="text-gray-600">Track and manage inventory levels across
			warehouses</p>
	</div>

	<div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<%
					try {
						conn = PostgresConnection.getConnection();
						stmt = conn.prepareStatement("select SUM(quantity) from warehouse.stock where manufacturer_id=?");
						stmt.setInt(1, id);

						rs = stmt.executeQuery();

						if (rs.next()) {
					%>
					<p class="text-sm text-gray-500">Total Stocks</p>
					<p class="text-2xl font-bold text-gray-800"><%=rs.getInt("sum")%></p>
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
                                                <path
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4">
                                                </path>
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
						"SELECT COUNT(product_name) AS low_stock_count FROM warehouse.stock s JOIN warehouse.reorder_level r ON s.stock_id = r.stock_id WHERE s.quantity < r.reorder_quantity AND s.manufacturer_id = ?");
						stmt.setInt(1, id);

						rs = stmt.executeQuery();

						if (rs.next()) {
					%>
					<p class="text-sm text-gray-500">Low Stock Items</p>
					<p class="text-2xl font-bold text-red-600"><%=rs.getInt("low_stock_count")%></p>
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
					<svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor"
						viewBox="0 0 24 24">
                                                <path
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z">
                                                </path>
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
						"SELECT ROUND(((w.capacity - COALESCE(SUM(s.quantity), 0)) * 100.0) / w.capacity, 2) AS remains FROM warehouse.warehouse w LEFT JOIN warehouse.stock s ON w.warehouse_id = s.warehouse_id AND s.manufacturer_id = ? GROUP BY w.warehouse_id, w.capacity");

						stmt.setInt(1, id);

						rs = stmt.executeQuery();

						if (rs.next()) {
					%>
					<p class="text-sm text-gray-500">Storage Capacity</p>
					<p class="text-2xl font-bold text-gray-800"><%=rs.getInt("remains") + "%"%></p>
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
				<div class="bg-green-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-green-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                                <path
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15">
                                                </path>
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
						"select COUNT(*) as order from warehouse.orders where order_status='Pending' and manufacturer_id=?");

						stmt.setInt(1, id);

						rs = stmt.executeQuery();

						if (rs.next()) {
					%>
					<p class="text-sm text-gray-500">Pending Orders</p>
					<p class="text-2xl font-bold text-gray-800"><%=rs.getInt("order")%></p>
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
                                                <path
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
				</div>
			</div>
		</div>
	</div>
	<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
		<!-- Critical Stock Alerts -->
		<div class="bg-white p-6 rounded-lg border border-gray-200">
			<h3 class="text-lg font-semibold mb-4">Critical Stock Alerts</h3>
			<div class="space-y-4">
				<%
				boolean hasAlerts = false;

				try {
					conn = PostgresConnection.getConnection();
					stmt = conn.prepareStatement(
					"SELECT product_name, quantity, reorder_quantity FROM warehouse.stock JOIN warehouse.reorder_level ON stock.stock_id = reorder_level.stock_id WHERE quantity < reorder_quantity AND manufacturer_id = ?;");
					stmt.setInt(1, id);

					rs = stmt.executeQuery();
					while (rs.next()) {
						hasAlerts = true;
						String productName = rs.getString("product_name");
						int quantity = rs.getInt("quantity");
						int reorderLevel = rs.getInt("reorder_quantity");
				%>
				<div
					class="flex items-center justify-between p-3 bg-red-50 rounded-lg border border-red-200">
					<div class="flex items-center">
						<svg class="w-5 h-5 text-red-500 mr-3" fill="none"
							stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z">
                        </path>
                    </svg>
						<div>
							<p class="font-medium"><%=productName%></p>
							<p class="text-sm text-red-600">
								Stock Level:
								<%=quantity%>
								units (Below minimum:
								<%=reorderLevel%>)
							</p>
						</div>
					</div>

				</div>
				<%
				}
				} catch (Exception e) {
				out.println("<p class='text-red-600'>Error loading alerts: " + e.getMessage() + "</p>");
				e.printStackTrace();
				}
				// If no alerts, show a fallback message
				if (!hasAlerts) {
				%>
				<p class="text-sm text-gray-600">No critical stock alerts at the
					moment.</p>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<div class="bg-white rounded-lg border border-gray-200">
		<div class="p-6">
			<div class="flex justify-between items-center mb-4">
				<h3 class="text-lg font-semibold">Inventory List</h3>
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
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item
								Code</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stock
								Level</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Location</th>
						</tr>
					</thead>
					<tbody class="divide-y divide-gray-200">
						<%
						try {
							// Use the custom PostgresConnection class for the connection
							conn = PostgresConnection.getConnection(); // Assuming the method is getConnection()

							// Query to fetch inventory data
							String sql = "SELECT s.stock_id, s.product_name, sc.category_name, s.quantity, sa.alert_message, w.warehouse_address "
							+ "FROM warehouse.stock s " + "JOIN warehouse.stock_cat sc ON s.stock_cat_id = sc.stock_cat_id "
							+ "JOIN warehouse.warehouse w ON s.warehouse_id = w.warehouse_id "
							+ "JOIN warehouse.stock_alerts sa ON s.stock_id = sa.stock_id " + "WHERE s.manufacturer_id = ? "
							+ "ORDER BY s.stock_id DESC LIMIT 5";

							stmt = conn.prepareStatement(sql);
							stmt.setInt(1, id);
							rs = stmt.executeQuery();

							// Loop through the result set and display data
							while (rs.next()) {
								String itemCode = rs.getString("stock_id");
								String name = rs.getString("product_name");
								String category = rs.getString("category_name");
								int stockLevel = rs.getInt("quantity");
								String status = rs.getString("alert_message");
								String warehouseLocation = rs.getString("warehouse_address");

								// Determine the status class based on the 'status' value
								String statusClass = "bg-green-100 text-green-800"; // Default to Optimal
								if ("Critical".equals(status)) {
							statusClass = "bg-red-100 text-red-800";
								} else if ("Warning".equals(status)) {
							statusClass = "bg-yellow-100 text-yellow-800";
								}
						%>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=itemCode%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=name%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=category%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=stockLevel%></td>
							<td class="px-6 py-4 whitespace-nowrap"><span
								class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%=statusClass%>"><%=status%></span>
							</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%=warehouseLocation%></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
						} finally {
						// Close resources
						if (rs != null)
						try {
							rs.close();
						} catch (SQLException e) {
						}
						if (stmt != null)
						try {
							stmt.close();
						} catch (SQLException e) {
						}
						if (conn != null)
						try {
							conn.close();
						} catch (SQLException e) {
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>