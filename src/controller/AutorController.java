package controller;

import java.io.IOException;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Autor;
import dao.DAOAutor;

@WebServlet("/author.do")
public class AutorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private enum action {
		delete,	create, update, show;
	}
	private static String URL = "author.jsp";
	private DAOAutor audao;
	
	public AutorController() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Autor au = null;
		String a = request.getParameter("action");
		audao = new DAOAutor();
		String forward = URL;
		int id;
		audao.begin();
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			au = audao.find(id);
		}		
		switch (action.valueOf(a)) {
		case show :
			request.setAttribute("author", au);
			break;
		case delete :
			try {
				audao.remove(au);
			} catch (Exception e) {
				request.setAttribute("error_message", "Autor ja removido.");
			}			
		default:
			break;
		}
		try {
			audao.commit();
			audao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Erro na transacao.");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("action");
		String nome = request.getParameter("nome");
		String sobre = request.getParameter("sobre");
		
		audao = new DAOAutor();
		audao.begin();
		switch (action.valueOf(a)) {
		
		case create :
			try {
				Autor au = new Autor(nome,sobre);
				audao.persist(au);
				request.setAttribute("content_message", "Autor criado com sucesso");
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha todos os campos");
			}
			break;
		case update :
			
			break;
			
		
		default:
			break;
			
		}
		try {
			audao.commit();
			audao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Erro na transacao.");
		}
	}

}
