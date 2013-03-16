package controller;

import java.io.IOException;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MiniPost;
import model.Usuario;
import dao.DAOMiniPost;
import dao.DAOUsuario;

@WebServlet("/minipost.do")
public class MiniPostController extends HttpServlet {

	private enum action {
		delete,	create, update;
	}

	private DAOMiniPost minidao;
	private DAOUsuario udao;
	private static final long serialVersionUID = 1L;
	private static String URL = "index.jsp";

	public MiniPostController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDAOMiniPost();
		String forward = URL;
		String a = request.getParameter("action");
		int id;
		MiniPost m = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			m = minidao.find(id);
		}
		minidao.begin();		
		switch (action.valueOf(a)) {
		case delete:
			try{
				minidao.remove(m);
				request.setAttribute("content_message", "MiniPost Removido");
			} catch(Exception e) {
				request.setAttribute("error_message", "MiniPost ja removido");
			}
			break;
		default:
			break;
		}
		try {
			minidao.commit();
			minidao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Erro na transacao.");
		}
		getServletContext().setAttribute("miniposts", minidao.findAll());
		request.getRequestDispatcher(forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("action");
		String titulo = request.getParameter("titulo");
		String conteudo = request.getParameter("conteudo");
		HttpSession session = request.getSession();
		String forward = URL;
		getDAOMiniPost();
		udao = new DAOUsuario();
		minidao.begin();
		Usuario u = (Usuario) session.getAttribute("user");
		switch (action.valueOf(a)) {
		case create:
			try {
				MiniPost minipost = new MiniPost(conteudo, titulo, u);
				u.addMiniPost(minipost);
				minidao.persist(minipost);
				request.setAttribute("content_message", "MiniPost criado com sucesso");
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha algum campo");
				e.printStackTrace();
			}
			break;
		default:
			break;
		}	
		udao.refresh(udao.find(u.getId()));
		udao.commit();
		udao.close();
		minidao.commit();
		minidao.close();
		getServletContext().setAttribute("miniposts", minidao.findAll());
		request.getRequestDispatcher(forward).forward(request, response);
	}

	private DAOMiniPost getDAOMiniPost() {
		if (minidao == null) {
			minidao = new DAOMiniPost();
		}
		return minidao;
	}	
}
