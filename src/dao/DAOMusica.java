package dao;

import java.util.List;

import model.Musica;

public class DAOMusica extends DAOJPA<Musica>{
	public DAOMusica() {
		super();
	}
	// specific queries
	public List<Musica> findByNome(String nome) {
		List<Musica> m = this.findByField("nome", nome);
		return m;
	}	
	@SuppressWarnings("unchecked")
	public List<Musica> findTopMusicas() {		
		List<Musica> m = (List<Musica>) DAOMusica.getManager().createQuery("select m from Musica m order by m.numusuarios").setMaxResults(10).getResultList();
		return m;
	}
}
