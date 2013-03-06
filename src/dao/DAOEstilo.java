package dao;

import java.util.List;

import model.Estilo;

public class DAOEstilo extends DAOJPA<Estilo> {
	public DAOEstilo() {
		super();
	}

	
	// consultas espec�ficas
	public List<Estilo> findByNome(String nome) {
		return super.findByField("nome", nome);
	}
}
