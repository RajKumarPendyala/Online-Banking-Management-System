<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" import="test.BeanClass"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard - Online Banking</title>
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

        .dashboard {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .actions a {
            display: inline-block;
            padding: 15px 25px;
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .actions a:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.5);
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            p {
                font-size: 1rem;
            }

            .actions a {
                font-size: 1rem;
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>
    <%
        String msg = (String) request.getAttribute("msg");
        BeanClass user = (BeanClass) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "Sorry! Session Expired...<br>");
            request.getRequestDispatcher("msg.jsp").forward(request, response);
            return;
        }
        if (msg != null) {
            out.println(msg);
        }
    %>

    <div class="dashboard">
        <h1>Welcome, <%= user.getName() %>!</h1>
        <p>Account Number: <%= user.getAccountNumber() %></p>
        <p>Balance: ₹<%= user.getBalance2() %></p>

        <div class="actions">
            <a href="deposit.jsp">Deposit</a>
            <a href="withdraw.jsp">Withdraw</a>
            <a href="transfer.jsp">Transfer</a>
            <a href="transactionHistory">Transaction History</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>
