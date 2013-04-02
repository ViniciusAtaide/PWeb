package application;

import model.*;
import dao.*;

public class Application1 {	
	public static void main(String[] args) {
		DAOUsuario udao;
		DAOMusica mdao;
		DAOMiniPost minidao;
		DAOEstilo edao;
		DAOAutor audao;
		
		udao = new DAOUsuario();
		
		udao.begin();
		Usuario u = new Usuario("Vinicius","123");		
		Musica m = new Musica("Sultans of Swing","Musica famosa de Dire Straits");
		Autor a = new Autor("Dire Straits","Surgiu nos anos 80...");
		minidao = new DAOMiniPost();
		m.addAutor(a);
		MiniPost mi = new MiniPost("Ola eu estou postando!","Titulo 1");
		MiniPost mi2 = new MiniPost("Autor: "+m.getAutores().get(0) , "Vinicius escutou "+m.getNome());
		minidao.persist(mi);
		minidao.persist(mi2);
	}
}
