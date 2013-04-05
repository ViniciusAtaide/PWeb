package application;

import model.MiniPost;
import model.Musica;
import dao.DAOMiniPost;
import dao.DAOMusica;

public class Application3 {
	public static void main(String args[]) {
		DAOMiniPost minidao = new DAOMiniPost();
		DAOMusica mudao = new DAOMusica();
		
		Musica m = mudao.find(1);
		MiniPost mini = minidao.find(1);
		
		
	}
}
