<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message - Online Banking</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Roboto", sans-serif;
        }

        body {
            padding: 25px;
            background-image: url('https://www.shutterstock.com/image-illustration/creative-polygonal-circuit-banking-hologram-600nw-2447847627.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            backdrop-filter: blur(8px);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .message-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 15px 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            margin-bottom: 5px;
            margin-top:-50px;
        }

        .message-container p {
            font-size: 1.2rem;
        }

        .include-container {
            width: 100%;
        }

        @media (max-width: 768px) {
            .message-container p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="message-container">
        <p>
            <% 
                String msg = (String) request.getAttribute("msg"); 
                if (msg != null) { 
                    out.println(msg); 
                } else { 
                    out.println("No message available."); 
                }
            %>
        </p>
    </div>
    <div class="include-container">
        <%@include file="index.html" %>
    </div>
</body>
</html>
