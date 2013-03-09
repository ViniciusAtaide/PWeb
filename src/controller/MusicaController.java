package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.Player;
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

import dao.DAOMiniPost;
import dao.DAOModerador;
import dao.DAOMusica;

@WebServlet("/music.do")
@MultipartConfig
public class MusicaController extends HttpServlet {
	private String forward;
	private File file;
	private FileInputStream f;
	private BufferedInputStream buffer;
	private String filepath;
	private String caminho;
	private String n;

	private enum action {
		delete, create, update, search, show;
	}

	private DAOMusica mudao;

	private static final long serialVersionUID = 1L;
	private static String URL = "index.jsp";

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
		forward = URL;
		HttpSession session = request.getSession();
		String a = request.getParameter("action");
		String busca = request.getParameter("busca");
		int id = 0;
		Musica m = null;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
			m = mudao.find(id);
			String arq = caminho + mudao.find(id).getCaminhoarq().substring(14);
			file = new File(arq);
			f = new FileInputStream(file);
			buffer = new BufferedInputStream(f);
		}

		Player p;
		try {
			p = new Player(buffer);

			mudao.begin();

			switch (action.valueOf(a)) {
			case delete:
				mudao.remove(m);
				request.setAttribute("content_message",
						"Musica removida com sucesso");
				break;
			case search:
				request.setAttribute("result", mudao.findByNome(busca));
				forward = "music.jsp";
				request.setAttribute("success-message", "Resultado da busca");
				break;
			case show:
				request.setAttribute("music", m);
				forward = "music.jsp";
				break;

				default:
				break;
			}
		} catch (JavaLayerException e1) {
			e1.printStackTrace();
		}
		mudao.commit();
		mudao.close();
		request.getRequestDispatcher(forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		if (ServletFileUpload.isMultipartContent(request)) {

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(20485760);
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
						if (item.getFieldName().lastIndexOf("\\") >= 0) {
							file = new File(caminho
									+ n.substring(n.lastIndexOf("\\")));

						} else {
							file = new File(caminho
									+ n.substring(n.lastIndexOf("\\") + 1));
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
			try {
				Autor au = new Autor(autor);
				Estilo es = new Estilo(estilo, "");
				Album al = new Album(album, "");
				Musica mus = null;
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
				mudao.persist(mus);
				request.setAttribute("content_message",
						"Música cadastrada com sucesso");
			} catch (NullPointerException e) {
				request.setAttribute("error_message", "Preencha algum campo");
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		try {
			mudao.commit();
			mudao.close();
		} catch (PersistenceException e) {
			request.setAttribute("error_message", "Falha na transa��o");
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}
}
