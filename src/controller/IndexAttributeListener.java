package controller;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import dao.DAOEstilo;
import dao.DAOMiniPost;
import dao.DAOMusica;

@WebListener
public class IndexAttributeListener implements ServletRequestAttributeListener, ServletRequestListener {
	private DAOMusica mdao;
	private DAOEstilo edao;
	private DAOMiniPost minidao;
	
    public IndexAttributeListener() {
    	mdao = new DAOMusica();
    	edao = new DAOEstilo();
    	minidao = new DAOMiniPost();
    }
    public void requestDestroyed(ServletRequestEvent arg0) {
    }
    public void attributeAdded(ServletRequestAttributeEvent event) {
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    	event.getServletRequest().setAttribute("musics", mdao.findAll());
    	event.getServletRequest().setAttribute("miniposts", minidao.findAll());
    }
    public void attributeRemoved(ServletRequestAttributeEvent event) {
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    	event.getServletRequest().setAttribute("musics", mdao.findAll());
    	event.getServletRequest().setAttribute("miniposts", minidao.findAll());
    }
    public void attributeReplaced(ServletRequestAttributeEvent event) {    	
    }
    public void requestInitialized(ServletRequestEvent event) {    	
    	event.getServletRequest().setAttribute("topmusics", mdao.findTopMusicas());
    	event.getServletRequest().setAttribute("styles", edao.findAll());
    	event.getServletRequest().setAttribute("musics", mdao.findAll());
    	event.getServletRequest().setAttribute("miniposts", minidao.findAll());
    }
	
}
