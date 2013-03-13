package controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;

@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/painel.jsp" })
public class PainelFilter implements Filter {

	
    public PainelFilter() {
    }

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		Usuario u = (Usuario)session.getAttribute("user");
		try {
		if( !(u.getLogin().equals(req.getServletContext().getInitParameter("admlogin")))) {
			res.sendRedirect("index.jsp");
			req.setAttribute("error_message", "Usuario não qualificado para tal ato");
		} else		
			chain.doFilter(request, response);
		} catch (NullPointerException e) {
			res.sendRedirect("index.jsp");
			req.setAttribute("error_message", "Usuario não qualificado para tal ato");
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
