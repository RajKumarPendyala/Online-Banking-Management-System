package test;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/login")
public class FilterClass implements Filter{
	public String filterName = null;
	@Override
	public void init(FilterConfig fcf) throws ServletException{
		filterName = fcf.getFilterName();
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
	            throws ServletException, IOException{
		String email = req.getParameter("email");
		if(DAOClass.isEmailContains(email)) {
			req.setAttribute("filterName", filterName);
			fc.doFilter(req, res);
		}
		else {
			req.setAttribute("msg", "Invalid Email...<br>");
			req.getRequestDispatcher("msg.jsp").forward(req, res);
		}
	}
	public void distroy() {}
}
