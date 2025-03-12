<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Something went wrong!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f7f7f7;
            color: #333;
            padding: 50px;
        }
        .error-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .error-container h1 {
            font-size: 50px;
            color: #ff4a4a;
        }
        .error-container p {
            font-size: 18px;
        }
        .home-link {
            text-decoration: none;
            color: white;
            background: #ff4a4a;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 15px;
        }
        .cartoon-animation {
            width: 150px;
            height: 150px;
            background-image: url('https://i.gifer.com/origin/aa/aac33df7a5a607d343e0831d88a0e1c2_w200.gif');
            background-size: cover;
            display: inline-block;
            animation: shake 0.5s infinite alternate;
        }
        @keyframes shake {
            0% { transform: translateY(0); }
            100% { transform: translateY(-10px); }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="cartoon-animation"></div>
        <h1>Oops!</h1>
        <p>Something went wrong. Please try again later.</p>
        <p>Error Message: <%= request.getAttribute("errorMessage") %></p>
        <a class="home-link" href="<%= request.getContextPath() %>/">Go Home</a>
    </div>
</body>
</html>
