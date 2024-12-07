package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	BeanClass user = (BeanClass) session.getAttribute("user");
    	
        if (user == null) {
	    	request.setAttribute("msg", "Sorry! Session Expired...<br>");
	        request.getRequestDispatcher("msg.jsp").forward(request, response);
	        return;
	    }

        double amount = Double.parseDouble(request.getParameter("amount"));
        Transaction transaction = new Transaction(user.getAccountNumber(), "WITHDRAW", amount, null, "APPROVED");
        DAOClass DAO = new DAOClass();
        if (DAO.addTransaction(transaction) && DAO.withdraw(user.getId(), amount)) {
        	request.setAttribute("msg", "Withdraw request submitted for approval...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
        	request.setAttribute("msg", "Failed to submit withdraw request...<br>");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}