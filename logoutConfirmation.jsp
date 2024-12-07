<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - Online Banking</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Roboto", sans-serif;
        }

        body {
            padding: 30px;
            background-image: url('https://www.shutterstock.com/image-illustration/creative-polygonal-circuit-banking-hologram-600nw-2447847627.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            backdrop-filter: blur(8px); 
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .logout-container {
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            background: #6a11cb;
            box-shadow: 0px 6px #4e0e9c; 
            transition: all 0.3s ease;
        }

        a:hover {
            background: #2575fc; 
            box-shadow: 0px 10px #1c5ed6; 
            transform: translateY(-4px); 
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 1.8rem;
            }

            a {
                font-size: 1rem;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <h1>You have been logged out successfully.</h1>
        <a href="login.jsp">Login Again</a>
    </div>
</body>
</html>
