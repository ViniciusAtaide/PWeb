package dao;

import java.util.List;

import model.MiniPost;

public class DAOMiniPost extends DAOJPA<MiniPost> {
	public DAOMiniPost() {
		super();
	}
	
	// consultas espec�ficas
	
	@SuppressWarnings("unchecked")
	public List<MiniPost> findByDataPostado() {
		List<MiniPost> lista = super.findAllByQuery("select m from Minipost m order by m.tempopost"); 
		return lista;
	}
}
