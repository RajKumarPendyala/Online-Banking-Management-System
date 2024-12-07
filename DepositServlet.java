package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	BeanClass user = (BeanClass) session.getAttribute("user");
    	
        if (user == null) {
	    	request.setAttribute("msg", "Sorry! Session Expired...<br>");
	        request.getRequestDispatcher("msg.jsp").forward(request, response);
	        return;
	    }

        double depositAmount = Double.parseDouble(request.getParameter("amount"));
        Transaction transaction = new Transaction(user.getAccountNumber(), "DEPOSIT", depositAmount, null, "APPROVED");
        DAOClass DAO = new DAOClass();
        if (DAO.addTransaction(transaction) && DAO.deposit(user.getId(), depositAmount)) {
            request.setAttribute("msg", "Deposit request submitted for approval...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Failed to submit deposit request...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}

