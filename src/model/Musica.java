package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Musica {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable=false)
	private String nome;
	
	private String caminhoarq;
	
	@ManyToMany(cascade=CascadeType.PERSIST,mappedBy="musicas",fetch=FetchType.LAZY)
	private List<Autor> autores = new ArrayList<Autor>();	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "musica")
	private List<MiniPost> miniposts = new ArrayList<MiniPost>();
	
	@ManyToMany
	private List<Usuario> usuarios = new ArrayList<Usuario>();
	

	@ManyToOne(cascade=CascadeType.ALL)
	private Estilo estilo;
	@ManyToOne(cascade=CascadeType.PERSIST)
	private Album album;

	@SuppressWarnings("unused")
	private int numusuarios;
	
	public Musica() {
	}

	public Musica(String nome, String arq) {
		this.nome = nome;
		this.caminhoarq = arq;
		numusuarios = this.usuarios.size();
	}	

	public Musica(String nome, String arq, Usuario u) {
		this.nome = nome;
		this.caminhoarq = arq;
		usuarios.add(u);
		u.addMusica(this);
		numusuarios = this.usuarios.size();		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void addUsuario(Usuario usuario) {
		usuarios.add(usuario);
	}

	public void removeUsuario(Usuario usuario) {
		usuarios.remove(usuario);
	}

	public Estilo getEstilo() {
		return estilo;
	}

	public void setEstilo(Estilo estilo) {
		this.estilo = estilo;
	}

	public List<Autor> getAutores() {
		return autores;
	}

	public void setAutores(List<Autor> autores) {
		this.autores = autores;
	}

	public void addAutor(Autor aut) {
		autores.add(aut);
	}

	public void removeAutor(Autor aut) {
		autores.remove(aut);
	}

	public void addMiniPost(MiniPost minipost) {
		this.miniposts.add(minipost);
	}
	public void removeMiniPost(MiniPost minipost) {
		this.miniposts.remove(minipost);
	}

	public String getCaminhoarq() {
		return caminhoarq;
	}

	public void setCaminhoarq(String caminhoarq) {
		this.caminhoarq = caminhoarq;
	}

	public int getNumusuarios() {
		return numusuarios = this.usuarios.size();
	}

	public void setNumusuarios(int numusuarios) {
		this.numusuarios = numusuarios;
	}	
}