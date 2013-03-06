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

import dao.DAOAlbum;
import dao.DAOAutor;
import dao.DAOEstilo;

@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/painel.jsp" })
public class PainelFilter implements Filter {
	private DAOAutor ardao;
	private DAOEstilo esdao;
	private DAOAlbum aldao;
	
    public PainelFilter() {
    }

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		request.setAttribute("artists", ardao.findAll());
		request.setAttribute("styles", esdao.findAll());
		request.setAttribute("albums", aldao.findAll());
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
		ardao = new DAOAutor();
		esdao = new DAOEstilo();
		aldao = new DAOAlbum();
	}
}
