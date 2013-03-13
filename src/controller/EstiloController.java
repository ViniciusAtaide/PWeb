package controller;

import java.io.IOException;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Estilo;
import model.Musica;
import dao.DAOEstilo;

@WebServlet("/style.do")
public class EstiloController extends HttpServlet {
	DAOEstilo edao;
	private enum action {
		delete,	create, update, show;
	}
	private static final long serialVersionUID = 1L;
	private static String URL = "style.jsp";

	public EstiloController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		edao = new DAOEstilo();
		String forward = URL;
		String a = request.getParameter("action");
		int id;
		Estilo e = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			e = edao.find(id);
		}
		edao.begin();		
		switch (action.valueOf(a)) {
		
		case delete:
			try{
				if (!(e.getMusicas().isEmpty())) {
					for (Musica m : e.getMusicas()) {
						m.setEstilo(null);						
					}					
				}	
				edao.remove(e);
				request.setAttribute("content_message", "Estilo Removido");
				forward = "painel.jsp";
			} catch(Exception e2) {
				request.setAttribute("error_message", "Estilo ja removido");
				e2.printStackTrace();
			}
			break;
		case show :
			request.setAttribute("style", e);
			
		default:
			break;
		}
		try {
			edao.commit();
			edao.close();
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
		edao = new DAOEstilo();
		edao.begin();

		switch (action.valueOf(a)) {
		case create:
			try {
				if(edao.findByNome(nome) == null) {
					Estilo estilo = new Estilo(nome, sobre);
					edao.persist(estilo);
					request.setAttribute("content_message", "Estilo criado com sucesso");
				} else {
					System.out.println("a");
					request.setAttribute("error_message", "Estilo ja existente");
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
			edao.commit();
			edao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Estilo ja existente.");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}
}
