package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Authentification database table.
 * 
 */
@Entity
@NamedQuery(name="Authentification.findAll", query="SELECT a FROM Authentification a")
public class Authentification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String login;

	private String password;

	//bi-directional one-to-one association to Employe
	@OneToOne
	@JoinColumn(name="login")
	private Employe employe;

	public Authentification() {
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Employe getEmploye() {
		return this.employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

}