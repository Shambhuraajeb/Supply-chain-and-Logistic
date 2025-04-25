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
<%@ page import="java.sql.*, java.util.*, com.scm.db.PostgresConnection" %>
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
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Montserrat:wght@400;500;600;700&amp;display=swap"
        as="style">

    <!-- {headerScripts} -->

    <!-- Core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Utilities and Components -->
    <script defer="" src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.3/cdn.min.js"></script>
    <script defer="" src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.45.1/apexcharts.min.js"></script>

    <!-- Optimized Font Loading -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Montserrat:wght@400;500;600;700&amp;display=swap"
        rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">

    <!-- Base Styles -->
    <style>
        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 0px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #666;
        }

        /* Remove tap highlight on mobile */
        * {
            -webkit-tap-highlight-color: transparent;
        }

        /* Improve text rendering */
        body {
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Focus outline styles */
        :focus-visible {
            outline: 2px solid currentColor;
            outline-offset: 2px;
        }

        /* Print styles */
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

            // Watch for dynamically added images
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

        // Performance monitoring
        if ('performance' in window && 'PerformanceObserver' in window) {
            // Create performance observer
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

            // Observe performance metrics
            observer.observe({ entryTypes: ['largest-contentful-paint', 'first-input', 'layout-shift'] });

            // Log basic performance metrics
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

        // Handle offline/online status
        window.addEventListener('online', () => {
            document.body.classList.remove('offline');
            console.log('Connection restored');
        });

        window.addEventListener('offline', () => {
            document.body.classList.add('offline');
            console.log('Connection lost');
        });
    </script>
    <style>
        *,
        ::before,
        ::after {
            --tw-border-spacing-x: 0;
            --tw-border-spacing-y: 0;
            --tw-translate-x: 0;
            --tw-translate-y: 0;
            --tw-rotate: 0;
            --tw-skew-x: 0;
            --tw-skew-y: 0;
            --tw-scale-x: 1;
            --tw-scale-y: 1;
            --tw-pan-x: ;
            --tw-pan-y: ;
            --tw-pinch-zoom: ;
            --tw-scroll-snap-strictness: proximity;
            --tw-gradient-from-position: ;
            --tw-gradient-via-position: ;
            --tw-gradient-to-position: ;
            --tw-ordinal: ;
            --tw-slashed-zero: ;
            --tw-numeric-figure: ;
            --tw-numeric-spacing: ;
            --tw-numeric-fraction: ;
            --tw-ring-inset: ;
            --tw-ring-offset-width: 0px;
            --tw-ring-offset-color: #fff;
            --tw-ring-color: rgb(59 130 246 / 0.5);
            --tw-ring-offset-shadow: 0 0 #0000;
            --tw-ring-shadow: 0 0 #0000;
            --tw-shadow: 0 0 #0000;
            --tw-shadow-colored: 0 0 #0000;
            --tw-blur: ;
            --tw-brightness: ;
            --tw-contrast: ;
            --tw-grayscale: ;
            --tw-hue-rotate: ;
            --tw-invert: ;
            --tw-saturate: ;
            --tw-sepia: ;
            --tw-drop-shadow: ;
            --tw-backdrop-blur: ;
            --tw-backdrop-brightness: ;
            --tw-backdrop-contrast: ;
            --tw-backdrop-grayscale: ;
            --tw-backdrop-hue-rotate: ;
            --tw-backdrop-invert: ;
            --tw-backdrop-opacity: ;
            --tw-backdrop-saturate: ;
            --tw-backdrop-sepia: ;
            --tw-contain-size: ;
            --tw-contain-layout: ;
            --tw-contain-paint: ;
            --tw-contain-style:
        }

        ::backdrop {
            --tw-border-spacing-x: 0;
            --tw-border-spacing-y: 0;
            --tw-translate-x: 0;
            --tw-translate-y: 0;
            --tw-rotate: 0;
            --tw-skew-x: 0;
            --tw-skew-y: 0;
            --tw-scale-x: 1;
            --tw-scale-y: 1;
            --tw-pan-x: ;
            --tw-pan-y: ;
            --tw-pinch-zoom: ;
            --tw-scroll-snap-strictness: proximity;
            --tw-gradient-from-position: ;
            --tw-gradient-via-position: ;
            --tw-gradient-to-position: ;
            --tw-ordinal: ;
            --tw-slashed-zero: ;
            --tw-numeric-figure: ;
            --tw-numeric-spacing: ;
            --tw-numeric-fraction: ;
            --tw-ring-inset: ;
            --tw-ring-offset-width: 0px;
            --tw-ring-offset-color: #fff;
            --tw-ring-color: rgb(59 130 246 / 0.5);
            --tw-ring-offset-shadow: 0 0 #0000;
            --tw-ring-shadow: 0 0 #0000;
            --tw-shadow: 0 0 #0000;
            --tw-shadow-colored: 0 0 #0000;
            --tw-blur: ;
            --tw-brightness: ;
            --tw-contrast: ;
            --tw-grayscale: ;
            --tw-hue-rotate: ;
            --tw-invert: ;
            --tw-saturate: ;
            --tw-sepia: ;
            --tw-drop-shadow: ;
            --tw-backdrop-blur: ;
            --tw-backdrop-brightness: ;
            --tw-backdrop-contrast: ;
            --tw-backdrop-grayscale: ;
            --tw-backdrop-hue-rotate: ;
            --tw-backdrop-invert: ;
            --tw-backdrop-opacity: ;
            --tw-backdrop-saturate: ;
            --tw-backdrop-sepia: ;
            --tw-contain-size: ;
            --tw-contain-layout: ;
            --tw-contain-paint: ;
            --tw-contain-style:
        }

        /* ! tailwindcss v3.4.16 | MIT License | https://tailwindcss.com */
        *,
        ::after,
        ::before {
            box-sizing: border-box;
            border-width: 0;
            border-style: solid;
            border-color: #e5e7eb
        }

        ::after,
        ::before {
            --tw-content: ''
        }

        :host,
        html {
            line-height: 1.5;
            -webkit-text-size-adjust: 100%;
            -moz-tab-size: 4;
            tab-size: 4;
            font-family: Inter, system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif;
            font-feature-settings: normal;
            font-variation-settings: normal;
            -webkit-tap-highlight-color: transparent
        }

        body {
            margin: 0;
            line-height: inherit
        }

        hr {
            height: 0;
            color: inherit;
            border-top-width: 1px
        }

        abbr:where([title]) {
            -webkit-text-decoration: underline dotted;
            text-decoration: underline dotted
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-size: inherit;
            font-weight: inherit
        }

        a {
            color: inherit;
            text-decoration: inherit
        }

        b,
        strong {
            font-weight: bolder
        }

        code,
        kbd,
        pre,
        samp {
            font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
            font-feature-settings: normal;
            font-variation-settings: normal;
            font-size: 1em
        }

        small {
            font-size: 80%
        }

        sub,
        sup {
            font-size: 75%;
            line-height: 0;
            position: relative;
            vertical-align: baseline
        }

        sub {
            bottom: -.25em
        }

        sup {
            top: -.5em
        }

        table {
            text-indent: 0;
            border-color: inherit;
            border-collapse: collapse
        }

        button,
        input,
        optgroup,
        select,
        textarea {
            font-family: inherit;
            font-feature-settings: inherit;
            font-variation-settings: inherit;
            font-size: 100%;
            font-weight: inherit;
            line-height: inherit;
            letter-spacing: inherit;
            color: inherit;
            margin: 0;
            padding: 0
        }

        button,
        select {
            text-transform: none
        }

        button,
        input:where([type=button]),
        input:where([type=reset]),
        input:where([type=submit]) {
            -webkit-appearance: button;
            background-color: transparent;
            background-image: none
        }

        :-moz-focusring {
            outline: auto
        }

        :-moz-ui-invalid {
            box-shadow: none
        }

        progress {
            vertical-align: baseline
        }

        ::-webkit-inner-spin-button,
        ::-webkit-outer-spin-button {
            height: auto
        }

        [type=search] {
            -webkit-appearance: textfield;
            outline-offset: -2px
        }

        ::-webkit-search-decoration {
            -webkit-appearance: none
        }

        ::-webkit-file-upload-button {
            -webkit-appearance: button;
            font: inherit
        }

        summary {
            display: list-item
        }

        blockquote,
        dd,
        dl,
        figure,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        hr,
        p,
        pre {
            margin: 0
        }

        fieldset {
            margin: 0;
            padding: 0
        }

        legend {
            padding: 0
        }

        menu,
        ol,
        ul {
            list-style: none;
            margin: 0;
            padding: 0
        }

        dialog {
            padding: 0
        }

        textarea {
            resize: vertical
        }

        input::placeholder,
        textarea::placeholder {
            opacity: 1;
            color: #9ca3af
        }

        [role=button],
        button {
            cursor: pointer
        }

        :disabled {
            cursor: default
        }

        audio,
        canvas,
        embed,
        iframe,
        img,
        object,
        svg,
        video {
            display: block;
            vertical-align: middle
        }

        img,
        video {
            max-width: 100%;
            height: auto
        }

        [hidden]:where(:not([hidden=until-found])) {
            display: none
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border-width: 0
        }

        .fixed {
            position: fixed
        }

        .absolute {
            position: absolute
        }

        .relative {
            position: relative
        }

        .sticky {
            position: sticky
        }

        .inset-0 {
            inset: 0px
        }

        .inset-y-0 {
            top: 0px;
            bottom: 0px
        }

        .bottom-0 {
            bottom: 0px
        }

        .left-0 {
            left: 0px
        }

        .right-4 {
            right: 1rem
        }

        .top-0 {
            top: 0px
        }

        .top-4 {
            top: 1rem
        }

        .z-50 {
            z-index: 50
        }

        .z-30 {
            z-index: 30
        }

        .z-40 {
            z-index: 40
        }

        .ml-0 {
            margin-left: 0px
        }

        .ml-3 {
            margin-left: 0.75rem
        }

        .mr-3 {
            margin-right: 0.75rem
        }

        .mb-1 {
            margin-bottom: 0.25rem
        }

        .mb-2 {
            margin-bottom: 0.5rem
        }

        .mb-4 {
            margin-bottom: 1rem
        }

        .mb-6 {
            margin-bottom: 1.5rem
        }

        .mr-2 {
            margin-right: 0.5rem
        }

        .mt-2 {
            margin-top: 0.5rem
        }

        .mt-6 {
            margin-top: 1.5rem
        }

        .flex {
            display: flex
        }

        .inline-flex {
            display: inline-flex
        }

        .grid {
            display: grid
        }

        .hidden {
            display: none
        }

        .h-16 {
            height: 4rem
        }

        .h-5 {
            height: 1.25rem
        }

        .h-6 {
            height: 1.5rem
        }

        .h-8 {
            height: 2rem
        }

        .h-screen {
            height: 100vh
        }

        .h-2 {
            height: 0.5rem
        }

        .h-3 {
            height: 0.75rem
        }

        .min-h-screen {
            min-height: 100vh
        }

        .w-5 {
            width: 1.25rem
        }

        .w-6 {
            width: 1.5rem
        }

        .w-64 {
            width: 16rem
        }

        .w-8 {
            width: 2rem
        }

        .w-full {
            width: 100%
        }

        .w-24 {
            width: 6rem
        }

        .w-3 {
            width: 0.75rem
        }

        .min-w-full {
            min-width: 100%
        }

        .flex-1 {
            flex: 1 1 0%
        }

        .flex-shrink-0 {
            flex-shrink: 0
        }

        .grid-cols-1 {
            grid-template-columns: repeat(1, minmax(0, 1fr))
        }

        .flex-col {
            flex-direction: column
        }

        .items-center {
            align-items: center
        }

        .justify-center {
            justify-content: center
        }

        .justify-between {
            justify-content: space-between
        }

        .gap-4 {
            gap: 1rem
        }

        .gap-6 {
            gap: 1.5rem
        }

        .space-x-2> :not([hidden])~ :not([hidden]) {
            --tw-space-x-reverse: 0;
            margin-right: calc(0.5rem * var(--tw-space-x-reverse));
            margin-left: calc(0.5rem * calc(1 - var(--tw-space-x-reverse)))
        }

        .space-y-4> :not([hidden])~ :not([hidden]) {
            --tw-space-y-reverse: 0;
            margin-top: calc(1rem * calc(1 - var(--tw-space-y-reverse)));
            margin-bottom: calc(1rem * var(--tw-space-y-reverse))
        }

        .space-y-6> :not([hidden])~ :not([hidden]) {
            --tw-space-y-reverse: 0;
            margin-top: calc(1.5rem * calc(1 - var(--tw-space-y-reverse)));
            margin-bottom: calc(1.5rem * var(--tw-space-y-reverse))
        }

        .divide-y> :not([hidden])~ :not([hidden]) {
            --tw-divide-y-reverse: 0;
            border-top-width: calc(1px * calc(1 - var(--tw-divide-y-reverse)));
            border-bottom-width: calc(1px * var(--tw-divide-y-reverse))
        }

        .divide-gray-200> :not([hidden])~ :not([hidden]) {
            --tw-divide-opacity: 1;
            border-color: rgb(229 231 235 / var(--tw-divide-opacity, 1))
        }

        .overflow-x-auto {
            overflow-x: auto
        }

        .overflow-y-auto {
            overflow-y: auto
        }

        .scroll-smooth {
            scroll-behavior: smooth
        }

        .whitespace-nowrap {
            white-space: nowrap
        }

        .rounded-full {
            border-radius: 9999px
        }

        .rounded-lg {
            border-radius: 0.5rem
        }

        .border {
            border-width: 1px
        }

        .border-b {
            border-bottom-width: 1px
        }

        .border-r {
            border-right-width: 1px
        }

        .border-t {
            border-top-width: 1px
        }

        .border-gray-200 {
            --tw-border-opacity: 1;
            border-color: rgb(229 231 235 / var(--tw-border-opacity, 1))
        }

        .border-red-200 {
            --tw-border-opacity: 1;
            border-color: rgb(254 202 202 / var(--tw-border-opacity, 1))
        }

        .border-yellow-200 {
            --tw-border-opacity: 1;
            border-color: rgb(254 240 138 / var(--tw-border-opacity, 1))
        }

        .bg-white {
            --tw-bg-opacity: 1;
            background-color: rgb(255 255 255 / var(--tw-bg-opacity, 1))
        }

        .bg-gray-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(243 244 246 / var(--tw-bg-opacity, 1))
        }

        .bg-gray-800\/80 {
            background-color: rgb(31 41 55 / 0.8)
        }

        .bg-blue-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(219 234 254 / var(--tw-bg-opacity, 1))
        }

        .bg-blue-50 {
            --tw-bg-opacity: 1;
            background-color: rgb(239 246 255 / var(--tw-bg-opacity, 1))
        }

        .bg-blue-500 {
            --tw-bg-opacity: 1;
            background-color: rgb(59 130 246 / var(--tw-bg-opacity, 1))
        }

        .bg-gray-200 {
            --tw-bg-opacity: 1;
            background-color: rgb(229 231 235 / var(--tw-bg-opacity, 1))
        }

        .bg-gray-50 {
            --tw-bg-opacity: 1;
            background-color: rgb(249 250 251 / var(--tw-bg-opacity, 1))
        }

        .bg-green-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(220 252 231 / var(--tw-bg-opacity, 1))
        }

        .bg-green-500 {
            --tw-bg-opacity: 1;
            background-color: rgb(34 197 94 / var(--tw-bg-opacity, 1))
        }

        .bg-purple-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(243 232 255 / var (--tw-bg-opacity, 1))
        }

        .bg-red-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(254 226 226 / var(--tw-bg-opacity, 1))
        }

        .bg-red-50 {
            --tw-bg-opacity: 1;
            background-color: rgb(254 242 242 / var(--tw-bg-opacity, 1))
        }

        .bg-red-500 {
            --tw-bg-opacity: 1;
            background-color: rgb(239 68 68 / var(--tw-bg-opacity, 1))
        }

        .bg-yellow-100 {
            --tw-bg-opacity: 1;
            background-color: rgb(254 249 195 / var(--tw-bg-opacity, 1))
        }

        .bg-yellow-50 {
            --tw-bg-opacity: 1;
            background-color: rgb(254 252 232 / var(--tw-bg-opacity, 1))
        }

        .bg-yellow-500 {
            --tw-bg-opacity: 1;
            background-color: rgb(234 179 8 / var(--tw-bg-opacity, 1))
        }

        .bg-purple-500 {
            --tw-bg-opacity: 1;
            background-color: rgb(168 85 247 / var(--tw-bg-opacity, 1))
        }

        .p-1 {
            padding: 0.25rem
        }

        .p-2 {
            padding: 0.5rem
        }

        .p-4 {
            padding: 1rem
        }

        .p-3 {
            padding: 0.75rem
        }

        .p-6 {
            padding: 1.5rem
        }

        .px-4 {
            padding-left: 1rem;
            padding-right: 1rem
        }

        .py-2 {
            padding-top: 0.5rem;
            padding-bottom: 0.5rem
        }

        .py-4 {
            padding-top: 1rem;
            padding-bottom: 1rem
        }

        .px-2 {
            padding-left: 0.5rem;
            padding-right: 0.5rem
        }

        .px-3 {
            padding-left: 0.75rem;
            padding-right: 0.75rem
        }

        .px-6 {
            padding-left: 1.5rem;
            padding-right: 1.5rem
        }

        .py-1 {
            padding-top: 0.25rem;
            padding-bottom: 0.25rem
        }

        .py-3 {
            padding-top: 0.75rem;
            padding-bottom: 0.75rem
        }

        .text-left {
            text-align: left
        }

        .text-right {
            text-align: right
        }

        .text-sm {
            font-size: 0.875rem;
            line-height: 1.25rem
        }

        .text-xl {
            font-size: 1.25rem;
            line-height: 1.75rem
        }

        .text-xs {
            font-size: 0.75rem;
            line-height: 1rem
        }

        .text-2xl {
            font-size: 1.5rem;
            line-height: 2rem
        }

        .text-lg {
            font-size: 1.125rem;
            line-height: 1.75rem
        }

        .font-bold {
            font-weight: 700
        }

        .font-medium {
            font-weight: 500
        }

        .font-semibold {
            font-weight: 600
        }

        .uppercase {
            text-transform: uppercase
        }

        .leading-5 {
            line-height: 1.25rem
        }

        .tracking-wider {
            letter-spacing: 0.05em
        }

        .text-gray-800 {
            --tw-text-opacity: 1;
            color: rgb(31 41 55 / var(--tw-text-opacity, 1))
        }

        .text-gray-400 {
            --tw-text-opacity: 1;
            color: rgb(156 163 175 / var(--tw-text-opacity, 1))
        }

        .text-gray-500 {
            --tw-text-opacity: 1;
            color: rgb(107 114 128 / var(--tw-text-opacity, 1))
        }

        .text-gray-600 {
            --tw-text-opacity: 1;
            color: rgb(75 85 99 / var(--tw-text-opacity, 1))
        }

        .text-gray-700 {
            --tw-text-opacity: 1;
            color: rgb(55 65 81 / var(--tw-text-opacity, 1))
        }

        .text-gray-900 {
            --tw-text-opacity: 1;
            color: rgb(17 24 39 / var(--tw-text-opacity, 1))
        }

        .text-blue-500 {
            --tw-text-opacity: 1;
            color: rgb(59 130 246 / var(--tw-text-opacity, 1))
        }

        .text-blue-600 {
            --tw-text-opacity: 1;
            color: rgb(37 99 235 / var(--tw-text-opacity, 1))
        }

        .text-blue-800 {
            --tw-text-opacity: 1;
            color: rgb(30 64 175 / var(--tw-text-opacity, 1))
        }

        .text-green-500 {
            --tw-text-opacity: 1;
            color: rgb(34 197 94 / var(--tw-text-opacity, 1))
        }

        .text-green-600 {
            --tw-text-opacity: 1;
            color: rgb(22 163 74 / var(--tw-text-opacity, 1))
        }

        .text-green-800 {
            --tw-text-opacity: 1;
            color: rgb(22 101 52 / var(--tw-text-opacity, 1))
        }

        .text-purple-600 {
            --tw-text-opacity: 1;
            color: rgb(147 51 234 / var(--tw-text-opacity, 1))
        }

        .text-red-400 {
            --tw-text-opacity: 1;
            color: rgb(248 113 113 / var(--tw-text-opacity, 1))
        }

        .text-red-500 {
            --tw-text-opacity: 1;
            color: rgb(239 68 68 / var(--tw-text-opacity, 1))
        }

        .text-red-600 {
            --tw-text-opacity: 1;
            color: rgb(220 38 38 / var(--tw-text-opacity, 1))
        }

        .text-red-700 {
            --tw-text-opacity: 1;
            color: rgb(185 28 28 / var(--tw-text-opacity, 1))
        }

        .text-red-800 {
            --tw-text-opacity: 1;
            color: rgb(153 27 27 / var(--tw-text-opacity, 1))
        }

        .text-white {
            --tw-text-opacity: 1;
            color: rgb(255 255 255 / var(--tw-text-opacity, 1))
        }

        .text-yellow-400 {
            --tw-text-opacity: 1;
            color: rgb(250 204 21 / var(--tw-text-opacity, 1))
        }

        .text-yellow-500 {
            --tw-text-opacity: 1;
            color: rgb(234 179 8 / var(--tw-text-opacity, 1))
        }

        .text-yellow-600 {
            --tw-text-opacity: 1;
            color: rgb(202 138 4 / var (--tw-text-opacity, 1))
        }

        .text-yellow-700 {
            --tw-text-opacity: 1;
            color: rgb(161 98 7 / var(--tw-text-opacity, 1))
        }

        .text-yellow-800 {
            --tw-text-opacity: 1;
            color: rgb(133 77 14 / var(--tw-text-opacity, 1))
        }

        .antialiased {
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        .opacity-100 {
            opacity: 1
        }

        .shadow-lg {
            --tw-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --tw-shadow-colored: 0 10px 15px -3px var(--tw-shadow-color), 0 4px 6px -4px var(--tw-shadow-color);
            box-shadow: var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)
        }

        .shadow-sm {
            --tw-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --tw-shadow-colored: 0 1px 2px 0 var(--tw-shadow-color);
            box-shadow: var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow)
        }

        .backdrop-blur-sm {
            --tw-backdrop-blur: blur(4px);
            -webkit-backdrop-filter: var(--tw-backdrop-blur) var(--tw-backdrop-brightness) var(--tw-backdrop-contrast) var(--tw-backdrop-grayscale) var(--tw-backdrop-hue-rotate) var(--tw-backdrop-invert) var(--tw-backdrop-opacity) var(--tw-backdrop-saturate) var(--tw-backdrop-sepia);
            backdrop-filter: var(--tw-backdrop-blur) var(--tw-backdrop-brightness) var(--tw-backdrop-contrast) var(--tw-backdrop-grayscale) var(--tw-backdrop-hue-rotate) var(--tw-backdrop-invert) var(--tw-backdrop-opacity) var(--tw-backdrop-saturate) var(--tw-backdrop-sepia)
        }

        .transition-colors {
            transition-property: color, background-color, border-color, fill, stroke, -webkit-text-decoration-color;
            transition-property: color, background-color, border-color, text-decoration-color, fill, stroke;
            transition-property: color, background-color, border-color, text-decoration-color, fill, stroke, -webkit-text-decoration-color;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms
        }

        .transition-opacity {
            transition-property: opacity;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms
        }

        .duration-300 {
            transition-duration: 300ms
        }

        .hover\:border-blue-500:hover {
            --tw-border-opacity: 1;
            border-color: rgb(59 130 246 / var(--tw-border-opacity, 1))
        }

        .hover\:bg-gray-100:hover {
            --tw-bg-opacity: 1;
            background-color: rgb(243 244 246 / var(--tw-bg-opacity, 1))
        }

        .hover\:bg-gray-200:hover {
            --tw-bg-opacity: 1;
            background-color: rgb(229 231 235 / var(--tw-bg-opacity, 1))
        }

        .hover\:bg-blue-600:hover {
            --tw-bg-opacity: 1;
            background-color: rgb(37 99 235 / var(--tw-bg-opacity, 1))
        }

        .hover\:text-gray-500:hover {
            --tw-text-opacity: 1;
            color: rgb(107 114 128 / var(--tw-text-opacity, 1))
        }

        .focus\:not-sr-only:focus {
            position: static;
            width: auto;
            height: auto;
            padding: 0;
            margin: 0;
            overflow: visible;
            clip: auto;
            white-space: normal
        }

        .focus\:absolute:focus {
            position: absolute
        }

        .focus\:left-0:focus {
            left: 0px
        }

        .focus\:top-0:focus {
            top: 0px
        }

        .focus\:z-50:focus {
            z-index: 50
        }

        .focus\:bg-white:focus {
            --tw-bg-opacity: 1;
            background-color: rgb(255 255 255 / var(--tw-bg-opacity, 1))
        }

        .focus\:p-4:focus {
            padding: 1rem
        }

        .focus\:text-black:focus {
            --tw-text-opacity: 1;
            color: rgb(0 0 0 / var(--tw-text-opacity, 1))
        }

        .focus\:outline-none:focus {
            outline: 2px solid transparent;
            outline-offset: 2px
        }

        .focus\:ring-2:focus {
            --tw-ring-offset-shadow: var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
            --tw-ring-shadow: var(--tw-ring-inset) 0 0 0 calc(2px + var(--tw-ring-offset-width)) var(--tw-ring-color);
            box-shadow: var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow, 0 0 #0000)
        }

        .focus\:ring-inset:focus {
            --tw-ring-inset: inset
        }

        .focus\:ring-blue-500:focus {
            --tw-ring-opacity: 1;
            --tw-ring-color: rgb(59 130 246 / var(--tw-ring-opacity, 1))
        }

        .focus\:ring-offset-2:focus {
            --tw-ring-offset-width: 2px
        }

        @media (min-width: 640px) {
            .sm\:px-6 {
                padding-left: 1.5rem;
                padding-right: 1.5rem
            }
        }

        @media (min-width: 768px) {
            .md\:grid-cols-3 {
                grid-template-columns: repeat(3, minmax(0, 1fr))
            }

            .md\:grid-cols-4 {
                grid-template-columns: repeat(4, minmax(0, 1fr))
            }
        }

        @media (min-width: 1024px) {
            .lg\:ml-64 {
                margin-left: 16rem
            }

            .lg\:block {
                display: block
            }

            .lg\:hidden {
                display: none
            }

            .lg\:grid-cols-2 {
                grid-template-columns: repeat(2, minmax(0, 1fr))
            }

            .lg\:grid-cols-3 {
                grid-template-columns: repeat(3, minmax(0, 1fr))
            }

            .lg\:px-8 {
                padding-left: 2rem;
                padding-right: 2rem
            }
        }

        @media (prefers-color-scheme: dark) {
            .dark\:bg-gray-900 {
                --tw-bg-opacity: 1;
                background-color: rgb(17 24 39 / var(--tw-bg-opacity, 1))
            }
        }
    </style>
</head>

<body class="antialiased text-gray-800 min-h-screen flex flex-col">
    <htmlcode>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Production Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script defer="" src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <style>
            [x-cloak] {
                display: none !important;
            }

            html {
                scroll-behavior: smooth;
            }

            .active-link {
                @apply bg-blue-500 text-white;
                transition: all 0.3s ease;
            }

            .nav-link:hover {
                @apply bg-gray-100;
                transition: all 0.3s ease;
            }
        </style>    
        <div class="flex" id="root">
            <div x-data="{ isOpen: false }">
                <nav class="fixed h-screen w-64 bg-white border-r border-gray-200 hidden lg:block">
                    <div class="p-4 border-b border-gray-200">
                        <div class="text-xl font-bold text-gray-800">Production Hub</div>
                    </div>

                    <div class="py-4">
                        <a href="#dashboard"
                            class="nav-link active-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                            </svg>
                            Dashboard
                        </a>
                        <a href="#materials"
                            class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                            </svg>
                            Materials
                        </a>
                        <a href="#production"
                            class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z">
                                </path>
                            </svg>
                            Production
                        </a>
                        <a href="#inventory"
                            class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4">
                                </path>
                            </svg>
                            Inventory
                        </a>
                        <a href="#demand" class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z">
                                </path>
                            </svg>
                            Demand
                        </a>
                        <a href="#analytics"
                            class="nav-link flex items-center px-4 py-2 text-gray-700 hover:bg-gray-100">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z">
                                </path>
                            </svg>
                            Analytics
                        </a>
                    </div>

                    <div class="absolute bottom-0 w-full border-t border-gray-200">
                        <div class="p-4">
                            <div class="flex items-center">
                                <img src="https://avatar.iran.liara.run/public" alt="User"
                                    class="w-8 h-8 rounded-full transition-opacity duration-300 opacity-100"
                                    loading="lazy">
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
                <mountpoint>
                    <script>
                        // Active link handling
                        document.addEventListener('DOMContentLoaded', function () {
                            const navLinks = document.querySelectorAll('.nav-link');

                            function setActiveLink() {
                                const hash = window.location.hash || '#dashboard';
                                navLinks.forEach(link => {
                                    if (link.getAttribute('href') === hash) {
                                        link.classList.add('active-link');
                                    } else {
                                        link.classList.remove('active-link');
                                    }
                                });
                            }

                            window.addEventListener('hashchange', setActiveLink);
                            setActiveLink();
                        });
                    </script>

                    <htmlcode>
                        <section id="materials" class="p-6">
                            <!-- Header Section -->
                            <div class="mb-6">
                                <h2 class="text-2xl font-bold text-gray-800">Raw Materials Management</h2>
                                <p class="text-gray-600">Track and manage raw material inventory and orders</p>
                            </div>

                            <!-- Quick Actions -->
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                                <button onclick="window.location.href='${pageContext.request.contextPath}/manufacturer/Order.jsp'"
                                    class="flex items-center justify-center p-4 bg-white border border-gray-200 rounded-lg hover:border-blue-500 transition-colors">
                                    <span class="mr-2">
                                        <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                        </svg>
                                    </span>
                                    Create New Order
                                </button>
                                <button
                                    class="flex items-center justify-center p-4 bg-white border border-gray-200 rounded-lg hover:border-blue-500 transition-colors">
                                    <span class="mr-2">
                                        <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2">
                                            </path>
                                        </svg>
                                    </span>
                                    Generate Report
                                </button>
                                <button onclick="window.location.href='${pageContext.request.contextPath}/manufacturer/supplier.jsp'"
                                    class="flex items-center justify-center p-4 bg-white border border-gray-200 rounded-lg hover:border-blue-500 transition-colors">
                                    <span class="mr-2">
                                        <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor"
                                            viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z">
                                            </path>
                                        </svg>
                                    </span>
                                    Manage Suppliers
                                </button>
                            </div>

                            <!-- Main Content Grid -->
                            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
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
    String sql = "SELECT s.product_name, s.quantity, r.reorder_quantity " +
                 "FROM warehouse.stock s " +
                 "JOIN warehouse.reorder_level r ON s.stock_id = r.stock_id " +
                 "WHERE s.manufacturer_id = 1";

    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    while (rs.next()) {
        String name = rs.getString("product_name");
        int qty = rs.getInt("quantity");
        int reorderQty = rs.getInt("reorder_quantity");

        // Avoid division by zero
        int percent = reorderQty > 0 ? (int)((qty * 100.0) / reorderQty) : 0;

        stockList.add(new Stock(name, qty, percent));
    }

} catch (Exception e) {
    out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
} finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (stmt != null) try { stmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>

<div class="bg-white p-6 rounded-lg border border-gray-200">
    <h3 class="text-lg font-semibold mb-4">Current Inventory Status</h3>
    <div class="space-y-4">
        <% for (Stock stock : stockList) {
            String colorClass = "green";
            if (stock.percent <= 20) colorClass = "red";
            else if (stock.percent <= 50) colorClass = "yellow";
        %>
            <div class="flex justify-between items-center">
                <span class="text-gray-600"><%= stock.name %></span>
                <span class="text-<%= colorClass %>-500 font-medium"><%= stock.percent %>% (<%= stock.quantity %> units)</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-2">
                <div class="bg-<%= colorClass %>-500 h-2 rounded-full" style="width: <%= stock.percent %>%"></div>
            </div>
        <% } %>
    </div>
</div>

                               

<div class="bg-white p-6 rounded-lg border border-gray-200">
    <h3 class="text-lg font-semibold mb-4">Recent Orders</h3>
    <div class="space-y-4">

        <%
            
            try {
                conn = PostgresConnection.getConnection();
                String sql = "SELECT o.order_id, o.product_id, o.quantity, o.order_status, s.product_name " +
                             "FROM manufacturer.\"order\" o " +
                             "JOIN supplier.stock s ON o.product_id = s.stock_id " +
                             "ORDER BY o.order_date DESC LIMIT 3";

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
                    };
        %>

        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
            <div>
                <p class="font-medium">Order #<%= orderId %></p>
                <p class="text-sm text-gray-500"><%= productName %> - <%= quantity %> units</p>
            </div>
            <span class="px-3 py-1 text-sm rounded-full <%= statusColorClass %>"><%= status %></span>
        </div>

        <%
                }
            } catch (Exception e) {
                out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>

    </div>
</div>

                                
                                
                                
                                
                                

                                <!-- Supplier Performance -->
<div class="bg-white p-6 rounded-lg border border-gray-200">
    <h3 class="text-lg font-semibold mb-4">Supplier Performance</h3>
    <div class="space-y-4">
        <%


            try {
                conn = PostgresConnection.getConnection();
                String sql = "SELECT supplier_name, on_time_delivery_rate, quality_compliance FROM manufacturer.supplier_performance";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String supplierName = rs.getString("supplier_name");
                    int deliveryRate = rs.getInt("on_time_delivery_rate");
                    int quality = rs.getInt("quality_compliance");
        %>
        <!-- On-time Delivery -->
        <div class="flex items-center justify-between">
            <div>
                <p class="font-medium"><%= supplierName %></p>
                <p class="text-sm text-gray-500">On-time Delivery Rate</p>
            </div>
            <span class="text-green-500 font-medium"><%= deliveryRate %>%</span>
        </div>
        <!-- Quality Compliance -->
        <div class="flex items-center justify-between">
            <div>
                <p class="font-medium"><%= supplierName %></p>
                <p class="text-sm text-gray-500">Quality Compliance</p>
            </div>
            <span class="text-green-500 font-medium"><%= quality %>%</span>
        </div>
        <hr class="my-2 border-gray-200">
        <%
                }
            } catch (Exception e) {
                out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</div>

                            </div>








                            <!-- Recent Activity Table -->
                            <div class="mt-6 bg-white rounded-lg border border-gray-200">
                                <div class="p-6">
                                    <h3 class="text-lg font-semibold mb-4">Recent Activity</h3>
                                    <div class="overflow-x-auto">
                                        <table class="min-w-full divide-y divide-gray-200">
                                            <thead>
                                                <tr>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Date</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Activity</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Material</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Quantity</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Status</th>
                                                </tr>
                                            </thead>
                                            <tbody class="divide-y divide-gray-200">
                                                <tr>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                        2024-01-20</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Order
                                                        Placed</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Raw
                                                        Material A</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">1000
                                                        units</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Completed</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                        2024-01-19</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                        Inventory Check</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Raw
                                                        Material B</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">500
                                                        units</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">Pending</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                        2024-01-18</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                        Delivery Received</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Raw
                                                        Material C</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">750
                                                        units</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">Processing</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </htmlcode>

                    

                    <htmlcode>
                        <section id="inventory" class="p-6">
                            <!-- Header Section -->
                            <div class="mb-6">
                                <h2 class="text-2xl font-bold text-gray-800">Inventory Management</h2>
                                <p class="text-gray-600">Track and manage inventory levels across warehouses</p>
                            </div>

                            <!-- Inventory Overview Cards -->
                            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                                <div class="bg-white p-4 rounded-lg border border-gray-200">
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <p class="text-sm text-gray-500">Total SKUs</p>
                                            <p class="text-2xl font-bold text-gray-800">1,234</p>
                                        </div>
                                        <div class="bg-blue-100 p-2 rounded-lg">
                                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
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





     <!-- Inventory Levels and Alerts -->
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




                            </div>

                            <!-- Inventory Table -->
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
                    </htmlcode>

                    <htmlcode>
                        <section id="demand" class="p-6">
                            <!-- Header Section -->
                            <div class="mb-6">
                                <h2 class="text-2xl font-bold text-gray-800">Demand Forecasting</h2>
                                <p class="text-gray-600">Analyze and predict future demand patterns</p>
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
                                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path>
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
                                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
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
                                            <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
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
                                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4">
                                                </path>
                                            </svg>
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
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        Product A</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">11,000
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">12,000
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">+8%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">95%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        Product B</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">8,800
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">8,500
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-red-600">-3%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">92%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        Product C</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">3,600
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">4,000
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">+12%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">89%
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </htmlcode>

                    <htmlcode>
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
                                            <p class="text-sm text-gray-500">Overall Equipment Effectiveness</p>
                                            <p class="text-2xl font-bold text-gray-800">87.5%</p>
                                            <p class="text-sm text-green-600">↑ 2.3%</p>
                                        </div>
                                        <div class="bg-blue-100 p-2 rounded-lg">
                                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z">
                                                </path>
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
                                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path>
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
                                            <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
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
                                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor"
                                                viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <!-- Performance Trends -->
                            <div class="bg-white rounded-lg border border-gray-200">
                                <div class="p-6">
                                    <div class="flex justify-between items-center mb-4">
                                        <h3 class="text-lg font-semibold">Performance Trends</h3>
                                        <div class="flex space-x-2">
                                            <button
                                                class="px-4 py-2 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200">Weekly</button>
                                            <button
                                                class="px-4 py-2 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200">Monthly</button>
                                            <button
                                                class="px-4 py-2 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200">Yearly</button>
                                        </div>
                                    </div>
                                    <div class="overflow-x-auto">
                                        <table class="min-w-full divide-y divide-gray-200">
                                            <thead>
                                                <tr>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Metric</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Current</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Target</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Trend</th>
                                                    <th
                                                        class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                        Status</th>
                                                </tr>
                                            </thead>
                                            <tbody class="divide-y divide-gray-200">
                                                <tr>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        OEE</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">87.5%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">85%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">↑
                                                        2.3%</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Above
                                                            Target</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        Yield Rate</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">94.2%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">95%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-yellow-600">↓
                                                        0.8%</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">Near
                                                            Target</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                        Downtime</td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">4.5%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">5%
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-green-600">↓
                                                        0.5%</td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <span
                                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Above
                                                            Target</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </htmlcode>
                </mountpoint>
            </main>
        </div>
    </htmlcode>
</body>

</html>