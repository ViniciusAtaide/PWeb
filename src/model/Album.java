package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
public class Album {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String nome;
	private String sobre;
	
	@OneToMany(cascade=CascadeType.PERSIST,fetch=FetchType.LAZY,mappedBy="album")
	private List<Musica> musicas = new ArrayList<Musica>();
	@ManyToMany
	private List<Autor> autores = new ArrayList<Autor>();
	@ManyToOne
	private Estilo estilo;

	public Album() {}
	
	public Album(String nome, String sobre) {
		this.nome = nome;
		this.sobre = sobre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSobre() {
		return sobre;
	}

	public void setSobre(String sobre) {
		this.sobre = sobre;
	}

	public List<Musica> getMusicas() {
		return musicas;
	}

	public void setMusicas(List<Musica> musicas) {
		this.musicas = musicas;
	}

	public List<Autor> getAutores() {
		return autores;
	}

	public void setAutores(List<Autor> autores) {
		this.autores = autores;
	}

	public Estilo getEstilo() {
		return estilo;
	}

	public void setEstilo(Estilo estilo) {
		this.estilo = estilo;
	}
	public void addMusica(Musica musica) {
		this.musicas.add(musica);
	}
	public void removeMusica(Musica musica) {
		this.musicas.add(musica);
	}
	public void addAutor(Autor autor) {
		autores.add(autor);
	}
	public void removeAutor(Autor autor) {
		autores.remove(autor);
	}
	
}
