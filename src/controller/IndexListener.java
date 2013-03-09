package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import model.Moderador;
import dao.DAOMiniPost;
import dao.DAOModerador;
import dao.DAOMusica;
import dao.DAOUsuario;

@WebListener
public class IndexListener implements ServletRequestListener,
		ServletRequestAttributeListener, ServletContextListener {
	DAOMiniPost midao;
	DAOUsuario udao;
	DAOMusica mdao;
	DAOModerador modao;
	Moderador modera;

	public IndexListener() {
		
	}

	public void requestDestroyed(ServletRequestEvent sre) {

	}

	public void requestInitialized(ServletRequestEvent sre) {
		sre.getServletRequest().setAttribute("miniposts", midao.findAll());
		sre.getServletRequest().setAttribute("users", udao.findAll());
		sre.getServletContext().setAttribute("musics", mdao.findAll());
		sre.getServletContext().setAttribute("topmusics", mdao.findTopMusicas());
	}

	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		srae.getServletRequest().setAttribute("miniposts", midao.findAll());
		srae.getServletRequest().setAttribute("users", udao.findAll());
		srae.getServletContext().setAttribute("musics", mdao.findAll());
		srae.getServletContext().setAttribute("topmusics", mdao.findTopMusicas());
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		srae.getServletRequest().setAttribute("miniposts", midao.findAll());
		srae.getServletRequest().setAttribute("users", udao.findAll());
		srae.getServletContext().setAttribute("musics", mdao.findAll());
		srae.getServletContext().setAttribute("topmusics", mdao.findTopMusicas());
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent srae) {	
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {	
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		midao = new DAOMiniPost();
		udao = new DAOUsuario();
		mdao = new DAOMusica();
		modao = new DAOModerador();
		if (modao.find(1) == null) {			
			modera = new Moderador(sce.getServletContext().getInitParameter("admlogin"),sce.getServletContext().getInitParameter("admpass"),"assets/img/user_admin.png");
			sce.getServletContext().setAttribute("moderador", modera);
			modao.begin();
			modao.persist(modera);
			modao.commit();
			modao.close();
		}		
	}

}
