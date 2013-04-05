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
		
		mini.setMusica(null);
		minidao.begin();
		minidao.merge(mini);
		minidao.commit();
		minidao.close();		
		System.out.println(mudao.findByNome(m.getNome()).get(0).getNome());
		m.removeMiniPost(mini);
		mudao.begin();
		mudao.merge(m);
		mudao.commit();
		mudao.close();		
		try {
			System.out.println(minidao.find(1).getTitulo());
		} catch (Exception e) {
			System.out.println("não pode pegar o minipost");
		}
		
		
		
	}
}
