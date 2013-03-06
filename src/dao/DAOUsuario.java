package dao;

import model.Usuario;

public class DAOUsuario extends DAOJPA<Usuario>{
	public DAOUsuario() {
		super();
		
	}
	// Specific Queries
	public Usuario findByLogin(String login) {
		Usuario u = (Usuario) this.findByQuery("select u from Usuario u where u.login = '"+login+"'");
		return u;
	}
}
