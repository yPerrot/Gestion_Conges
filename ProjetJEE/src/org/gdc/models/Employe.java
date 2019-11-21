package org.gdc.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Employe database table.
 * 
 */
@Entity
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

	public Employe() {
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCodePostal() {
		return this.codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getEquipe() {
		return this.equipe;
	}

	public void setEquipe(String equipe) {
		this.equipe = equipe;
	}

	public String getFonction() {
		return this.fonction;
	}

	public void setFonction(String fonction) {
		this.fonction = fonction;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPnom() {
		return this.pnom;
	}

	public void setPnom(String pnom) {
		this.pnom = pnom;
	}

	public int getSoldeCongés() {
		return this.soldeCongés;
	}

	public void setSoldeCongés(int soldeCongés) {
		this.soldeCongés = soldeCongés;
	}

	public String getVille() {
		return this.ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public Authentification getAuthentification() {
		return this.authentification;
	}

	public void setAuthentification(Authentification authentification) {
		this.authentification = authentification;
	}

	public List<Conge> getConges() {
		return this.conges;
	}

	public void setConges(List<Conge> conges) {
		this.conges = conges;
	}

	public Conge addConge(Conge conge) {
		getConges().add(conge);
		conge.setEmploye(this);

		return conge;
	}

	public Conge removeConge(Conge conge) {
		getConges().remove(conge);
		conge.setEmploye(null);

		return conge;
	}

	public List<Rendez_vous> getRendezVouses() {
		return this.rendezVouses;
	}

	public void setRendezVouses(List<Rendez_vous> rendezVouses) {
		this.rendezVouses = rendezVouses;
	}

	public Rendez_vous addRendezVous(Rendez_vous rendezVous) {
		getRendezVouses().add(rendezVous);
		rendezVous.setEmploye(this);

		return rendezVous;
	}

	public Rendez_vous removeRendezVous(Rendez_vous rendezVous) {
		getRendezVouses().remove(rendezVous);
		rendezVous.setEmploye(null);

		return rendezVous;
	}

}