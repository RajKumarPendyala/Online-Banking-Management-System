package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);//accesing existing session
        BeanClass user = (BeanClass) session.getAttribute("user");

        if (user == null) {
	    	request.setAttribute("msg", "Sorry! Session Expired...<br>");
	        request.getRequestDispatcher("msg.jsp").forward(request, response);
	        return;
	    }

        String recipientAccountNumber = request.getParameter("recipientAccountNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        DAOClass userDAO = new DAOClass();
        Transaction transaction = new Transaction(user.getAccountNumber(), "TRANSFER", amount, recipientAccountNumber, "APPROVED");
        if (userDAO.addTransaction(transaction) && userDAO.transfer(user.getAccountNumber(), recipientAccountNumber, amount)) {
        	request.setAttribute("msg", "Transfer request submitted for approval...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
        	request.setAttribute("msg", "Failed to submit transfer request...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}
