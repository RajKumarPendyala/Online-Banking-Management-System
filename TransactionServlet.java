package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@SuppressWarnings("serial")
@WebServlet("/transactionHistory")
public class TransactionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	BeanClass user = (BeanClass) session.getAttribute("user");
  
        DAOClass dao = new DAOClass();
        ArrayList<Transaction> transactions = (ArrayList<Transaction>)dao.getTransactionHistory(user.getAccountNumber());
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("transactionHistory.jsp").forward(request, response);
    }
}
