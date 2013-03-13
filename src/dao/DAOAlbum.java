package dao;

import model.Album;

public class DAOAlbum extends DAOJPA<Album> {
	public DAOAlbum() {
		super();
	}

	
	// métodos específicos
	public Album findByNome(String nome) {
		if (super.findByField("nome", nome).isEmpty())
			return null;
		return super.findByField("nome", nome).get(0);
	}
}
