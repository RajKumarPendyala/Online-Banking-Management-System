<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="test.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
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
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .table-container {
            width: 100%;
            max-width: 90%; 
            overflow-x: auto; 
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            margin: 0 auto;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #6a11cb;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        a {
            font-size: 1rem;
            color: #00A4E4;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }

            table {
                font-size: 0.9rem;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <h2>Transactions</h2>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Recipient Account Number</th>
                    <th>Status</th>
                    <th>Transaction Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    @SuppressWarnings("unchecked")
                    ArrayList<Transaction> transactions = (ArrayList<Transaction>)request.getAttribute("transactions");

                    if (transactions == null || transactions.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6">No transactions available.</td>
                    </tr>
                <% 
                    } else {
                        for (Transaction transaction : transactions) {
                %>
                    <tr>
                        <td><%= transaction.getAccountNumber() %></td>
                        <td><%= transaction.getType() %></td>
                        <td><%= transaction.getAmount() %></td>
                        <td><%= transaction.getRecipientAccountNumber() %></td>
                        <td><%= transaction.getStatus() %></td>
                        <td><%= transaction.getTransactionDate() %></td>
                    </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
    <a href="dashboard.jsp">Back to DashBoard</a>
</body>
</html>
