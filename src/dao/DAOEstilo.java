package dao;

import model.Estilo;

public class DAOEstilo extends DAOJPA<Estilo> {
	public DAOEstilo() {
		super();
	}

	
	// consultas especificas
	public Estilo findByNome(String nome) {
		if (super.findByField("nome", nome).isEmpty())
			return null;
		return super.findByField("nome", nome).get(0);
	}
}
