<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money</title>
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

        .form-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        label {
            font-size: 1.2rem;
            display: block;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            border: none;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        button:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.5);
        }

        a {
            display: inline-block;
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
                font-size: 2rem;
            }

            label {
                font-size: 1.1rem;
            }

            button {
                font-size: 1rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Transfer Money</h1>
        <form action="transfer" method="post">
            <label for="recipientAccountNumber">Recipient Account Number:</label>
            <input type="text" id="recipientAccountNumber" name="recipientAccountNumber" placeholder="Enter recipient's account number" required><br>
            <input type="number" id="amount" name="amount" placeholder="Enter amount to transfer" required><br>
            <button type="submit">Transfer</button>
        </form>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
