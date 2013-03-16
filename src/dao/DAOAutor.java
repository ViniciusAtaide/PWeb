package dao;

import model.Autor;

public class DAOAutor extends DAOJPA<Autor> {
	public DAOAutor() {
		super();
	}
// CONSULTAS ESPECIFICAS
	public Autor findByNome(String nome) {
		if (super.findByField("nome", nome).isEmpty())
			return null;
		return super.findByField("nome", nome).get(0);
		
	}
}
