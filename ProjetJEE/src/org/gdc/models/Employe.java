package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


/**
 * The persistent class for the Employe database table.
 * 
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@NamedQuery(name="Employe.findAll", query="SELECT e FROM Employe e")
public class Employe implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String login;

	private String adresse;

	@Column(name="code_postal")
	private String codePostal;

	private String equipe;

	private String fonction;

	private String mail;

	private String nom;

	private String pnom;

	@Column(name="solde_congés")
	private int soldeCongés;

	private String ville;

	//bi-directional one-to-one association to Authentification
	@OneToOne(mappedBy="employe")
	private Authentification authentification;

	//bi-directional many-to-one association to Conge
	@OneToMany(mappedBy="employe")
	private List<Conge> conges;

	//bi-directional many-to-one association to Rendez_vous
	@OneToMany(mappedBy="employe")
	private List<Rendez_vous> rendezVouses;

}