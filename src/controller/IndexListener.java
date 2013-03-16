package controller;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.Moderador;
import dao.DAOModerador;

@WebListener
public class IndexListener implements  ServletContextListener {
	
	DAOModerador modao;
	Moderador modera;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		modao = new DAOModerador();
		if (modao.find(1) == null) {			
			try {
				modera = new Moderador(sce.getServletContext().getInitParameter("admlogin"),sce.getServletContext().getInitParameter("admpass"),"assets/img/user_admin.png");
			} catch (IOException e) {
				e.printStackTrace();
			}
			sce.getServletContext().setAttribute("moderador", modera);
			modao.begin();
			modao.persist(modera);
			modao.commit();
			modao.close();
		}		
	}

}
