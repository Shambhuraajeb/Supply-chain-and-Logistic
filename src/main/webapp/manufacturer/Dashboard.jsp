<%@ page session="true"%>
<%
int id = (int) session.getAttribute("id");
String manufacturerName = (String) session.getAttribute("manufacturerName");
String email = (String) session.getAttribute("email");
String businessName = (String) session.getAttribute("businessName");

if (id == 0) {
	request.setAttribute("errorMessage", "Session expired or user not logged in");
	request.getRequestDispatcher("/error.jsp").forward(request, response);
}
%>
<%@ page import="java.sql.*, java.util.*, com.scm.db.PostgresConnection"%>

<!DOCTYPE html>
<html lang="en" class="scroll-smooth">

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

<body class="antialiased text-gray-800 min-h-screen flex flex-col">


</body>

</html>
<element id="5d1b1ac4-52fe-452d-a142-5593c18720e9"
	data-section-id="5d1b1ac4-52fe-452d-a142-5593c18720e9"> <htmlCode>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Production Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
<style>
[x-cloak] {
	display: none !important;
}

html {
	scroll-behavior: smooth;
}

.active-link { @apply bg-blue-500 text-white;
	transition: all 0.3s ease;
}

.nav-link:hover { @apply bg-gray-100;
	transition: all 0.3s ease;
}
</style>
</head>

<body class="bg-[#E5E7EB]">
	<div class="flex" id="root">
		<div x-data="{ isOpen: false }">
			<nav
				class="fixed h-screen w-64 bg-white border-r border-gray-200 hidden lg:block">
				<div class="p-4 border-b border-gray-200">
					<div class="text-xl font-bold text-gray-800">Production Hub</div>
				</div>

				<div class="py-4">

					<a href="#materials"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                                </svg> Materials
					</a> <a href="#production"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z">
                                    </path>
                                </svg> Inventory
					</a> <a href="#customer-orders"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4">
                                    </path>
                                </svg> Customers
					</a> <a href="#payments"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4">
                                    </path>
                                </svg> Payments
					</a> <a href="#demand"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z">
                                    </path>
                                </svg> Demand
					</a> <a href="#analytics"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z">
                                    </path>
                                </svg> Analytics
					</a> <a href="#reports"
						class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
						<svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
                                    <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z">
                                    </path>
                                </svg> Reports
					</a>
				</div>

				<div class="absolute bottom-0 w-full border-t border-gray-200">
					<div class="p-4">
						<div class="flex items-center">
							<img src="https://avatar.iran.liara.run/public" alt="User"
								class="w-8 h-8 rounded-full">
							<div class="ml-3">
								<p class="text-sm font-medium text-gray-700"><%=manufacturerName %> <span style="color: red;"><a href="${pageContext.request.contextPath}/logout.jsp" class="btn btn-danger"><i>Logout</i></a></span></p>
                                    <p class="text-xs text-gray-500"><%=businessName %></p>
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
			</header></element>
<element id="655ee798-f120-4389-859f-70a99fa9d268"
	data-section-id="655ee798-f120-4389-859f-70a99fa9d268"> <htmlcode
	id="el-7julendb">
<section id="materials" class="p-6">
	<!-- Header Section -->
	<div class="mb-6" id="el-2n65rzwd">
		<h2 class="text-2xl font-bold text-gray-800" id="el-hr6w6zjn">Raw
			Materials Management</h2>
		<p class="text-gray-600" id="el-90kta2rw">Track and manage raw
			material inventory and orders</p>
	</div>

	<!-- Quick Actions -->
	<div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6"
		id="el-g65r7whh">
		<button
			class="flex items-center justify-center p-4 bg-white border border-gray-200 rounded-lg hover:border-blue-500 hover:bg-blue-50 transition-all duration-300 cursor-pointer focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
			id="el-e15ja6ad" onclick="window.location.href='Order.jsp'">
			<span class="mr-2"> <svg class="w-5 h-5 text-blue-500"
					fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
			</span> Create New Order
		</button>
		<button
			class="flex items-center justify-center p-4 bg-white border border-gray-200 rounded-lg hover:border-blue-500 hover:bg-blue-50 transition-all duration-300 cursor-pointer focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
			id="el-e15ja6ad" onclick="window.location.href='Order.html'">
			<span class="mr-2"> <svg class="w-5 h-5 text-blue-500"
					fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                        </svg>
			</span> Recived Raw Material Orders
		</button>
	</div>

	<!-- Main Content Grid -->
	<div class="grid grid-cols-1 lg:grid-cols-3 gap-6" id="el-051phl9y">
		<!-- Inventory Status -->
		<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		class Stock {
			String name;
			int quantity;
			int percent;

			Stock(String name, int quantity, int percent) {
				this.name = name;
				this.quantity = quantity;
				this.percent = percent;
			}
		}

		List<Stock> stockList = new ArrayList<>();

		try {
			conn = PostgresConnection.getConnection();
			String sql = "SELECT s.product_name, s.quantity, r.reorder_quantity " + "FROM warehouse.stock s "
			+ "JOIN warehouse.reorder_level r ON s.stock_id = r.stock_id " + "WHERE s.manufacturer_id = 1";

			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				String name = rs.getString("product_name");
				int qty = rs.getInt("quantity");
				int reorderQty = rs.getInt("reorder_quantity");

				// Avoid division by zero
				int percent = reorderQty > 0 ? (int) ((qty * 100.0) / reorderQty) : 0;

				stockList.add(new Stock(name, qty, percent));
			}

		} catch (Exception e) {
			out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
		} finally {
			if (rs != null)
				try {
			rs.close();
				} catch (Exception e) {
				}
			if (stmt != null)
				try {
			stmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
			conn.close();
				} catch (Exception e) {
				}
		}
		%>

		<div class="bg-white p-6 rounded-lg border border-gray-200">
			<h3 class="text-lg font-semibold mb-4">Current Inventory Status</h3>
			<div class="space-y-4">
				<%
				for (Stock stock : stockList) {
					String colorClass = "green";
					if (stock.percent <= 20)
						colorClass = "red";
					else if (stock.percent <= 50)
						colorClass = "yellow";
				%>
				<div class="flex justify-between items-center">
					<span class="text-gray-600"><%=stock.name%></span> <span
						class="text-<%=colorClass%>-500 font-medium"><%=stock.percent%>%
						(<%=stock.quantity%> units)</span>
				</div>
				<div class="w-full bg-gray-200 rounded-full h-2">
					<div class="bg-<%=colorClass%>-500 h-2 rounded-full"
						style="width: <%=stock.percent%>%"></div>
				</div>
				<%
				}
				%>
			</div>
		</div>


		<!-- Recent Orders -->
		<div class="bg-white p-6 rounded-lg border border-gray-200">
			<h3 class="text-lg font-semibold mb-4">Recent Orders</h3>
			<div class="space-y-4">

				<%
				try {
					conn = PostgresConnection.getConnection();
					String sql = "SELECT o.order_id, o.product_id, o.quantity, o.order_status, s.product_name "
					+ "FROM manufacturer.\"order\" o " + "JOIN supplier.stock s ON o.product_id = s.stock_id "
					+ "ORDER BY o.order_date DESC LIMIT 3";

					stmt = conn.prepareStatement(sql);
					rs = stmt.executeQuery();

					while (rs.next()) {
						int orderId = rs.getInt("order_id");
						String productName = rs.getString("product_name");
						int quantity = rs.getInt("quantity");
						String status = rs.getString("order_status");

						String statusColorClass = "";
						if ("Delivered".equalsIgnoreCase(status)) {
					statusColorClass = "bg-green-100 text-green-800";
						} else if ("In Transit".equalsIgnoreCase(status)) {
					statusColorClass = "bg-blue-100 text-blue-800";
						} else if ("Processing".equalsIgnoreCase(status)) {
					statusColorClass = "bg-yellow-100 text-yellow-800";
						} else {
					statusColorClass = "bg-gray-100 text-gray-800";
						}
						;
				%>

				<div
					class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
					<div>
						<p class="font-medium">
							Order #<%=orderId%></p>
						<p class="text-sm text-gray-500"><%=productName%>
							-
							<%=quantity%>
							units
						</p>
					</div>
					<span
						class="px-3 py-1 text-sm rounded-full <%=statusColorClass%>"><%=status%></span>
				</div>

				<%
				}
				} catch (Exception e) {
				out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
				} finally {
				if (rs != null)
				rs.close();
				if (stmt != null)
				stmt.close();
				if (conn != null)
				conn.close();
				}
				%>

			</div>
		</div>


	</div>

	<!-- Suppliers Table -->
	<div class="mt-6 bg-white rounded-lg border border-gray-200">
		<div class="p-6">
			<h3 class="text-lg font-semibold mb-4">Suppliers Details</h3>
			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200">
					<thead>
						<tr>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Supplier
								Name</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">On-time
								Delivery</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quality
								Compliance</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Cost
								Efficiency</th>
						</tr>
					</thead>
					<tbody class="divide-y divide-gray-200">
						<%
						try {
							conn = PostgresConnection.getConnection();
							String sql = "SELECT supplier_name, " + "on_time_delivery_rate, quality_compliance, cost_efficiency "
							+ "FROM manufacturer.supplier_performance";
							stmt = conn.prepareStatement(sql);
							rs = stmt.executeQuery();

							while (rs.next()) {
								String supplierName = rs.getString("supplier_name");
								int deliveryRate = rs.getInt("on_time_delivery_rate");
								int quality = rs.getInt("quality_compliance");
								int cost = rs.getInt("cost_efficiency");
						%>
						<tr>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%=supplierName%></td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600"><%=deliveryRate%>%</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600"><%=quality%>%</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600"><%=cost%>%</td>
						</tr>
						<%
						}
						} catch (Exception e) {
						out.println("<tr><td colspan='6' class='text-red-600 px-6 py-4'>Error loading data: " + e.getMessage() + "</td></tr>");
						} finally {
						if (rs != null)
						rs.close();
						if (stmt != null)
						stmt.close();
						if (conn != null)
						conn.close();
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</section>

</htmlcode> </element>
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
					<p class="text-sm text-gray-500">Total SKUs</p>
					<p class="text-2xl font-bold text-gray-800">1,234</p>
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
                                            <p class="text-sm text-gray-500">Low Stock Items</p>
                                            <p class="text-2xl font-bold text-red-600">23</p>
                                        </div>
                                        <div class="bg-red-100 p-2 rounded-lg">
                                            <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z">
                                                </path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <div class="bg-white p-4 rounded-lg border border-gray-200">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <p class="text-sm text-gray-500">Storage Capacity</p>
                                            <p class="text-2xl font-bold text-gray-800">78%</p>
                                        </div>
                                        <div class="bg-green-100 p-2 rounded-lg">
                                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15">
                                                </path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <div class="bg-white p-4 rounded-lg border border-gray-200">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <p class="text-sm text-gray-500">Pending Orders</p>
                                            <p class="text-2xl font-bold text-gray-800">45</p>
                                        </div>
                                        <div class="bg-yellow-100 p-2 rounded-lg">
                                            <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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
                        "SELECT product_name, quantity, reorder_quantity FROM warehouse.stock JOIN warehouse.reorder_level ON stock.stock_id = reorder_level.stock_id WHERE quantity < reorder_quantity AND manufacturer_id = ?;"
                    );
                    stmt.setInt(1, id); // Set manufacturer id parameter

                    rs = stmt.executeQuery();  // Execute the query here
                    while (rs.next()) {
                        hasAlerts = true;
                        String productName = rs.getString("product_name");
                        int quantity = rs.getInt("quantity");
                        int reorderLevel = rs.getInt("reorder_quantity");
            %>
            <div class="flex items-center justify-between p-3 bg-red-50 rounded-lg border border-red-200">
                <div class="flex items-center">
                    <svg class="w-5 h-5 text-red-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z">
                        </path>
                    </svg>
                    <div>
                        <p class="font-medium"><%= productName %></p>
                        <p class="text-sm text-red-600">
                            Stock Level: <%= quantity %> units (Below minimum: <%= reorderLevel %>)
                        </p>
                    </div>
                </div>
                
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p class='text-red-600'>Error loading alerts: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    try {
                        // Close resources to avoid memory leaks
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException ex) {
                        out.println("<p class='text-red-600'>Error closing resources: " + ex.getMessage() + "</p>");
                        ex.printStackTrace();
                    }
                }

                // If no alerts, show a fallback message
                if (!hasAlerts) {
            %>
            <p class="text-sm text-gray-600">No critical stock alerts at the moment.</p>
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
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200">Filter</button>
                <button class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Export</button>
            </div>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead>
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item Code</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stock Level</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Location</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <%

                        try {
                            // Use the custom PostgresConnection class for the connection
                            conn = PostgresConnection.getConnection();  // Assuming the method is getConnection()

                            // Query to fetch inventory data
                            String sql = "SELECT s.stock_id, s.product_name, sc.category_name, s.quantity, sa.alert_message, w.warehouse_address " +
             "FROM warehouse.stock s " +
             "JOIN warehouse.stock_cat sc ON s.stock_cat_id = sc.stock_cat_id " +
             "JOIN warehouse.warehouse w ON s.warehouse_id = w.warehouse_id " +
             "JOIN warehouse.stock_alerts sa ON s.stock_id = sa.stock_id " +
             "WHERE s.manufacturer_id = ? " +
             "ORDER BY s.stock_id DESC LIMIT 5";




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
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= itemCode %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= name %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= category %></td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= stockLevel %></td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%= statusClass %>"><%= status %></span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= warehouseLocation %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
                        } finally {
                            // Close resources
                            if (rs != null) try { rs.close(); } catch (SQLException e) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                            if (conn != null) try { conn.close(); } catch (SQLException e) {}
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
                            
                            




</section>
</htmlCode> </element>
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
					<p class="text-sm text-gray-500">Total Orders</p>
					<p class="text-2xl font-bold text-gray-800">1,245</p>
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
					<p class="text-sm text-gray-500">Pending Orders</p>
					<p class="text-2xl font-bold text-yellow-600">45</p>
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
					<p class="text-sm text-gray-500">New Requests</p>
					<p class="text-2xl font-bold text-red-600">12</p>
				</div>
				<div class="bg-red-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor"
						viewBox="0 0 24 24">
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
			<table class="min-w-full divide-y divide-gray-200">
				<thead>
					<tr>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
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
					<tr>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">John
							Doe</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">john@example.com</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Laptop</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$2000</td>
						<td class="px-6 py-4 whitespace-nowrap">
							<button class="px-3 py-1 bg-green-500 text-white rounded-lg">Approve</button>
							<button class="px-3 py-1 bg-red-500 text-white rounded-lg">Reject</button>
						</td>
					</tr>
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
						<tr>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">ORD1234</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Alice
								Brown</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Phone</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$700</td>
							<td class="px-6 py-4 whitespace-nowrap">
								<button class="px-3 py-1 bg-blue-500 text-white rounded-lg">Accept
									& Forward</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</htmlCode> </element>

<element> <htmlCode>
<section id="payments" class="p-6">
	<!-- Header Section -->
	<div class="mb-6">
		<h2 class="text-2xl font-bold text-gray-800">Payments</h2>
		<p class="text-gray-600">Manage pending and received payments.</p>
	</div>

	<!-- Payment Overview Cards -->
	<div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Total Received</p>
					<p class="text-2xl font-bold text-green-600">$50,000</p>
				</div>
				<div class="bg-green-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-green-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                            </svg>
				</div>
			</div>
		</div>

		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Pending Payments</p>
					<p class="text-2xl font-bold text-yellow-600">$8,500</p>
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
	</div>

	<!-- Payment Table -->
	<div class="bg-white p-6 rounded-lg border border-gray-200">
		<h3 class="text-lg font-semibold mb-4">Recent Transactions</h3>
		<div class="overflow-x-auto">
			<table class="min-w-full divide-y divide-gray-200">
				<thead>
					<tr>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Transaction
							ID</th>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Customer</th>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Amount</th>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
						<th
							class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-gray-200">
					<tr>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">TXN56789</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Jane
							Doe</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$1,500</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">Completed</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">March
							1, 2025</td>
					</tr>
					<tr>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">TXN67890</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">John
							Smith</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$2,000</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-yellow-600">Pending</td>
						<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">March
							2, 2025</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

</htmlCode> </element>
<element id="0c373ef6-56eb-491c-9158-2ed34441b9a9"
	data-section-id="0c373ef6-56eb-491c-9158-2ed34441b9a9"> <htmlCode>
<section id="demand" class="p-6">
	<!-- Header Section -->
	<div class="mb-6">
		<h2 class="text-2xl font-bold text-gray-800">Demand Forecasting</h2>
		<p class="text-gray-600">Analyze and predict future demand
			patterns</p>
	</div>

	<!-- Forecast Overview Cards -->
	<div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Predicted Monthly Demand</p>
					<p class="text-2xl font-bold text-gray-800">24,500</p>
					<p class="text-sm text-green-600">↑ 12% vs last month</p>
				</div>
				<div class="bg-blue-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-blue-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                            </svg>
				</div>
			</div>
		</div>

		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Forecast Accuracy</p>
					<p class="text-2xl font-bold text-gray-800">92%</p>
					<p class="text-sm text-green-600">↑ 3% improvement</p>
				</div>
				<div class="bg-green-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-green-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
				</div>
			</div>
		</div>

		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Lead Time Average</p>
					<p class="text-2xl font-bold text-gray-800">4.2 days</p>
					<p class="text-sm text-red-600">↓ 0.3 days</p>
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
					<p class="text-sm text-gray-500">Safety Stock Level</p>
					<p class="text-2xl font-bold text-gray-800">15%</p>
					<p class="text-sm text-blue-600">Optimal</p>
				</div>
				<div class="bg-purple-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-purple-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
                            </svg>
				</div>
			</div>
		</div>
	</div>

	<!-- Demand Trends and Forecasting -->
	<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
		<!-- Monthly Trends -->
		<div class="bg-white p-6 rounded-lg border border-gray-200">
			<h3 class="text-lg font-semibold mb-4">Monthly Demand Trends</h3>
			<div class="space-y-4">
				<div class="flex items-center justify-between">
					<div>
						<p class="text-sm font-medium">Product A</p>
						<p class="text-xs text-gray-500">Forecasted: 12,000 units</p>
					</div>
					<div class="flex items-center">
						<span class="text-green-600 text-sm mr-2">↑ 8%</span>
						<div class="w-24 h-2 bg-gray-200 rounded-full">
							<div class="bg-green-500 h-2 rounded-full" style="width: 80%"></div>
						</div>
					</div>
				</div>

				<div class="flex items-center justify-between">
					<div>
						<p class="text-sm font-medium">Product B</p>
						<p class="text-xs text-gray-500">Forecasted: 8,500 units</p>
					</div>
					<div class="flex items-center">
						<span class="text-red-600 text-sm mr-2">↓ 3%</span>
						<div class="w-24 h-2 bg-gray-200 rounded-full">
							<div class="bg-red-500 h-2 rounded-full" style="width: 65%"></div>
						</div>
					</div>
				</div>

				<div class="flex items-center justify-between">
					<div>
						<p class="text-sm font-medium">Product C</p>
						<p class="text-xs text-gray-500">Forecasted: 4,000 units</p>
					</div>
					<div class="flex items-center">
						<span class="text-green-600 text-sm mr-2">↑ 12%</span>
						<div class="w-24 h-2 bg-gray-200 rounded-full">
							<div class="bg-green-500 h-2 rounded-full" style="width: 90%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

	<!-- Forecast Details Table -->
	<div class="bg-white rounded-lg border border-gray-200">
		<div class="p-6">
			<div class="flex justify-between items-center mb-4">
				<h3 class="text-lg font-semibold">Detailed Forecast Analysis</h3>
				<button
					class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Export
					Report</button>
			</div>
			<div class="overflow-x-auto">
				<table class="min-w-full divide-y divide-gray-200">
					<thead>
						<tr>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Product</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Current Demand</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Forecasted Demand</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Growth</th>
							<th
								class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
								Confidence</th>
						</tr>
					</thead>
					<tbody class="divide-y divide-gray-200">
						<tr>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">Product
								A</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">11,000</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">12,000</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">+8%</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">95%</td>
						</tr>
						<tr>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">Product
								B</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">8,800</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">8,500</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-red-600">-3%</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">92%</td>
						</tr>
						<tr>
							<td
								class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">Product
								C</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">3,600</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">4,000</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">+12%</td>
							<td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">89%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</htmlCode> </element>
<element id="f4e721ae-db8c-4c49-ac7e-b071dafb4494"
	data-section-id="f4e721ae-db8c-4c49-ac7e-b071dafb4494"> <htmlCode>
<section id="analytics" class="p-6">
	<!-- Header Section -->
	<div class="mb-6">
		<h2 class="text-2xl font-bold text-gray-800">KPI Analytics</h2>
		<p class="text-gray-600">Performance metrics and key indicators</p>
	</div>

	<!-- Key Performance Indicators -->
	<div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Overall Equipment
						Effectiveness</p>
					<p class="text-2xl font-bold text-gray-800">87.5%</p>
					<p class="text-sm text-green-600">↑ 2.3%</p>
				</div>
				<div class="bg-blue-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-blue-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                            </svg>
				</div>
			</div>
		</div>

		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Production Yield</p>
					<p class="text-2xl font-bold text-gray-800">94.2%</p>
					<p class="text-sm text-green-600">↑ 1.5%</p>
				</div>
				<div class="bg-green-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-green-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                            </svg>
				</div>
			</div>
		</div>

		<div class="bg-white p-4 rounded-lg border border-gray-200">
			<div class="flex items-center justify-between">
				<div>
					<p class="text-sm text-gray-500">Cycle Time</p>
					<p class="text-2xl font-bold text-gray-800">45 min</p>
					<p class="text-sm text-red-600">↑ 3 min</p>
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
					<p class="text-sm text-gray-500">Quality Rate</p>
					<p class="text-2xl font-bold text-gray-800">98.7%</p>
					<p class="text-sm text-green-600">↑ 0.5%</p>
				</div>
				<div class="bg-purple-100 p-2 rounded-lg">
					<svg class="w-6 h-6 text-purple-600" fill="none"
						stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
				</div>
			</div>
		</div>
	</div>


</section>
</htmlCode> </element>
<element id="1ac25df3-891a-4627-b62b-dfd5e53ada25"
	data-section-id="1ac25df3-891a-4627-b62b-dfd5e53ada25"> <htmlCode>
<div id="root">
	<section id="reports"
		class="page-section min-h-screen bg-white text-black p-6">
		<div class="max-w-7xl mx-auto">
			<div class="mb-8">
				<div class="flex justify-between items-center mb-6">
					<h2 class="text-2xl font-bold">Production Reports</h2>
					<div class="flex space-x-4">
						<button
							class="px-4 py-2 bg-blue-500 hover:bg-blue-600 rounded-lg flex items-center">
							<svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor"
								viewBox="0 0 24 24">
                                        <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                    </svg>
							Export Reports
						</button>
						<button
							class="px-4 py-2 bg-green-500 hover:bg-green-600 rounded-lg flex items-center">
							<svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor"
								viewBox="0 0 24 24">
                                        <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                    </svg>
							New Report
						</button>
					</div>
				</div>

				<!-- Report Filters -->
				<div
					class="bg-white rounded-lg p-6 border border-neutral-700/30 mb-6">
					<div class="grid grid-cols-1 md:grid-cols-4 gap-4">
						<div>
							<label class="block text-sm font-medium mb-2">Date Range</label>
							<select
								class="w-full bg-white border border-neutral-600 rounded-lg px-3 py-2">
								<option>Last 7 Days</option>
								<option>Last 30 Days</option>
								<option>Last Quarter</option>
								<option>Custom Range</option>
							</select>
						</div>
						<div>
							<label class="block text-sm font-medium mb-2">Production
								Line</label> <select
								class="w-full bg-white border border-neutral-600 rounded-lg px-3 py-2">
								<option>All Lines</option>
								<option>Line A</option>
								<option>Line B</option>
								<option>Line C</option>
							</select>
						</div>
						<div>
							<label class="block text-sm font-medium mb-2">Report Type</label>
							<select
								class="w-full bg-white border border-neutral-600 rounded-lg px-3 py-2">
								<option>Production Summary</option>
								<option>Quality Analysis</option>
								<option>Efficiency Metrics</option>
								<option>Cost Analysis</option>
							</select>
						</div>
						<div>
							<label class="block text-sm font-medium mb-2">Status</label> <select
								class="w-full bg-white border border-neutral-600 rounded-lg px-3 py-2">
								<option>All Status</option>
								<option>Completed</option>
								<option>In Progress</option>
								<option>Pending</option>
							</select>
						</div>
					</div>
				</div>

				<!-- Recent Reports Table -->
				<div
					class="bg-white rounded-lg p-6 border border-neutral-700/30 mb-6">
					<h3 class="text-lg font-semibold mb-4">Recent Reports</h3>
					<div class="overflow-x-auto">
						<table class="min-w-full divide-y divide-white">
							<thead>
								<tr>
									<th
										class="px-6 py-3 text-left text-xs font-medium text-neutral-400 uppercase tracking-wider">
										Report Name</th>
									<th
										class="px-6 py-3 text-left text-xs font-medium text-neutral-400 uppercase tracking-wider">
										Type</th>
									<th
										class="px-6 py-3 text-left text-xs font-medium text-neutral-400 uppercase tracking-wider">
										Date Generated</th>
									<th
										class="px-6 py-3 text-left text-xs font-medium text-neutral-400 uppercase tracking-wider">
										Status</th>
									<th
										class="px-6 py-3 text-left text-xs font-medium text-neutral-400 uppercase tracking-wider">
										Actions</th>
								</tr>
							</thead>
							<tbody class="divide-y divide-white">
								<tr>
									<td class="px-6 py-4">Monthly Production Summary</td>
									<td class="px-6 py-4">Production Summary</td>
									<td class="px-6 py-4">2024-01-20</td>
									<td class="px-6 py-4"><span
										class="px-2 py-1 text-xs rounded-full bg-green-400/20 text-green-400">Completed</span>
									</td>
									<td class="px-6 py-4">
										<div class="flex space-x-2">
											<button class="text-blue-400 hover:text-blue-300">View</button>
											<button class="text-blue-400 hover:text-blue-300">Download</button>
										</div>
									</td>
								</tr>
								<tr>
									<td class="px-6 py-4">Q4 Efficiency Analysis</td>
									<td class="px-6 py-4">Efficiency Metrics</td>
									<td class="px-6 py-4">2024-01-19</td>
									<td class="px-6 py-4"><span
										class="px-2 py-1 text-xs rounded-full bg-yellow-400/20 text-yellow-400">In
											Progress</span></td>
									<td class="px-6 py-4">
										<div class="flex space-x-2">
											<button class="text-blue-400 hover:text-blue-300">View</button>
											<button class="text-neutral-500 cursor-not-allowed">Download</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Scheduled Reports -->
				<div class="bg-white rounded-lg p-6 border border-neutral-700/30">
					<h3 class="text-lg font-semibold mb-4">Scheduled Reports</h3>
					<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
						<div class="bg-white p-4 rounded-lg">
							<div class="flex justify-between items-start">
								<div>
									<h4 class="font-medium">Daily Production Report</h4>
									<p class="text-sm text-neutral-400">Generates at 23:00
										daily</p>
								</div>
								<div class="flex items-center">
									<span class="w-2 h-2 bg-green-400 rounded-full"></span>
								</div>
							</div>
						</div>
						<div class="bg-white/30 p-4 rounded-lg">
							<div class="flex justify-between items-start">
								<div>
									<h4 class="font-medium">Weekly KPI Summary</h4>
									<p class="text-sm text-neutral-400">Generates every Monday
										at 06:00</p>
								</div>
								<div class="flex items-center">
									<span class="w-2 h-2 bg-green-400 rounded-full"></span>
								</div>
							</div>
						</div>
						<div class="bg-white/30 p-4 rounded-lg">
							<div class="flex justify-between items-start">
								<div>
									<h4 class="font-medium">Monthly Performance Analysis</h4>
									<p class="text-sm text-neutral-400">Generates 1st of every
										month</p>
								</div>
								<div class="flex items-center">
									<span class="w-2 h-2 bg-green-400 rounded-full"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</htmlCode> </element>
</body>

</html>