package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * The persistent class for the Authentification database table.
 * 
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@NamedQuery(name="Authentification.findAll", query="SELECT a FROM Authentification a")
public class Authentification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String login;

	private String password;

	//bi-directional one-to-one association to Employe
	@OneToOne
	@PrimaryKeyJoinColumn(name="login")
	private Employe employe;
}