package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique=true, nullable=false)
	private String login;

	@Column(nullable=false)
	private String senha;

	@Temporal(TemporalType.DATE)
	private Calendar datacriado;

	@OneToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, mappedBy = "usuario")
	private List<MiniPost> miniposts = new ArrayList<MiniPost>();
	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, mappedBy = "usuarios")
	private List<Musica> musicas = new ArrayList<Musica>();

	private String caminhofoto;

	public Usuario() {
	}

	public Usuario(String login, String senha) {
		this.login = login;
		this.senha = senha;
		this.datacriado = Calendar.getInstance();
	}


	public Usuario(String login, String senha, String caminhofoto) {
		super();
		this.login = login;
		this.senha = senha;
		this.datacriado = Calendar.getInstance();
		this.caminhofoto = caminhofoto;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public List<MiniPost> getMiniposts() {
		return miniposts;
	}

	public void setMiniposts(List<MiniPost> miniposts) {
		this.miniposts = miniposts;
	}

	public List<Musica> getMusicas() {
		return musicas;
	}

	public void setMusicas(List<Musica> musicas) {
		this.musicas = musicas;
	}

	public String getDatacriado() {
		String str;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		str = sdf.format(datacriado.getTime());
		return str;
	}

	public void addMusica(Musica musica) {
		musicas.add(musica);
	}

	public void removeMusica(Musica musica) {
		musicas.remove(musica);

	}
	public void addMiniPost(MiniPost minipost) {
		miniposts.add(minipost);
	}
	public void removeMiniPost(MiniPost minipost) {
		miniposts.remove(minipost);

	}

	public String getCaminhofoto() {
		return caminhofoto;
	}

	public void setCaminhofoto(String caminhofoto) {
		this.caminhofoto = caminhofoto;
	}

}
