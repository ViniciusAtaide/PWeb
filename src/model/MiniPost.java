package model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class MiniPost {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String conteudo;
	private String titulo;

	@Temporal(TemporalType.DATE)
	private Calendar datapostado;

	@ManyToOne(cascade=CascadeType.DETACH)
	private Musica musica;
	@ManyToOne(cascade=CascadeType.REFRESH)
	private Usuario usuario;
	
	
	public MiniPost() {
	}

	public MiniPost(String conteudo, String titulo) {
		this.conteudo = conteudo;
		this.titulo = titulo;
		this.datapostado = Calendar.getInstance();
	}
	public MiniPost(Musica musica, Usuario usuario) {
		StringBuffer sb = new StringBuffer();
		sb.append("Autores: ");
		for (Autor a : musica.getAutores()) 
			sb.append(a.getNome() + ", ");		
		this.conteudo = sb.toString() + " Estilo: " +musica.getEstilo().getNome() + " Album: " + musica.getAlbum().getNome();
		this.titulo = usuario.getLogin() + " escutou a música "+ musica.getNome();
		this.musica = musica;
		musica.addMiniPost(this);
		this.usuario = usuario;
		usuario.addMiniPost(this);
	}
	public MiniPost(String conteudo, String titulo, Musica musica, Usuario usuario) {
		this.conteudo = conteudo;
		this.titulo = titulo;
		this.musica = musica;
		this.usuario = usuario;
		this.datapostado = Calendar.getInstance();
	}

	public MiniPost(String conteudo, String titulo, Usuario usuario) {	
		this.conteudo = conteudo;
		this.titulo = titulo;
		this.usuario = usuario;
		this.datapostado = Calendar.getInstance();
	}

	public void setDatapostado(Calendar datapostado) {
		this.datapostado = datapostado;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDatapostado() {
		String str;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		str = sdf.format(datapostado.getTime());
		System.out.println(str);
		return str;
	}

	public Musica getMusica() {
		return musica;
	}

	public void setMusica(Musica musica) {
		this.musica = musica;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
