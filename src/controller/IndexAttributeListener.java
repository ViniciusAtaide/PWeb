package controller;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import dao.DAOEstilo;
import dao.DAOMusica;

@WebListener
public class IndexAttributeListener implements ServletRequestAttributeListener, ServletRequestListener {
	private DAOMusica mdao;
	private DAOEstilo edao;
	
    public IndexAttributeListener() {
    	mdao = new DAOMusica();
    	edao = new DAOEstilo();
    }
    public void requestDestroyed(ServletRequestEvent arg0) {
    }
    public void attributeAdded(ServletRequestAttributeEvent event) {
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    }
    public void attributeRemoved(ServletRequestAttributeEvent event) {
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    }
    public void attributeReplaced(ServletRequestAttributeEvent event) {    	
    }
    public void requestInitialized(ServletRequestEvent event) {    	
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    }
	
}
