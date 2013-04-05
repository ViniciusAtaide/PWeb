package model;

import java.io.IOException;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
public class Moderador extends Usuario {

	public Moderador() {
		super();
	}
	public Moderador(String login, String senha) {
		super(login,senha);
	}
	public Moderador(String login, String senha, String filepath) throws IOException {
		super(login,senha,filepath);
	}
}
