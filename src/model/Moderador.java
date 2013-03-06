package model;

import javax.persistence.*;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public class Moderador extends Usuario {

	public Moderador() {
		super();
	}
	public Moderador(String login, String senha) {
		super(login,senha);
	}
	public Moderador(String login, String senha, String caminho) {
		super(login,senha,caminho);
	}
}
