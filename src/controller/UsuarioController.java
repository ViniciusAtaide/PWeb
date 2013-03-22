package controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAOModerador;
import dao.DAOUsuario;

@WebServlet(urlPatterns = { "/user.do"})
public class UsuarioController extends HttpServlet {

	private enum action {
		delete, show, logoff, login, create, search;
	}

	private String caminho;
	private String filepath;
	private String nome;
	private File file;
	private DAOUsuario udao;
	private static final long serialVersionUID = 1L;
	private static String URL = "user.jsp";

	public UsuarioController() {
		super();
	}

	public void init() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDAOUsuario();
		String forward = URL;
		HttpSession session = request.getSession();
		String a = request.getParameter("action");
		int id;
		Usuario u = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			u = udao.find(id);
		}
		udao.begin();

		switch (action.valueOf(a)) {
		case delete:
			udao.remove(u);
			request.setAttribute("users", udao.findAll());
			break;
		case show:
			request.setAttribute("usu", u);
			break;
		case logoff:
			session.setAttribute("user", null);
			session.invalidate();
			request.setAttribute("content_message", "Logoff concluido!");
			forward = "index.jsp";
		default:
			break;
		}
		udao.commit();
		udao.close();
		getServletContext().setAttribute("users", udao.findAll());
		request.getRequestDispatcher(forward).forward(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		caminho = getServletContext().getInitParameter("file-upload");
		filepath = getServletContext().getInitParameter("file-path");
		DAOModerador modao = new DAOModerador();
		String a = null;
		String login = null;
		String pass = null;		
		String forward = "index.jsp";
		getDAOUsuario();

		udao.begin();

		if (ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(20 * 1024 * 1024);

			try {
				List<FileItem> lista = upload.parseRequest(request);
				Iterator<FileItem> i = lista.iterator();
				while (i.hasNext()) {
					FileItem item = (FileItem) i.next();
					if (item.isFormField()) {
						String campo = item.getFieldName();
						String valor = item.getString();
						if (campo.equals("login")) {
							login = valor;
						} else if (campo.equals("senha")) {
							pass = valor;
						} else if (campo.equals("action")) {
							a = valor;
						}
					} else {
						nome = item.getName().replace(" ", "");
						if (item.getFieldName().lastIndexOf("\\") >= 0) {
							file = new File(caminho
									+ nome.substring(nome.lastIndexOf("\\")));
						} else {
							file = new File(
									caminho
											+ nome.substring(nome
													.lastIndexOf("\\") + 1));
						}
						if (nome != "") {
							filepath += nome;
						} else {
							filepath = "assets/img/default-user-image.png";
						}
						item.write(file);
					}
				}
			} catch (Exception e) {
			}
		} else {
			login = request.getParameter("login");
			pass = request.getParameter("senha");
			a = request.getParameter("action");
		}

		// /

		switch (action.valueOf(a)) {

		case login:
			try {
				Usuario u = udao.findByLogin(login);
				if (pass.equals(u.getSenha())
						|| (!(modao.find(1).getLogin().equals(login)) && (!(modao
								.find(1).getSenha().equals(pass))))) {
					HttpSession session = request.getSession();
					session.setAttribute("user", u);
					request.setAttribute("content_message", "Login concluido!");
					forward = "index.jsp";
				} else {
					request.setAttribute("error_message", "Senha Incorreta");
				}
			} catch (Exception e) {
				request.setAttribute("error_message", "Usuario Nao Encontrado");
				forward = "index.jsp";
			}
			break;
		case create:
			try {
				if (udao.findByLogin(login) == null
						|| !(modao.find(1).getLogin().equals(login))) {
					Usuario user = new Usuario(login, pass, filepath);
					udao.persist(user);
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					forward = "index.jsp";
					request.setAttribute("content_message",
							"Usuario cadastrado com sucesso");
				} else {
					request.setAttribute("error_message",
							"Usuario ja cadastrado");
				}
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha algum campo");
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case search:
			forward = URL;
			request.setAttribute("userssearch", udao.findByLogin(login));
		default:
			break;
		}
		try {
			udao.commit();
			udao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Usuario ja existente");
		}
		getServletContext().setAttribute("users", udao.findAll());
		request.getRequestDispatcher(forward).forward(request, response);
		
	}

	private DAOUsuario getDAOUsuario() {
		if (udao == null) {
			udao = new DAOUsuario();
		}
		return udao;
	}
}