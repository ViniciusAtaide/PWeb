package dao;

import java.util.List;

import model.MiniPost;

public class DAOMiniPost extends DAOJPA<MiniPost> {
	public DAOMiniPost() {
		super();
	}
	
	// consultas específicas
	
	@SuppressWarnings("unchecked")
	public List<MiniPost> ListByDataPostado() {
		List<MiniPost> lista = super.findAllByQuery("select m from minipost m order by m.datapostado"); 
		return lista;
	}
}
