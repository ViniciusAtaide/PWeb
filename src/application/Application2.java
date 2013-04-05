package application;

import javax.persistence.PersistenceException;

import model.Usuario;
import dao.DAOMiniPost;
import dao.DAOUsuario;

public class Application2 {
	public static void main(String[] args) {
		DAOUsuario udao = new DAOUsuario();		
		DAOMiniPost minidao = new DAOMiniPost();
		
		Usuario u = udao.find(1);
		
		try {
			udao.begin();
			u.removeMiniPost(u.getMiniposts().get(1));
			udao.merge(u);
			udao.commit();
			udao.close();
			System.out.println(minidao.find(1).getTitulo());
		} catch (PersistenceException e) {
			System.out.println("Deu algo errado");
		}
		
	}
}
