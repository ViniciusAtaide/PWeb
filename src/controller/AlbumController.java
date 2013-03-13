package controller;

import java.io.IOException;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Album;
import model.Autor;
import model.Musica;
import dao.DAOAlbum;

@WebServlet("/album.do")
public class AlbumController extends HttpServlet {
	DAOAlbum aldao;
	private enum action {
		delete,	create, update, show, search;
	}
	private static final long serialVersionUID = 1L;
	private static String URL = "album.jsp";

	public AlbumController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		aldao = new DAOAlbum();
		String forward = URL;
		String a = request.getParameter("action");
		int id;
		Album al = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			al = aldao.find(id);
		}
		aldao.begin();		
		switch (action.valueOf(a)) {
		
		case delete:
			try{
				if (!(al.getMusicas().isEmpty())) {
					for (Musica m : al.getMusicas()) {
						m.setAlbum(null);						
					}					
				}
				if (!(al.getAutores().isEmpty())) {
					for (Autor au : al.getAutores()) {
						au.removeAlbum(al);						
					}					
				}	
				aldao.remove(al);
				request.setAttribute("content_message", "Album Removido");
				forward = "index.jsp";
			} catch(Exception e2) {
				request.setAttribute("error_message", "Album ja removido");
				e2.printStackTrace();
			}
			break;
		case show :
			request.setAttribute("album", al);
			
		default:
			break;
		}
		try {
			aldao.commit();
			aldao.close();
		} catch (PersistenceException e2 ) {
			request.setAttribute("error_message", "Erro na transacao");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("action");
		String nome = request.getParameter("nome");
		String sobre = request.getParameter("sobre");
		String forward = URL;
		aldao = new DAOAlbum();
		aldao.begin();

		switch (action.valueOf(a)) {
		case create:
			try {				
				if(aldao.findByNome(nome) == null) {
					Album Album = new Album(nome, sobre);
					aldao.persist(Album);
					request.setAttribute("content_message", "Album criado com sucesso");
				} else {
					request.setAttribute("error_message", "Album ja existente");
				}
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha algum campo");
				e.printStackTrace();
			}
			forward = "painel.jsp";
			break;
		default:
			break;
		}	
		try {			
			aldao.commit();
			aldao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Album ja existente.");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}
}
