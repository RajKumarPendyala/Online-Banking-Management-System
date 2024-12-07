package test;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        BeanClass user = new BeanClass();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAccountNumber("AC" + System.currentTimeMillis()); // Generate a unique account number

        DAOClass userDAO = new DAOClass();
        if (userDAO.createUser(user)) {
        	request.setAttribute("msg", "Account created successfully...<br>");
            request.getRequestDispatcher("msg.jsp").forward(request, response);
        } else {
        	request.setAttribute("msg", "Failed to create account...<br>");
            request.getRequestDispatcher("msg.jsp").forward(request, response);
        }
    }
}
