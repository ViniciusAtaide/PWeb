package application;

import model.Album;
import model.Autor;
import model.Estilo;
import model.MiniPost;
import model.Musica;
import model.Usuario;
import dao.DAOMiniPost;
import dao.DAOMusica;
import dao.DAOUsuario;

public class Application1 {	
	public static void main(String[] args) {
		DAOUsuario udao;
		DAOMusica mdao;
		DAOMiniPost minidao;
		
		udao = new DAOUsuario();
		minidao = new DAOMiniPost();
		mdao = new DAOMusica();
		
		// Criação em memória das classes
		Usuario u = new Usuario("Vinicius","123");		
		Musica m = new Musica("Sultans of Swing","Musica famosa de Dire Straits");
		Musica m2 = new Musica("ABC", "Musica de MJ");
		Estilo e = new Estilo("Rock","O rock surgiu na decada de 60...");
		Album al = new Album("Alchemy", "Alchemy foi um album extraordinario...");
		Album al2 = new Album("Abc","Album de MJ");
		Autor a = new Autor("Dire Straits","Surgiu nos anos 70...");
		Autor a2 = new Autor("Michael Jackson","Cantor famoso");
		MiniPost mi = new MiniPost("Ola eu estou postando!","Titulo 1");		
		MiniPost mi2;
		MiniPost mi3;
		
		
		// Relacionamento entre as classes
		// Musica
		m.addAutor(a);		
		m.setAlbum(al);		
		m.setEstilo(e);		
		m.addUsuario(u);
		m2.addAutor(a2);
		m2.setAlbum(al2);
		m2.setEstilo(e);
		m2.addUsuario(u);
		// Usuario
		u.addMiniPost(mi);		
		u.addMusica(m);
		u.addMusica(m2);
		// Estilo
		e.addMusica(m);
		// Album
		al.addMusica(m);
		// Autor
		a.addMusica(m);
		// MiniPost
		mi.setUsuario(u);
		
		mi2 = new MiniPost(m, u);
		mi3 = new MiniPost(m2, u);
		// Fase de persistência
		udao.begin();
		mdao.begin();
		minidao.begin();
		udao.persist(u);
		mdao.persist(m);
		minidao.persist(mi2);
		minidao.persist(mi3);
		minidao.commit();
		mdao.commit();
		udao.commit();
		minidao.close();
		udao.close();
		mdao.close();
		System.out.println(udao.find(1).getLogin()+", " + mdao.find(1).getNome() + ", MiniPost1: " +minidao.find(1).getTitulo()+", MiniPost2: "+ minidao.find(2).getTitulo() );
	}
}

