package dao;

import java.util.List;

import model.Estilo;

public class DAOEstilo extends DAOJPA<Estilo> {
	public DAOEstilo() {
		super();
	}

	
	// consultas específicas
	public List<Estilo> findByNome(String nome) {
		return super.findByField("nome", nome);
	}
}
