<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Online Banking</title>
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

        h1 {
            font-size: 3rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        label {
            font-size: 1.2rem;
            display: block;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            margin-bottom: 12px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
        }

        input::placeholder {
            color: #888;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #00A4E4; 
            color: white;
            font-size: 1.2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #007BFF;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 1rem;
            color: #00A4E4;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }

            form {
                padding: 20px;
            }

            label {
                font-size: 1.1rem;
            }

            button {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <h1>Create a New Account</h1>
    <form action="signup" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your full name" required><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email address" required><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Create a strong password" required><br>
        
        <button type="submit">Sign Up</button>
    </form>
    <a href="login.jsp">Already have an account? Login</a>
</body>
</html>
