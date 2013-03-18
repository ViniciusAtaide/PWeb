package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Album;
import model.Autor;
import model.Estilo;
import model.MiniPost;
import model.Musica;
import model.Usuario;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAOAlbum;
import dao.DAOAutor;
import dao.DAOEstilo;
import dao.DAOMiniPost;
import dao.DAOModerador;
import dao.DAOMusica;

@WebServlet("/music.do")
@MultipartConfig
public class MusicaController extends HttpServlet {
	private String forward;
	private File file;
	private String filepath;
	private String caminho;
	private String n;

	private enum action {
		delete, create, update, search, show, play,showstyles;
	}

	private DAOMusica mudao;
	private DAOMiniPost minidao;
	private DAOEstilo edao;
	private DAOAutor audao;
	private DAOAlbum aldao;
	private static final long serialVersionUID = 1L;
	private static String URL = "music.jsp";

	public MusicaController() {
		super();
	}

	public void init() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		caminho = getServletContext().getInitParameter("file-upload");
		filepath = getServletContext().getInitParameter("file-path");
		mudao = new DAOMusica();
		edao = new DAOEstilo();
		forward = URL;
		HttpSession session = request.getSession();
		String a = request.getParameter("action");
		String busca = request.getParameter("busca");
		int id = 0;
		Musica m = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			m = mudao.find(id);
		}
		try {
			mudao.begin();

			switch (action.valueOf(a)) {
			
			case delete:				
				mudao.remove(m);
				forward = "index.jsp";
				request.setAttribute("content_message","Musica removida com sucesso");
				break;
			case search:
				request.setAttribute("result", mudao.findByNome(busca));
				request.setAttribute("success_message", "Resultado da busca");
				break;
			case show:
				request.setAttribute("music", m);
				break;
			case play:

				Usuario sessionuser = (Usuario) session.getAttribute("user");
				if (sessionuser != null) {
					minidao = new DAOMiniPost();
					String autores = "";
					if (m.getAutores().size() != 1) {
						for (Autor au : m.getAutores()) {
							autores += au.getNome() + ", ";
						}
					} else {
						autores = m.getAutores().get(0).getNome();
					}
					String titulo = sessionuser.getLogin() + " escutou "
							+ m.getNome();
					String conteudo = "Estilo: " + m.getEstilo().getNome() + "\nAlbum: "
							+ m.getAlbum().getNome() + "\nAutores: " + autores;
					MiniPost mp = new MiniPost(conteudo, titulo, m, sessionuser);
					minidao.begin();
					minidao.persist(mp);
					minidao.commit();
					minidao.close();
					request.setAttribute("music_message", "Escutando trilha "+ m.getNome());
				}
				forward = "index.jsp";
				break;
			default:
				break;
			}

		} catch (Exception e1) {
			request.setAttribute("error_message", "Erro");
			e1.printStackTrace();
		}
		try {
			mudao.commit();
			mudao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Erro na operação");
		}		
		request.getRequestDispatcher(forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		caminho = getServletContext().getInitParameter("file-upload");
		filepath = getServletContext().getInitParameter("file-path");
		String a = null;
		String nome = null;
		String estilo = null;
		String album = null;
		String autor = null;

		HttpSession session = request.getSession();
		forward = URL;
		mudao = new DAOMusica();
		mudao.begin();
		DAOModerador modao = new DAOModerador();
		edao = new DAOEstilo();
		aldao = new DAOAlbum();
		audao = new DAOAutor();
		if (ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(20 * 1024 * 1024);
			try {
				@SuppressWarnings("unchecked")
				List<FileItem> lista = upload.parseRequest(request);
				Iterator<FileItem> i = lista.iterator();
				while (i.hasNext()) {
					FileItem item = (FileItem) i.next();

					if (item.isFormField()) {
						String campo = item.getFieldName();
						String valor = item.getString();
						if (campo.equals("nome")) {
							nome = valor;
						} else if (campo.equals("action")) {
							a = valor;
						} else if (campo.equals("estilo")) {
							estilo = valor;
						} else if (campo.equals("album")) {
							album = valor;
						} else if (campo.equals("autor")) {
							autor = valor;
						}
					} else {
						n = item.getName();
						String comando = "/bin/bash -c \"sox "+caminho+n+" "+caminho+n.substring(0,n.indexOf("."))+ ".ogg\"";											
						Runtime.getRuntime().exec(comando).waitFor();
						
						if (item.getFieldName().lastIndexOf("\\") >= 0) {														
							file = new File(caminho + n.substring(n.lastIndexOf("\\")));
						} else {
							file = new File(caminho + n.substring(n.lastIndexOf("\\") + 1));
						}
						if (nome != "") {
							filepath += n;
						}
						item.write(file);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			a = request.getParameter("action");
			nome = request.getParameter("nome");
			autor = request.getParameter("autor");
			estilo = request.getParameter("estilo");
			album = request.getParameter("album");
		}
		
		switch (action.valueOf(a)) {
		case create:
			Usuario us = (Usuario) session.getAttribute("user");
			Autor au = null;
			Estilo es = null;
			Musica mus = null;
			Album al = null;
			try {
				if (!(mudao.findByNome(nome).isEmpty())) {
					mudao.findByNome(nome).get(0).addUsuario(us);
				} else { 											
					if (audao.findByNome(autor) == null) {
						au = new Autor(autor);
					} else {
						au = audao.findByNome(autor);
					}
					if (aldao.findByNome(album) == null) {
						al = new Album(album, "");
					} else {
						al = aldao.findByNome(album);
					}
					es = edao.find(Integer.parseInt(estilo));
					if (!(modao.find(1).getLogin().equals(us.getLogin()))) {
						mus = new Musica(nome, filepath, us);
					} else {
						mus = new Musica(nome, filepath);
					}
					mus.addAutor(au);
					au.addMusica(mus);
					mus.setEstilo(es);
					es.addMusica(mus);
					mus.setAlbum(al);
					al.addMusica(mus);
					mudao.flush();
					mudao.persist(mus);					
				}
				request.setAttribute("content_message", "Música cadastrada com sucesso");
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha algum campo");
				e.printStackTrace();
			} catch (Exception e) {
				request.setAttribute("error_message",
						"Campo com valor não corretamente formatado.");
				e.printStackTrace();
			}
			forward = "index.jsp";
			break;
		default:
			break;
		}
		try {
			mudao.commit();
			mudao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Falha na transação");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}
}
