package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Autor {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String nome;
	private String sobre;

	@ManyToMany(cascade=CascadeType.PERSIST,mappedBy="autores",fetch=FetchType.EAGER)
	private List<Estilo> estilos = new ArrayList<Estilo>();
	@ManyToMany
	private List<Musica> musicas = new ArrayList<Musica>();
	@ManyToMany(cascade=CascadeType.ALL,mappedBy="autores",fetch=FetchType.LAZY)
	private List<Album> albuns = new ArrayList<Album>();

	public Autor() {
		super();
	}

	public Autor(String nome) {
		this.nome = nome;
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

	public List<Estilo> getEstilos() {
		return estilos;
	}

	public void setEstilos(List<Estilo> estilos) {
		this.estilos = estilos;
	}

	public List<Musica> getMusicas() {
		return musicas;
	}

	public void setMusicas(List<Musica> musicas) {
		this.musicas = musicas;
	}

	public void addMusica(Musica musica) {
		this.musicas.add(musica);
	}
	public void removeMusica(Musica musica) {
		this.musicas.remove(musica);
	}

	public void addEstilo(Estilo estilo) {
		this.estilos.add(estilo);
	}

	public void removeEstilo(Estilo estilo) {
		this.estilos.remove(estilo);
	}

	public void addAlbum(Album album) {
		albuns.add(album);
	}

	public void removeAlbum(Album album) {
		albuns.remove(album);
	}
}
