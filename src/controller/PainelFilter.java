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
import dao.DAOAutor;
import dao.DAOEstilo;
import dao.DAOMusica;

@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/painel.jsp" })
public class PainelFilter implements Filter {

	DAOAutor audao;
	DAOEstilo edao;
	DAOMusica mudao;
    public PainelFilter() {
    	audao = new DAOAutor();
    	edao = new DAOEstilo();
    	mudao = new DAOMusica();
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
			req.setAttribute("error_message", "Permissão negada.");
			req.getRequestDispatcher("index.jsp").forward(req, res);
		} else	{	
			req.setAttribute("authors", audao.findAll());
			req.setAttribute("styles", edao.findAll());			
			req.setAttribute("musics", mudao.findAll());	
			chain.doFilter(request, response);
			
		}
		} catch (NullPointerException e) {
			req.setAttribute("error_message", "Permissão negada.");
			req.getRequestDispatcher("index.jsp").forward(req, res);
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
