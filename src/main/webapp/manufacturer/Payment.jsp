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
					</a> <a href="#payments"
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
			</element>


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
</body>
</html>