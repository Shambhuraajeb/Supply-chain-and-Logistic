<!DOCTYPE html>
<html class="scroll-smooth" lang="en">

<head>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <meta content="#ffffff" name="theme-color" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;0,1000;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900;1,1000&amp;display=swap"
        rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet" />
    <title>
        Supply Chain Management Portal | Multi-Role Login &amp; Registration
    </title>
    <!-- SEO Description -->
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
    <!-- Performance optimization: Preload critical resources -->
    <link as="script" href="https://cdn.tailwindcss.com" rel="preload" />
    <!-- Header Scripts -->
    <!-- Preconnect -->
    <!-- Font stylesheet -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js"
        type="application/javascript">
        </script>
    <!-- Core CSS -->
    <script src="https://cdn.tailwindcss.com">
    </script>
    <script>
        // render the settings object
        //console.log('settings', [object Object]);
        document.addEventListener('DOMContentLoaded', function () {
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: {
                                DEFAULT: '#2563EB',
                                50: '#f8f8f8',
                                100: '#e8e8e8',
                                200: '#d3d3d3',
                                300: '#a3a3a3',
                                400: '#737373',
                                500: '#525252',
                                600: '#404040',
                                700: '#262626',
                                800: '#171717',
                                900: '#0a0a0a',
                                950: '#030303',
                            },
                            secondary: {
                                DEFAULT: '#475569',
                                50: '#f8f8f8',
                                100: '#e8e8e8',
                                200: '#d3d3d3',
                                300: '#a3a3a3',
                                400: '#737373',
                                500: '#525252',
                                600: '#404040',
                                700: '#262626',
                                800: '#171717',
                                900: '#0a0a0a',
                                950: '#030303',
                            },
                            accent: {
                                DEFAULT: '',
                                50: '#f8f8f8',
                                100: '#e8e8e8',
                                200: '#d3d3d3',
                                300: '#a3a3a3',
                                400: '#737373',
                                500: '#525252',
                                600: '#404040',
                                700: '#262626',
                                800: '#171717',
                                900: '#0a0a0a',
                                950: '#030303',
                            },
                        },
                        fontFamily: {
                            sans: ['Nunito', 'Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Helvetica Neue', 'Arial', 'sans-serif'],
                            heading: ['Inter', 'Inter', 'system-ui', 'sans-serif'],
                            body: ['Inter', 'Inter', 'system-ui', 'sans-serif'],
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
        });
    </script>
    <!-- Utilities and Components -->
    <script defer="" src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.3/cdn.min.js">
    </script>
    <script defer="" src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.45.1/apexcharts.min.js">
    </script>
    <!-- Optimized Font Loading -->
    <!-- Icons -->
    <link crossorigin="anonymous" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        referrerpolicy="no-referrer" rel="stylesheet">
    <!-- Dynamic Meta Tags -->
    <meta content="website" property="og:type" />
    <meta content="en_US" property="og:locale" />
    <meta content="Supply Chain User Portal" property="og:site_name" />
    <meta content="summary_large_image" name="twitter:card" />
    <!-- Font Links -->
    <link href="" rel="icon" type="image/x-icon" />
    </link>
</head>

<body class="antialiased text-gray-800 min-h-screen flex flex-col">
    <!-- Skip to main content link for accessibility -->
    <a class="sr-only focus:not-sr-only focus:absolute focus:top-0 focus:left-0 focus:z-50 focus:p-4 focus:bg-white focus:text-black"
        href="#main-content">
        Skip to main content
    </a>
    <!-- Main content area -->
    <main class="flex-1 relative h-full" id="main-content">
        <div id="RolloutPageContent">
            <element data-section-id="c8d19ce2-768c-42c6-9356-afb37b99c95d" id="c8d19ce2-768c-42c6-9356-afb37b99c95d">
                <div id="root">
                    <nav class="bg-white shadow-md py-4 w-full" id="header">
                        <div class="container mx-auto px-4 flex flex-col md:flex-row justify-between items-center"
                            id="el-0i6shvco">
                            <!-- Logo -->
                            <div class="flex items-center justify-between w-full md:w-auto" id="el-m0898j8f">
                                <div class="text-2xl font-bold text-blue-600" id="el-fu8lbk0q">
                                    SupplyChain
                                </div>
                                <!-- Mobile menu button -->
                                <button aria-label="Toggle menu" class="md:hidden focus:outline-none"
                                    id="mobile-menu-button">
                                    <svg class="w-6 h-6 text-gray-600" fill="none" id="el-isu6fp7s"
                                        stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M4 6h16M4 12h16M4 18h16" id="el-0nw3ifbt" stroke-linecap="round"
                                            stroke-linejoin="round" stroke-width="2">
                                        </path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </nav>
                </div>
            </element>
            <element data-section-id="da4efc82-2111-412f-aed4-b7f32a937de0" id="da4efc82-2111-412f-aed4-b7f32a937de0">
                <div id="root">
                </div>
            </element>
            <element data-section-id="08840788-4239-44f1-a7b9-512b3cf380a9" id="08840788-4239-44f1-a7b9-512b3cf380a9">
                <div id="root">
                    <section class="py-12 px-4 sm:px-6 lg:px-8 bg-gradient-to-b from-blue-50 to-white"
                        id="role-selection">
                        <div class="max-w-7xl mx-auto" id="el-rfmnwb8v">
                            <div class="text-center mb-12" id="el-a7hnepz6">
                                <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl" id="el-mrl58wgq">
                                    Select Your Role in the Supply Chain
                                </h2>
                                <p class="mt-4 text-xl text-gray-600 max-w-2xl mx-auto" id="el-xtz9rxhi">
                                    Choose your specific role to access tailored features and permissions
                                </p>
                            </div>
                            <!-- Role cards display -->
                            <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4"
                                id="el-hawxkcs1">
                                <!-- Supplier Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-9k4wzo0t">
                                    <div class="relative h-36 bg-blue-600" id="el-2yzmfbcs">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-f1x2l3pp">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-qa49bkyr">
                                            <img alt="Supplier role icon" class="w-24 h-24 bg-white p-2 rounded-full"
                                                height="120" id="el-4691l3jh"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Supplier" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-f3fb3l0a">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-m66rpui8">
                                            Supplier
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-rb65yxwq">
                                            Manage raw materials, inventory, and supply operations
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-207ievr9">
                                            <li class="flex items-center" id="el-8216c9ea">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-pbtkxrrv" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-0jcslqdi">
                                                    </path>
                                                </svg>
                                                Inventory management
                                            </li>
                                            <li class="flex items-center" id="el-qisfnhdw">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-2l17bp2b" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-4ync8uvf">
                                                    </path>
                                                </svg>
                                                Order fulfillment
                                            </li>
                                            <li class="flex items-center" id="el-hiznsph2">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-huwysl2c" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-nfc5gj3a">
                                                    </path>
                                                </svg>
                                                Material planning
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-2u3msx7b">
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-blue-600 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Manufacturer Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-efxp07wo">
                                    <div class="relative h-36 bg-indigo-600" id="el-ix8rpi30">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-omcuvidk">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-r7pz2g4h">
                                            <img alt="Manufacturer role icon"
                                                class="w-24 h-24 bg-white p-2 rounded-full" height="120"
                                                id="el-cswqrlau"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Manufacturer" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-abjn9ise">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-bupidxgk">
                                            Manufacturer
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-hjw8xps7">
                                            Oversee production processes and assembly lines
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-h8gjt2tq">
                                            <li class="flex items-center" id="el-27tuhuqr">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-0ti47oym" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-mbd77x5m">
                                                    </path>
                                                </svg>
                                                Production scheduling
                                            </li>
                                            <li class="flex items-center" id="el-1efpgwm3">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-3mu8sr9k" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-xjzv5t7p">
                                                    </path>
                                                </svg>
                                                Quality control
                                            </li>
                                            <li class="flex items-center" id="el-0wcrok2s">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-n6c010of" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-oekxgj3a">
                                                    </path>
                                                </svg>
                                                Resource allocation
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-ot1pqk3t">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/manufacturer/login.jsp'"
                                                class="px-6 py-2 bg-indigo-600 text-white rounded-md shadow hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-opacity-50"
                                                data-role="manufacturer" id="el-gzgzhg86">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Warehouse Manager Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-j7mh7tgf">
                                    <div class="relative h-36 bg-yellow-600" id="el-f32hxvo8">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-ruuqbukq">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-zdayw5yo">
                                            <img alt="Warehouse Manager role icon"
                                                class="w-24 h-24 bg-white p-2 rounded-full" height="120"
                                                id="el-rhax3b56"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Warehouse" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-rtvbnqxg">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-co7xjj45">
                                            Warehouse Manager
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-rytdym9g">
                                            Organize storage and manage stock movement
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-iso0x953">
                                            <li class="flex items-center" id="el-8axm958j">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-8erbut7e" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-nh03p01p">
                                                    </path>
                                                </svg>
                                                Space optimization
                                            </li>
                                            <li class="flex items-center" id="el-1sbsxyy3">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-87c0eri1" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-q49t4uxd">
                                                    </path>
                                                </svg>
                                                Inventory tracking
                                            </li>
                                            <li class="flex items-center" id="el-0jjh9i1x">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-n3p552fh" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-4owd6u2a">
                                                    </path>
                                                </svg>
                                                Order processing
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-n5po36im">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/warehouse/login.html'"
                                                class="px-6 py-2 bg-yellow-600 text-white rounded-md shadow hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:ring-opacity-50"
                                                data-role="warehouse" id="el-hrnpej1w">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Transporter Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-mu5a8zdj">
                                    <div class="relative h-36 bg-green-600" id="el-pjkvnpn0">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-g6syzbh5">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-1hr9c5xw">
                                            <img alt="Transporter role icon" class="w-24 h-24 bg-white p-2 rounded-full"
                                                height="120" id="el-12tn1pvk"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Transporter" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-mmqr2hde">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-fwktx6tx">
                                            Transporter
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-vtelifpl">
                                            Coordinate shipments and delivery logistics
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-i19fnrbt">
                                            <li class="flex items-center" id="el-6q7g3nbk">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-tlaauus4" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-8prds6sx">
                                                    </path>
                                                </svg>
                                                Route optimization
                                            </li>
                                            <li class="flex items-center" id="el-hqubxes1">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-b9hebl6k" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-sgropn8t">
                                                    </path>
                                                </svg>
                                                Delivery tracking
                                            </li>
                                            <li class="flex items-center" id="el-zzui9863">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-hgmtjsbo" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-hwaxe6re">
                                                    </path>
                                                </svg>
                                                Fleet management
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-xkdk3r3f">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/transport/login.html'"
                                                class="px-6 py-2 bg-green-600 text-white rounded-md shadow hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-opacity-50"
                                                data-role="transporter" id="el-84xsbt04">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Wholesaler Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-ztzbmujl">
                                    <div class="relative h-36 bg-purple-600" id="el-1uj8ta8s">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-sl4scuvp">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-mqhch92i">
                                            <img alt="Wholesaler role icon" class="w-24 h-24 bg-white p-2 rounded-full"
                                                height="120" id="el-o0qwrxwe"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Wholesaler" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-cltjfdis">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-jfnf6zbb">
                                            Wholesaler
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-01lyioce">
                                            Manage bulk purchases and business distribution
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-man72bfk">
                                            <li class="flex items-center" id="el-ll11m0ay">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-1h8g0wf4" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-ij7upcug">
                                                    </path>
                                                </svg>
                                                Bulk ordering
                                            </li>
                                            <li class="flex items-center" id="el-5pdoxq0h">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-87flyg8v" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-i58rdo7n">
                                                    </path>
                                                </svg>
                                                Business sales
                                            </li>
                                            <li class="flex items-center" id="el-bnkrw1u0">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-fyh34ae6" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-191qbvnm">
                                                    </path>
                                                </svg>
                                                Stock forecasting
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-s0w6oew4">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/wholeseller/login.html'"
                                                class="px-6 py-2 bg-purple-600 text-white rounded-md shadow hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-opacity-50"
                                                data-role="wholesaler" id="el-sb5wcgo0">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Retailer Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-7z1nfbt8">
                                    <div class="relative h-36 bg-red-600" id="el-ix1u065z">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-9wuj0bfx">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-voff0tgl">
                                            <img alt="Retailer role icon" class="w-24 h-24 bg-white p-2 rounded-full"
                                                height="120" id="el-whk1mhgr"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Retailer" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-uizksopg">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-3cjgfhfa">
                                            Retailer
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-j4dagrub">
                                            Handle consumer sales and retail operations
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-if8ea5ap">
                                            <li class="flex items-center" id="el-83gvp2gu">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-rij5zfb6" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-ess6hy6l">
                                                    </path>
                                                </svg>
                                                POS management
                                            </li>
                                            <li class="flex items-center" id="el-iq4uu7wj">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-b1ef0nwy" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-sgg42c5f">
                                                    </path>
                                                </svg>
                                                Customer service
                                            </li>
                                            <li class="flex items-center" id="el-h7pn8zt5">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-tjwaszt0" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-a4ttusuw">
                                                    </path>
                                                </svg>
                                                Shelf management
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-0mmkzy9v">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/retailer/login.html'"
                                                class="px-6 py-2 bg-red-600 text-white rounded-md shadow hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-opacity-50"
                                                data-role="retailer" id="el-lkxr8kvj">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Accountant Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-1s67ilf2">
                                    <div class="relative h-36 bg-gray-600" id="el-kin53jm4">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-bh6ix2sf">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-h102l54f">
                                            <img alt="Accountant role icon" class="w-24 h-24 bg-white p-2 rounded-full"
                                                height="120" id="el-iobzaw2n"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Accountant" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-nb7e5q9l">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-e3t0q8fv">
                                            Accountant
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-mt99j6vq">
                                            Manage finances and financial reporting
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-eky1urnz">
                                            <li class="flex items-center" id="el-s03lrqsa">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-c71prdwx" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-muxrr2fa">
                                                    </path>
                                                </svg>
                                                Financial reporting
                                            </li>
                                            <li class="flex items-center" id="el-t650v59i">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-l2tzsv3k" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-0vk57cap">
                                                    </path>
                                                </svg>
                                                Budget planning
                                            </li>
                                            <li class="flex items-center" id="el-z7r46yr8">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-npl9l0xm" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-cfyj03ly">
                                                    </path>
                                                </svg>
                                                Tax management
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-m7ibr0e1">
                                            <button onclick="window.location.href='${pageContext.request.contextPath}/accountant/login.html'"
                                                class="px-6 py-2 bg-gray-600 text-white rounded-md shadow hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-opacity-50"
                                                data-role="accountant" id="el-qol9tep6">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Administrator Card -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-200 transform transition duration-300 hover:shadow-xl hover:scale-105"
                                    id="el-tqzdh572">
                                    <div class="relative h-36 bg-teal-600" id="el-s491khdb">
                                        <div class="absolute top-0 left-0 w-full h-full opacity-20 bg-pattern"
                                            id="el-yn8mavbw">
                                        </div>
                                        <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                            id="el-vru7cerp">
                                            <img alt="Administrator role icon"
                                                class="w-24 h-24 bg-white p-2 rounded-full" height="120"
                                                id="el-giz2rmt8"
                                                onerror="this.onerror=null; this.src='https://placehold.co/' + this.width + 'x' + this.height"
                                                src="https://placehold.co/120x120?text=Administrator" width="120" />
                                        </div>
                                    </div>
                                    <div class="p-6" id="el-kv05rj0k">
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-2"
                                            id="el-ndakzzcs">
                                            Administrator
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-8ui2kmxv">
                                            Control system settings and user permissions
                                        </p>
                                        <ul class="text-gray-600 text-sm mb-6 space-y-2" id="el-l6t7mu74">
                                            <li class="flex items-center" id="el-7qqy6g84">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-tlxrlnw3" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-44agcrmr">
                                                    </path>
                                                </svg>
                                                User management
                                            </li>
                                            <li class="flex items-center" id="el-ppua0tkr">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-nqaiqucd" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-xtbvlayy">
                                                    </path>
                                                </svg>
                                                System settings
                                            </li>
                                            <li class="flex items-center" id="el-ifza4otf">
                                                <svg class="w-4 h-4 text-green-500 mr-2" fill="currentColor"
                                                    id="el-0dd07wmm" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-kozzlnvx">
                                                    </path>
                                                </svg>
                                                Full access control
                                            </li>
                                        </ul>
                                        <div class="flex justify-center" id="el-3hg5h8zd">
                                            <button
                                                class="px-6 py-2 bg-teal-600 text-white rounded-md shadow hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:ring-opacity-50"
                                                data-role="administrator" id="el-o2lp5vt6">
                                                Login
                                            </button>
                                            <button  onclick="window.location.href='${pageContext.request.contextPath}/supplier/login.html'"
                                                class="px-6 py-2 bg-red-500 text-white rounded-md shadow hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                data-role="supplier" id="el-g9jvvap8" style="margin-left:10px">
                                                Sign Up
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Next action hint -->
                            <div class="text-center mt-12" id="el-mh1p698m">
                                <p class="text-gray-600" id="el-104pz10y">
                                    After selecting your role, you'll be directed to the appropriate login/signup form
                                </p>
                                <div class="mt-4" id="el-rbsiphf9">
                                    <button
                                        class="inline-flex items-center text-blue-600 font-medium hover:text-blue-800"
                                        id="view-all-roles">
                                        Need help choosing?
                                        <svg class="ml-2 w-5 h-5" fill="currentColor" id="el-vsoh1i5l"
                                            viewbox="0 0 20 20">
                                            <path clip-rule="evenodd"
                                                d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z"
                                                fill-rule="evenodd" id="el-uou6dad4">
                                            </path>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Loading animation overlay (initially visible) -->
                </div>
            </element>
            <element data-section-id="ee287f9e-af6a-4301-8948-6a614907ff3f" id="ee287f9e-af6a-4301-8948-6a614907ff3f">
                <div id="root">
                    <section class="py-16 bg-gray-50" id="benefits">
                        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" id="el-i00i62w6">
                            <div class="text-center mb-12" id="el-l8sm6dxb">
                                <h2 class="text-3xl font-bold text-gray-900 sm:text-4xl mb-4" id="el-q216ooir">
                                    Why Choose Our Supply Chain Platform
                                </h2>
                                <p class="text-xl text-gray-600 max-w-3xl mx-auto" id="el-zftg2aie">
                                    Streamline operations, increase efficiency, and gain valuable insights across the
                                    entire supply chain.
                                </p>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8" id="el-s2bsiymu">
                                <!-- Benefit Card 1 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-rvx89egb">
                                    <div class="rounded-full bg-blue-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-q0vae4tg">
                                        <svg class="w-8 h-8 text-blue-600" fill="none" id="el-j075b17z"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path d="M13 10V3L4 14h7v7l9-11h-7z" id="el-0gqkbb8r" stroke-linecap="round"
                                                stroke-linejoin="round" stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-hrbaaqco">
                                        Streamlined Operations
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-n5lwvnxl">
                                        Automate workflows and reduce manual tasks with our intuitive interface designed
                                        for each role.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-jwe3frtf">
                                        <li class="flex items-center" id="el-qcwcqvfs">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-lryr2uay" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-c98ag95e">
                                                </path>
                                            </svg>
                                            <span id="el-veejk3gg">
                                                40% reduction in processing time
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-6xrhfilk">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-8zwhtkw0" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-t76lhtsv">
                                                </path>
                                            </svg>
                                            <span id="el-q8qymhon">
                                                Customized workflows by role
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Benefit Card 2 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-s3v007ms">
                                    <div class="rounded-full bg-green-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-zzfva8xe">
                                        <svg class="w-8 h-8 text-green-600" fill="none" id="el-yj44986b"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" id="el-fnojtue7"
                                                stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-mshuziyj">
                                        Real-time Visibility
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-tojcqh68">
                                        Access real-time data and insights specific to your role across the entire
                                        supply chain.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-eowt57id">
                                        <li class="flex items-center" id="el-0bjn7yv7">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-uggggmx7" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-3od187nv">
                                                </path>
                                            </svg>
                                            <span id="el-y3tikrmg">
                                                Live inventory tracking
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-3o6i4ak9">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-bdapm1g4" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-r9l8xddw">
                                                </path>
                                            </svg>
                                            <span id="el-eqblkypc">
                                                Real-time alerts and notifications
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Benefit Card 3 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-tqlw17sl">
                                    <div class="rounded-full bg-purple-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-npw6kqfe">
                                        <svg class="w-8 h-8 text-purple-600" fill="none" id="el-taiiy4nn"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                                                id="el-046o7mfk" stroke-linecap="round" stroke-linejoin="round"
                                                stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-p33r6501">
                                        Seamless Collaboration
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-btlcvr14">
                                        Connect all stakeholders in one platform for better communication and fewer
                                        errors.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-hhslib9c">
                                        <li class="flex items-center" id="el-7rjifstm">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-n1ppecam" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-0r48yaxd">
                                                </path>
                                            </svg>
                                            <span id="el-r78d93va">
                                                Role-based permissions
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-j8qn9aex">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-mdtwvg62" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-a0ivg9dy">
                                                </path>
                                            </svg>
                                            <span id="el-o4wh6ten">
                                                Integrated messaging system
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Benefit Card 4 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-1w30antp">
                                    <div class="rounded-full bg-red-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-18srf444">
                                        <svg class="w-8 h-8 text-red-600" fill="none" id="el-esieo6io"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"
                                                id="el-8y6373x6" stroke-linecap="round" stroke-linejoin="round"
                                                stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-avcann5c">
                                        Data-Driven Insights
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-5qgwh0p7">
                                        Make informed decisions with advanced analytics customized for your role in the
                                        supply chain.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-nsgoh5qz">
                                        <li class="flex items-center" id="el-cvmw2w5f">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-3a22y4qk" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-uxjdepaz">
                                                </path>
                                            </svg>
                                            <span id="el-yn8ndeuw">
                                                Role-specific dashboards
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-9e24fqya">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-2s3onik3" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-e4dor75f">
                                                </path>
                                            </svg>
                                            <span id="el-oha0cxlg">
                                                Forecasting and trend analysis
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Benefit Card 5 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-3sxk4d7s">
                                    <div class="rounded-full bg-yellow-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-gk5w6hey">
                                        <svg class="w-8 h-8 text-yellow-600" fill="none" id="el-5v7ddo9r"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                                                id="el-9fvq8ldu" stroke-linecap="round" stroke-linejoin="round"
                                                stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-7hzrxker">
                                        Enhanced Security
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-4r16gzq3">
                                        Protect sensitive data with role-based access control and advanced security
                                        features.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-mbrnzz5o">
                                        <li class="flex items-center" id="el-we5uvsb1">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-2uorl4nk" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-2ucuebbm">
                                                </path>
                                            </svg>
                                            <span id="el-tq1299p1">
                                                Granular permission settings
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-1efsot9f">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-u977q4ki" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-1cymqjrm">
                                                </path>
                                            </svg>
                                            <span id="el-zj3xc4d6">
                                                Encryption and compliance features
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Benefit Card 6 -->
                                <div class="bg-white rounded-lg shadow-md p-6 transform transition duration-300 hover:shadow-xl"
                                    id="el-xezso4mn">
                                    <div class="rounded-full bg-indigo-100 p-3 w-16 h-16 flex items-center justify-center mb-6"
                                        id="el-mkpp3srs">
                                        <svg class="w-8 h-8 text-indigo-600" fill="none" id="el-q0uf7c3i"
                                            stroke="currentColor" viewbox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"
                                                id="el-pjvt5k9d" stroke-linecap="round" stroke-linejoin="round"
                                                stroke-width="2">
                                            </path>
                                        </svg>
                                    </div>
                                    <h3 class="text-xl font-semibold text-gray-900 mb-3" id="el-mj32irgf">
                                        Scalable Solution
                                    </h3>
                                    <p class="text-gray-600 mb-4" id="el-6izcbqur">
                                        Grow your business without outgrowing your supply chain management system.
                                    </p>
                                    <ul class="text-gray-600 space-y-2" id="el-wj2m9syy">
                                        <li class="flex items-center" id="el-vqjgprr8">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-8b912l0p" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-xgyaydpq">
                                                </path>
                                            </svg>
                                            <span id="el-273164t9">
                                                Modular architecture
                                            </span>
                                        </li>
                                        <li class="flex items-center" id="el-npyewpuy">
                                            <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor"
                                                id="el-8p5r9xfk" viewbox="0 0 20 20">
                                                <path clip-rule="evenodd"
                                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                    fill-rule="evenodd" id="el-7a6nruik">
                                                </path>
                                            </svg>
                                            <span id="el-k6e8oznz">
                                                API integrations with existing systems
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mt-16 text-center" id="el-7k121ysa">
                                <h3 class="text-2xl font-bold text-gray-900 mb-6" id="el-g6rdljmp">
                                    Ready to streamline your supply chain?
                                </h3>
                                <a class="inline-block bg-blue-600 text-white font-medium rounded-md px-8 py-3 shadow-md hover:bg-blue-700 hover:shadow-lg transition duration-300"
                                    href="#role-selection" id="el-snh2g10d">
                                    Choose Your Role
                                </a>
                            </div>
                        </div>
                    </section>
                </div>
            </element>
            <element data-section-id="8288132a-d894-432f-81f4-9e87c5d347a9" id="8288132a-d894-432f-81f4-9e87c5d347a9">
                <div id="root">
                </div>
            </element>
            <element data-section-id="9a26d83b-6a90-4b38-879e-7caa7da743d4" id="9a26d83b-6a90-4b38-879e-7caa7da743d4">
                <div id="root">
                </div>
            </element>
            <element data-section-id="08f0c32b-5ae4-4531-a282-1eac32d18603" id="08f0c32b-5ae4-4531-a282-1eac32d18603">
                <div id="root">
                </div>
            </element>
            <element data-section-id="010c6369-235f-45ea-96ea-4b9b996db42e" id="010c6369-235f-45ea-96ea-4b9b996db42e">
                <div id="root">
                    <section class="py-16 bg-gray-50" id="support">
                        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" id="el-x00yul5b">
                            <div class="text-center mb-12" id="el-iyj4b7hq">
                                <h2 class="text-3xl font-bold text-gray-900 sm:text-4xl mb-4" id="el-re3l97o8">
                                    Need Help Getting Started?
                                </h2>
                                <p class="text-xl text-gray-600 max-w-3xl mx-auto" id="el-kb7m75im">
                                    Our support team is ready to assist with your role-specific needs.
                                </p>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-16" id="el-gaohe58m">
                                <!-- Support Card 1 -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden" id="el-oi2vf6mu">
                                    <div class="p-8" id="el-jvxy6dsx">
                                        <div class="flex items-center justify-center mb-6" id="el-ebft34v2">
                                            <div class="rounded-full bg-blue-100 p-4" id="el-r80qr80a">
                                                <svg class="w-8 h-8 text-blue-600" fill="none" id="el-kzp8gucx"
                                                    stroke="currentColor" viewbox="0 0 24 24"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                                                        id="el-vh5x351c" stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2">
                                                    </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-3"
                                            id="el-3ku9e8ix">
                                            Email Support
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-vrii4ya8">
                                            Get answers to all your questions within 24 hours from our specialized
                                            support team.
                                        </p>
                                        <div class="flex justify-center" id="el-29y5rofs">
                                            <a class="inline-flex items-center text-blue-600 font-medium hover:text-blue-800"
                                                href="mailto:support@supplychain.com" id="el-l0pnzjso">
                                                Email Us Now
                                                <svg class="ml-2 w-5 h-5" fill="currentColor" id="el-ufkrpik8"
                                                    viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z"
                                                        fill-rule="evenodd" id="el-nucs9duk">
                                                    </path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Support Card 2 -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden" id="el-npkngnr9">
                                    <div class="p-8" id="el-djgq7t96">
                                        <div class="flex items-center justify-center mb-6" id="el-ded5lsz5">
                                            <div class="rounded-full bg-green-100 p-4" id="el-4xvi0yx4">
                                                <svg class="w-8 h-8 text-green-600" fill="none" id="el-s1hh510r"
                                                    stroke="currentColor" viewbox="0 0 24 24"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"
                                                        id="el-2gud99az" stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2">
                                                    </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-3"
                                            id="el-rbzk506l">
                                            Live Chat
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-5joshc9e">
                                            Connect instantly with our support agents for real-time assistance during
                                            business hours.
                                        </p>
                                        <div class="flex justify-center" id="el-s637yiro">
                                            <button
                                                class="inline-flex items-center text-green-600 font-medium hover:text-green-800"
                                                id="el-ovu3xzv3">
                                                Start Chat
                                                <svg class="ml-2 w-5 h-5" fill="currentColor" id="el-jevb5avh"
                                                    viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z"
                                                        fill-rule="evenodd" id="el-oarrlfm6">
                                                    </path>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Support Card 3 -->
                                <div class="bg-white rounded-xl shadow-md overflow-hidden" id="el-fhbcwffh">
                                    <div class="p-8" id="el-sr88u2at">
                                        <div class="flex items-center justify-center mb-6" id="el-25m1s7pm">
                                            <div class="rounded-full bg-purple-100 p-4" id="el-ln7iv284">
                                                <svg class="w-8 h-8 text-purple-600" fill="none" id="el-8kqwmyoa"
                                                    stroke="currentColor" viewbox="0 0 24 24"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
                                                        id="el-7tbrqkjc" stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2">
                                                    </path>
                                                </svg>
                                            </div>
                                        </div>
                                        <h3 class="text-xl font-semibold text-gray-900 text-center mb-3"
                                            id="el-lpi2nnoq">
                                            Knowledge Base
                                        </h3>
                                        <p class="text-gray-600 text-center mb-6" id="el-v4tcm5r8">
                                            Browse our comprehensive guides and tutorials specific to each role in the
                                            system.
                                        </p>
                                        <div class="flex justify-center" id="el-b6q7hhji">
                                            <a class="inline-flex items-center text-purple-600 font-medium hover:text-purple-800"
                                                href="#" id="el-awgqngqi">
                                                Explore Resources
                                                <svg class="ml-2 w-5 h-5" fill="currentColor" id="el-9mlvau6o"
                                                    viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z"
                                                        fill-rule="evenodd" id="el-yet4sthl">
                                                    </path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Role-based Support -->
                            <div class="bg-white rounded-xl shadow-lg p-8 mb-16" id="el-p5cbkdo2">
                                <h3 class="text-2xl font-semibold text-gray-900 mb-8 text-center" id="el-qc338pam">
                                    Role-Specific Support
                                </h3>
                                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6" id="el-wrgrmuks">
                                    <!-- Support Group 1 -->
                                    <div id="el-f8yshmll">
                                        <h4 class="text-lg font-medium text-gray-900 mb-4" id="el-xuq1xm9s">
                                            Supplier &amp; Manufacturer
                                        </h4>
                                        <ul class="space-y-3 text-gray-600" id="el-urcvb6ye">
                                            <li class="flex items-start" id="el-io976wac">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-mjqtjrxf" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-361c4p24">
                                                    </path>
                                                </svg>
                                                <span id="el-ph7hpn1p">
                                                    Inventory management
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-k0i2ewh8">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-0pjola7d" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-mp0rangg">
                                                    </path>
                                                </svg>
                                                <span id="el-qa2aifiy">
                                                    Production planning
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-qi54mmcx">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-xdrhu476" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-ose7tcbb">
                                                    </path>
                                                </svg>
                                                <span id="el-wzuzo8mv">
                                                    Quality control
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Support Group 2 -->
                                    <div id="el-3irlr26g">
                                        <h4 class="text-lg font-medium text-gray-900 mb-4" id="el-qwquwj9f">
                                            Warehouse &amp; Transport
                                        </h4>
                                        <ul class="space-y-3 text-gray-600" id="el-ns4bmkks">
                                            <li class="flex items-start" id="el-xw9299hy">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-rkj7qish" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-9julb30s">
                                                    </path>
                                                </svg>
                                                <span id="el-zdg1nud6">
                                                    Storage optimization
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-d1yt7j7e">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-erklrx80" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-7opf2l4a">
                                                    </path>
                                                </svg>
                                                <span id="el-mpv5p1qk">
                                                    Route planning
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-846rmw32">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-k76g5n8s" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-wqr3w2fq">
                                                    </path>
                                                </svg>
                                                <span id="el-in1m2a3i">
                                                    Shipment tracking
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Support Group 3 -->
                                    <div id="el-8w3vkq1l">
                                        <h4 class="text-lg font-medium text-gray-900 mb-4" id="el-2u9smpys">
                                            Retail &amp; Wholesale
                                        </h4>
                                        <ul class="space-y-3 text-gray-600" id="el-xikhfhr5">
                                            <li class="flex items-start" id="el-4xm36xq5">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-wjzhrb0t" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-8kwdisd3">
                                                    </path>
                                                </svg>
                                                <span id="el-orxxglg3">
                                                    Order management
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-2vpf3yi2">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-cuaxrfdb" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-k70h1o1c">
                                                    </path>
                                                </svg>
                                                <span id="el-yzf9yy3t">
                                                    POS integration
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-2v9cext2">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-9q9jxb7z" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-dvyxgli6">
                                                    </path>
                                                </svg>
                                                <span id="el-ou05icjj">
                                                    Pricing strategies
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Support Group 4 -->
                                    <div id="el-z2dfohsx">
                                        <h4 class="text-lg font-medium text-gray-900 mb-4" id="el-gvxhgu50">
                                            Accounting &amp; Admin
                                        </h4>
                                        <ul class="space-y-3 text-gray-600" id="el-pxfdntlp">
                                            <li class="flex items-start" id="el-npkck920">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-vr4ycfb8" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-av3ga1sr">
                                                    </path>
                                                </svg>
                                                <span id="el-incprmi5">
                                                    Financial reporting
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-j0eu33sv">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-q26qpyj0" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-1e1fzkzo">
                                                    </path>
                                                </svg>
                                                <span id="el-o9j3vxaj">
                                                    User permissions
                                                </span>
                                            </li>
                                            <li class="flex items-start" id="el-p3mf9oyn">
                                                <svg class="w-5 h-5 text-green-500 mt-0.5 mr-2" fill="currentColor"
                                                    id="el-13n5604l" viewbox="0 0 20 20">
                                                    <path clip-rule="evenodd"
                                                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                                                        fill-rule="evenodd" id="el-i8b2zfwy">
                                                    </path>
                                                </svg>
                                                <span id="el-95z53aa5">
                                                    System configuration
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- Support Contact Form -->
                            <div class="bg-white rounded-xl shadow-lg overflow-hidden" id="el-fh07q787">
                                <div class="md:flex" id="el-x0u2wqkv">
                                    <div class="md:w-1/2 bg-blue-600 p-10 text-white flex items-center"
                                        id="el-smj47v5b">
                                        <div id="el-f9tjjrqr">
                                            <h3 class="text-2xl font-bold mb-4" id="el-28qa4y09">
                                                Get Personalized Support
                                            </h3>
                                            <p class="mb-6" id="el-iv919cdm">
                                                Our team of experts is ready to help you with any questions about your
                                                specific role in the supply chain.
                                            </p>
                                            <ul class="space-y-4" id="el-3pwhfzqe">
                                                <li class="flex items-start" id="el-l1erc2jx">
                                                    <svg class="w-6 h-6 mr-3 mt-0.5" fill="none" id="el-rndvubti"
                                                        stroke="currentColor" viewbox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
                                                            id="el-pzsjuw10" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2">
                                                        </path>
                                                    </svg>
                                                    <span id="el-h4ip6s1r">
                                                        +1 (555) 123-4567
                                                    </span>
                                                </li>
                                                <li class="flex items-start" id="el-h3uaxr9p">
                                                    <svg class="w-6 h-6 mr-3 mt-0.5" fill="none" id="el-hv3yjuyk"
                                                        stroke="currentColor" viewbox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                                                            id="el-z0sfxkcw" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2">
                                                        </path>
                                                    </svg>
                                                    <span id="el-0fbgp14u">
                                                        support@supplychain.com
                                                    </span>
                                                </li>
                                                <li class="flex items-start" id="el-koextbof">
                                                    <svg class="w-6 h-6 mr-3 mt-0.5" fill="none" id="el-5j9ievq1"
                                                        stroke="currentColor" viewbox="0 0 24 24"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                                            id="el-i1s2ubvp" stroke-linecap="round"
                                                            stroke-linejoin="round" stroke-width="2">
                                                        </path>
                                                        <path d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" id="el-uawbhfdq"
                                                            stroke-linecap="round" stroke-linejoin="round"
                                                            stroke-width="2">
                                                        </path>
                                                    </svg>
                                                    <span id="el-c2jvssh9">
                                                        123 Supply Chain Ave, Suite 400
                                                        <br id="el-6q7n6mnq" />
                                                        San Francisco, CA 94107
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="md:w-1/2 p-10" id="el-ghfqutlc">
                                        <h3 class="text-2xl font-bold text-gray-900 mb-6" id="el-020mmb4e">
                                            Contact Us
                                        </h3>
                                        <form id="el-u5elp1on">
                                            <div class="mb-4" id="el-hu52kfez">
                                                <label class="block text-sm font-medium text-gray-700 mb-1" for="name"
                                                    id="el-6oxznwi5">
                                                    Name
                                                </label>
                                                <input
                                                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"
                                                    id="name" name="name" placeholder="Your name" type="text" />
                                            </div>
                                            <div class="mb-4" id="el-1z7hqgux">
                                                <label class="block text-sm font-medium text-gray-700 mb-1" for="email"
                                                    id="el-82suhpoj">
                                                    Email
                                                </label>
                                                <input
                                                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"
                                                    id="email" name="email" placeholder="Your email" type="email" />
                                            </div>
                                            <div class="mb-4" id="el-08nq3lkq">
                                                <label class="block text-sm font-medium text-gray-700 mb-1" for="role"
                                                    id="el-uq7o5r68">
                                                    Your Role
                                                </label>
                                                <select
                                                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"
                                                    id="role" name="role">
                                                    <option id="el-knk4c75f" value="">
                                                        Select your role
                                                    </option>
                                                    <option id="el-erlfo9s7" value="supplier">
                                                        Supplier
                                                    </option>
                                                    <option id="el-g5m7o8ff" value="manufacturer">
                                                        Manufacturer
                                                    </option>
                                                    <option id="el-13oe7x2t" value="warehouse">
                                                        Warehouse Manager
                                                    </option>
                                                    <option id="el-hgi7pmv0" value="transporter">
                                                        Transporter
                                                    </option>
                                                    <option id="el-06fwifi1" value="wholesaler">
                                                        Wholesaler
                                                    </option>
                                                    <option id="el-6blfqvhq" value="retailer">
                                                        Retailer
                                                    </option>
                                                    <option id="el-9wo9g096" value="accountant">
                                                        Accountant
                                                    </option>
                                                    <option id="el-36evc5rl" value="other">
                                                        Other
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="mb-6" id="el-5vycwx5f">
                                                <label class="block text-sm font-medium text-gray-700 mb-1"
                                                    for="message" id="el-9xmng9s3">
                                                    Message
                                                </label>
                                                <textarea
                                                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"
                                                    id="message" name="message" placeholder="How can we help you?"
                                                    rows="4"></textarea>
                                            </div>
                                            <button
                                                class="w-full bg-blue-600 text-white font-medium py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                                                id="el-0c02tun3" type="submit">
                                                Send Message
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </element>
            <element data-section-id="cd6406c6-32f0-497a-9991-1509cb07f60b" id="cd6406c6-32f0-497a-9991-1509cb07f60b">
                <div id="root">
                    <footer class="bg-gray-800 text-white pt-16 pb-8" id="footer">
                        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" id="el-7vekcm3m">
                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-12" id="el-0j21hxpq">
                                <!-- Column 1: About -->
                                <div id="el-5scy6ro3">
                                    <h3 class="text-xl font-semibold mb-4" id="el-ivkmaaf7">
                                        Supply Chain Portal
                                    </h3>
                                    <p class="text-gray-300 mb-4" id="el-q3l08emy">
                                        Streamlining multi-role access for complete supply chain management in one
                                        powerful platform.
                                    </p>
                                    <div class="flex space-x-4" id="el-fe9m1w45">
                                        <a class="text-gray-300 hover:text-white" href="#" id="el-4fpmtbnn">
                                            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" id="el-pmh2ylch"
                                                viewbox="0 0 24 24">
                                                <path clip-rule="evenodd"
                                                    d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                                                    fill-rule="evenodd" id="el-zpptmve3">
                                                </path>
                                            </svg>
                                        </a>
                                        <a class="text-gray-300 hover:text-white" href="#" id="el-nv6hny25">
                                            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" id="el-f1z4vcxt"
                                                viewbox="0 0 24 24">
                                                <path
                                                    d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"
                                                    id="el-cxv1ad3h">
                                                </path>
                                            </svg>
                                        </a>
                                        <a class="text-gray-300 hover:text-white" href="#" id="el-oif7ky03">
                                            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" id="el-9thig089"
                                                viewbox="0 0 24 24">
                                                <path clip-rule="evenodd"
                                                    d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                                                    fill-rule="evenodd" id="el-oxfwvy6s">
                                                </path>
                                            </svg>
                                        </a>
                                        <a class="text-gray-300 hover:text-white" href="#" id="el-43ay3my0">
                                            <svg aria-hidden="true" class="w-6 h-6" fill="currentColor" id="el-yarfk7o4"
                                                viewbox="0 0 24 24">
                                                <path clip-rule="evenodd"
                                                    d="M19.812 5.418c.861.23 1.538.907 1.768 1.768C21.998 8.746 22 12 22 12s0 3.255-.418 4.814a2.504 2.504 0 0 1-1.768 1.768c-1.56.419-7.814.419-7.814.419s-6.255 0-7.814-.419a2.505 2.505 0 0 1-1.768-1.768C2 15.255 2 12 2 12s0-3.255.417-4.814a2.507 2.507 0 0 1 1.768-1.768C5.744 5 11.998 5 11.998 5s6.255 0 7.814.418ZM15.194 12 10 15V9l5.194 3Z"
                                                    fill-rule="evenodd" id="el-xrvtbdcn">
                                                </path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                                <!-- Column 2: Quick Links -->
                                <div id="el-85htut56">
                                    <h3 class="text-xl font-semibold mb-4" id="el-o20ud971">
                                        Quick Links
                                    </h3>
                                    <ul class="space-y-2" id="el-y9jw70ka">
                                        <li id="el-pmz1bmeu">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-083hw0gk">
                                                Home
                                            </a>
                                        </li>
                                        <li id="el-wqmrwxz9">
                                            <a class="text-gray-300 hover:text-white" href="#features" id="el-pi392jje">
                                                Features
                                            </a>
                                        </li>
                                        <li id="el-pj62k0vb">
                                            <a class="text-gray-300 hover:text-white" href="#role-selection"
                                                id="el-x9i67lw5">
                                                Role Selection
                                            </a>
                                        </li>
                                        <li id="el-z86xa3mp">
                                            <a class="text-gray-300 hover:text-white" href="#benefits" id="el-zayzefa7">
                                                Benefits
                                            </a>
                                        </li>
                                        <li id="el-ji9vn5lx">
                                            <a class="text-gray-300 hover:text-white" href="#support" id="el-x6mpy31x">
                                                Support
                                            </a>
                                        </li>
                                        <li id="el-rbhg44sj">
                                            <a class="text-gray-300 hover:text-white" href="#faq" id="el-m9p0044z">
                                                FAQ
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Column 3: User Roles -->
                                <div id="el-15611hqc">
                                    <h3 class="text-xl font-semibold mb-4" id="el-4u1eqlby">
                                        User Roles
                                    </h3>
                                    <ul class="space-y-2" id="el-hxsbfjf6">
                                        <li id="el-jyoc9sah">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-rsfo0ap3">
                                                Supplier
                                            </a>
                                        </li>
                                        <li id="el-0gnt0gsm">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-oj05zt7j">
                                                Manufacturer
                                            </a>
                                        </li>
                                        <li id="el-bph5ol8o">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-gnbcjm7h">
                                                Warehouse Manager
                                            </a>
                                        </li>
                                        <li id="el-tgcojd3r">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-c8zbdr23">
                                                Transporter
                                            </a>
                                        </li>
                                        <li id="el-3v94h2fa">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-9ak71r2t">
                                                Wholesaler
                                            </a>
                                        </li>
                                        <li id="el-mam9ys9d">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-l6banq91">
                                                Retailer
                                            </a>
                                        </li>
                                        <li id="el-0axosz26">
                                            <a class="text-gray-300 hover:text-white" href="#" id="el-bg3rqmqp">
                                                Accountant
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- Column 4: Contact Info -->
                                <div id="el-quju7y77">
                                    <h3 class="text-xl font-semibold mb-4" id="el-yxfpg5y5">
                                        Contact Us
                                    </h3>
                                    <ul class="space-y-3" id="el-1iketkyf">
                                        <li class="flex items-start" id="el-haaqjclv">
                                            <svg class="w-5 h-5 text-blue-400 mt-1 mr-3" fill="none" id="el-pi1hhbq9"
                                                stroke="currentColor" viewbox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                                    id="el-xo52g2bq" stroke-linecap="round" stroke-linejoin="round"
                                                    stroke-width="2">
                                                </path>
                                                <path d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" id="el-ji41ns20"
                                                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                </path>
                                            </svg>
                                            <span class="text-gray-300" id="el-wqvcar8i">
                                                123 Supply Chain Ave, Suite 400
                                                <br id="el-s3cxnu0e" />
                                                San Francisco, CA 94107
                                            </span>
                                        </li>
                                        <li class="flex items-start" id="el-17rblesk">
                                            <svg class="w-5 h-5 text-blue-400 mt-1 mr-3" fill="none" id="el-2d7zjnml"
                                                stroke="currentColor" viewbox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
                                                    id="el-xpkvimzz" stroke-linecap="round" stroke-linejoin="round"
                                                    stroke-width="2">
                                                </path>
                                            </svg>
                                            <span class="text-gray-300" id="el-sgw7yjqg">
                                                +1 (555) 123-4567
                                            </span>
                                        </li>
                                        <li class="flex items-start" id="el-ntd2qpmh">
                                            <svg class="w-5 h-5 text-blue-400 mt-1 mr-3" fill="none" id="el-qg94wscv"
                                                stroke="currentColor" viewbox="0 0 24 24"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                                                    id="el-5rx0d5ci" stroke-linecap="round" stroke-linejoin="round"
                                                    stroke-width="2">
                                                </path>
                                            </svg>
                                            <span class="text-gray-300" id="el-h76ov9js">
                                                info@supplychain.com
                                            </span>
                                        </li>
                                    </ul>
                                    <div class="mt-6" id="el-0h3uv9u1">
                                        <h4 class="text-lg font-medium mb-2" id="el-k0s2rzvu">
                                            Subscribe to Updates
                                        </h4>
                                        <form class="flex" id="el-ms5gvjd9">
                                            <input
                                                class="px-4 py-2 w-full text-gray-900 rounded-l-md focus:outline-none"
                                                id="el-ylblhqla" placeholder="Your email" type="email" />
                                            <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 rounded-r-md"
                                                id="el-e986mziz" type="submit">
                                                Subscribe
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Divider -->
                            <div class="border-t border-gray-700 pt-8 mt-8" id="el-1crz7vfx">
                                <div class="flex flex-col md:flex-row justify-between items-center" id="el-z8k1lpei">
                                    <p class="text-gray-400 text-center md:text-left mb-4 md:mb-0" id="el-1qdq6mjr">
                                        © 2023 Supply Chain Portal. All rights reserved.
                                    </p>
                                    <div class="flex space-x-6" id="el-ky7cbg85">
                                        <a class="text-gray-400 hover:text-white" href="#" id="el-y1513rwy">
                                            Privacy Policy
                                        </a>
                                        <a class="text-gray-400 hover:text-white" href="#" id="el-9c9xkm4c">
                                            Terms of Service
                                        </a>
                                        <a class="text-gray-400 hover:text-white" href="#" id="el-pg7x2gjh">
                                            Cookie Policy
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </element>
        </div>
    </main>
    <!-- {bodyScripts} -->
</body>

</html>